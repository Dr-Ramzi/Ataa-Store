import 'dart:async';
import 'package:get/get.dart';
import '../../../Config/config.dart';
import '../../../Data/data.dart';
import '../../../Ui/ScreenSheet/Selection/Donation/donationSelectionSheet.dart';
import '../../../Ui/Widget/widget.dart';
import '../SelectedOptions/donationSelectionController.dart';

class AddShareLinkControllerX extends GetxController {
  //============================================================================
  // Injection of required controls

  DonationSelectionControllerX donationOpportunityController =
      Get.put(DonationSelectionControllerX());

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  //============================================================================
  // Functions

  onTapChooseDonation() =>
      donationSelectionSheetX(controller: donationOpportunityController);

  /// Erase all data and return it to its default state
  clearData() {
    donationOpportunityController.donationSelected.value = null;
  }

  onCreateLink() async {
    if (isLoading.isFalse) {
      if (donationOpportunityController.donationSelected.value != null) {
        isLoading.value = true;
        buttonState.value = ButtonStateEX.loading;
        try {
          // TODO: Database >>> Add a share link to the database
          await Future.delayed(const Duration(seconds: 1)); // delete this

          /// Create a share link object
          ShareLinkX shareLink = ShareLinkX(
            id: "",
            link: "",
            numDonors: 0,
            numRegistered: 0,
            numVisits: 0,
            totalDonations: 0,
            donationID:
                donationOpportunityController.donationSelected.value!.id,
            donationName:
                donationOpportunityController.donationSelected.value!.name,
          );

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// This controller form bottom sheet
          Get.back(result: shareLink);
          ToastX.success(
            message: "The sharing link has been created successfully",
          );

          /// Clear data on the controller
          clearData();
        } catch (error) {
          ToastX.error(message: error.toString());
          buttonState.value = ButtonStateEX.failed;
        }
        isLoading.value = false;
      } else {
        ToastX.error(message: "You must choose one of the donations");
        buttonState.value = ButtonStateEX.failed;
      }

      /// Reset the button state
      Timer(const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
          () {
        buttonState.value = ButtonStateEX.normal;
      });
    }
  }
}
