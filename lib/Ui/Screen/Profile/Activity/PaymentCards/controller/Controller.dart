import 'package:get/get.dart';
import '../../../../../../Core/Controller/Create/addPaymentCardController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Create/AddPaymentCard/addPaymentCardSheet.dart';
import '../../../../../Widget/widget.dart';

class PaymentCardsController extends GetxController {
  //============================================================================
  // Injection of required controls

  final AddPaymentCardControllerX addPaymentCardController =
      Get.put(AddPaymentCardControllerX());

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  RxList<PaymentCardX> paymentCards = <PaymentCardX>[].obs;

  /// To control the display of the waiting element within the specified card
  RxList<bool> isLoadingSetDefault = <bool>[].obs;
  RxList<bool> isLoadingDelete = <bool>[].obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// Clear previously saved data if you restart this function again
      isLoadingSetDefault.value = [];
      isLoadingDelete.value = [];

      paymentCards.value = await DatabaseX.getAllPaymentCards();

      /// Initialize variables with the number of cards
      for (int i = 0; i < paymentCards.length; i++) {
        isLoadingSetDefault.add(false);
        isLoadingDelete.add(false);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Main processors

  onAddPaymentCard() async {
    if (isLoading.isFalse) {
      isLoading.value = true;
      try {
        /// A sheet is displayed below for entering data and creating a new card
        PaymentCardX? newCard = await addPaymentCardSheetX(controller: addPaymentCardController);

        /// It is checked whether a card has been created or not
        if (newCard != null) {
          /// Add to card list
          paymentCards.add(newCard);

          /// Adding variables to control the waiting process for the new card
          isLoadingDelete.add(false);
          isLoadingSetDefault.add(false);

          if(newCard.isDefault){
            /// It checks if the new card is set as a default card and updates the data internally without connecting to the database
            int oldDefaultIndex = paymentCards.indexWhere((x) => x.isDefault);
            if (oldDefaultIndex != -1) {
              paymentCards[oldDefaultIndex].isDefault = false;
            }
          }
        }
      } catch (e) {
        ToastX.error(message: e.toString());
      }
      isLoading.value = false;
    }
  }

  /// Set one of the cards as default
  onSetDefault(String id ,int index) async {
    if (isLoading.isFalse) {
      isLoading.value = true;
      isLoadingSetDefault[index] = true;
      try {

        await DatabaseX.updatePaymentCardSetAsDefault(cardId: id);

        /// Find the previous virtual card
        int oldDefaultIndex = paymentCards.indexWhere((x) => x.isDefault);
        /// If it is found, its status is changed
        if (oldDefaultIndex != -1) {
          paymentCards[oldDefaultIndex].isDefault = false;
        }
        /// The default card is set internally
        paymentCards[index].isDefault = true;

        ToastX.success(
          message: "The card has been successfully set as default",
        );
      } catch (e) {
        ToastX.error(message: e.toString());
      }
      isLoadingSetDefault[index] = false;
      isLoading.value = false;
    }
  }

  /// Delete one of the cards
  onDeleteCard(String id ,int index) async {
    try {
      if (isLoading.isFalse) {
        isLoading.value = true;
        isLoadingDelete[index] = true;
        try {

          await DatabaseX.deletePaymentCard(cardId: id);

          /// Delete card data from variables
          paymentCards.removeAt(index);
          isLoadingDelete.removeAt(index);
          isLoadingSetDefault.removeAt(index);

          ToastX.success(message: "The card has been successfully deleted");
        } catch (e) {
          ToastX.error(message: e.toString());
        }
        isLoadingDelete[index] = false;
        isLoading.value = false;
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
