import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Basket/basketGeneralController.dart';
import '../../../../../Core/Controller/Basket/deliveryAddressController.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';

class BasketController extends GetxController {

  /// TODO: Expected Condition >>> User donations were not added here because they were treated as a regular donation, but if they were dealt with separately, they must be added here.

  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  final BasketGeneralControllerX basketGeneral = Get.find();
  final DeliveryAddressControllerX deliveryAddressController = Get.find();

  //============================================================================
  // Variables

  /// Text Field
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction;
  RxMap<String, TextEditingController> donationPriceController =
      <String, TextEditingController>{}.obs;
  RxMap<String, TextEditingController> dedicationDonationAmountController =
      <String, TextEditingController>{}.obs;

  /// Basket Items
  List<DonationX> donations = [];
  RxList<DonationRecordX> donationRecords = <DonationRecordX>[].obs;
  RxList<DedicationX> dedications = <DedicationX>[].obs;
  List<DedicationTypeX> dedicationTypes = [];
  RxList<GuaranteeX> guarantees = <GuaranteeX>[].obs;
  List<ProductX> products = [];
  RxList<OrderProductX> orderProducts = <OrderProductX>[].obs;

  /// Basket Money
  RxInt basketSummary = 0.obs;
  RxInt shippingCharges = 0.obs;

  /// Basket Process
  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  //============================================================================
  // Functions

  //----------------------------------------------------------------------------
  // Calculate

  /// Calculate the basket amount
  calculateBasketSummary() {
    int result = 0;

    /// Donations
    for (var element in donationRecords) {
      DonationX donation = getDonationById(element.donationID);
      if (element.numStock != null && donation.stockValue != null) {
        result += element.numStock! * donation.stockValue!;
      }
      if (element.donationAmount != null) {
        result += element.donationAmount!;
      }
    }

    /// Products
    for (var element in orderProducts) {
      ProductX product = getProductById(element.productID);
      result += element.numProduct * product.price;
    }

    /// Dedications
    for (var element in dedications) {
      result += element.donationAmount;
    }

    /// Guarantees
    for (var element in guarantees) {
      result += element.donationAmount;
    }

    basketSummary.value = result;
  }

  /// Calculate the total basket amount with the shipping price
  int calculateTotalBasket() {
    if (orderProducts.isNotEmpty) {
      return basketSummary.value + shippingCharges.value;
    } else {
      return basketSummary.value;
    }
  }

  //----------------------------------------------------------------------------
  // Get Data & Initialization

  getData() async {
    try {
      /// TODO: Database >>> Fetch basket items
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// TODO: Delete >>> After linking to the database
      // --- delete from here ---
      donationRecords.value = TestDataX.donationsRecords;
      orderProducts.value = TestDataX.orderProducts;
      dedications.value = TestDataX.dedications;
      dedicationTypes = TestDataX.dedicationTypes;

      guarantees.value = TestDataX.guarantees.sublist(0, 3);
      donations = TestDataX.donations.sublist(0, 3);
      products = TestDataX.products.sublist(0, 3);
      // --- to here ---

      createPriceControllers();
      calculateBasketSummary();

      if (orderProducts.isNotEmpty) {
        /// TODO: Database >>> Fetch shipping charges
        shippingCharges.value = 10;
      }

      /// Get delivery data if available
      await deliveryAddressController.getData();

      /// update number items for icon basket badge
      basketGeneral.numItemsBadge.value = donationRecords.length +
          orderProducts.length +
          dedications.length +
          guarantees.length;
    } catch (e) {
      return Future.error(e);
    }
  }

  createPriceControllers() {
    /// Donation Price
    donationPriceController.value = {};
    for (var element
        in donationRecords.where((e) => e.donationAmount != null)) {
      donationPriceController[element.id] = TextEditingController(
        text: element.donationAmount.toString(),
      );
    }

    /// Dedication Donation Amount
    dedicationDonationAmountController.value = {};
    for (var element in dedications) {
      dedicationDonationAmountController[element.id] = TextEditingController(
        text: element.donationAmount.toString(),
      );
    }
  }

  //----------------------------------------------------------------------------
  // Pay

  /// Verify the entered data
  bool dataVerification() {
    if (orderProducts.isNotEmpty &&
        deliveryAddressController.isHasData.value == false) {
      // check delivery data
      return throw "Delivery data must be entered";
    } else if (!formKey.currentState!.validate()) {
      // check text fields
      autoValidate = AutovalidateMode.always;
      return throw "Check the donation entry fields";
    }
    return true;
  }

  onPay() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification()) {
          isLoading.value = true;
          buttonState.value = ButtonStateEX.loading;

          /// TODO: Database >>> Create a connection to start the payment process
          /// TODO: Payment >>> Go to the payment screen
          /// TODO: Database >>> Send a response from the payment screen and complete the process
          await Future.delayed(const Duration(seconds: 1));

          /// reset all variables
          donations = [];
          donationRecords.value = [];
          products = [];
          orderProducts.value = [];
          dedications.value = [];
          guarantees.value = [];
          dedicationTypes = [];
          basketSummary.value = 0;
          shippingCharges.value = 0;

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// update number items for icon basket badge
          basketGeneral.numItemsBadge.value = 0;

          ToastX.success(message: "The payment was completed successfully");
        }
      } catch (error) {
        ToastX.error(message: error);
        buttonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          buttonState.value = ButtonStateEX.normal;
        },
      );
    }
  }

  //----------------------------------------------------------------------------
  // Donation

  getDonationById(String id) => donations.firstWhere((e) => e.id == id);

  onDeleteDonationItem(DonationRecordX basketItem) async {
    try {
      /// TODO: Database >>> Delete Donation Item on basket
      donations.removeWhere((e) => e.id == basketItem.donationID);
      donationPriceController.removeWhere((key, val) => key == basketItem.id);
      donationRecords.remove(basketItem);
      calculateBasketSummary();

      /// update number items for icon basket badge
      basketGeneral.numItemsBadge.value--;
    } catch (e) {
      return Future.error(e);
    }
  }

  onChangedDonationPrice(DonationRecordX basketItem, String price) async {
    if (ValidateX.money(price) == null) {
      try {
        /// TODO: Database >>> Change Donation Price on basket
        int index = donationRecords.indexOf(basketItem);
        donationRecords[index].donationAmount = int.parse(price);
        calculateBasketSummary();
      } catch (e) {
        return Future.error(e);
      }
    }
  }

  onChangedPackage(DonationRecordX basketItem, String newPackage) async {
    try {
      /// TODO: Database >>> Change Donation package on basket
      int index = donationRecords.indexOf(basketItem);
      donationRecords[index].package = newPackage;
    } catch (e) {
      return Future.error(e);
    }
  }

  onChangeNumStock(DonationRecordX basketItem, int newNumStock) async {
    try {
      /// TODO: Database >>> Change Donation Number Stock on basket
      int index = donationRecords.indexOf(basketItem);
      donationRecords[index].numStock = newNumStock;
      /// Solution to the problem of the screen element not updating, the problem is from GetX
      donationRecords[index] = donationRecords[index];
      calculateBasketSummary();
      update();
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Product

  getProductById(String id) => products.firstWhere((e) => e.id == id);

  onDeleteProductItem(OrderProductX productItem) async {
    try {
      /// TODO: Database >>> Delete Product Item on basket
      orderProducts.remove(productItem);
      products.removeWhere((e) => e.id == productItem.productID);
      calculateBasketSummary();

      /// update number items for icon basket badge
      basketGeneral.numItemsBadge.value--;
    } catch (e) {
      return Future.error(e);
    }
  }

  onChangeProductNum(OrderProductX productItem, int newNum) async {
    try {
      /// TODO: Database >>> Change Change Product Number on basket
      int index = orderProducts.indexOf(productItem);
      orderProducts[index].numProduct = newNum;
      /// Solution to the problem of the screen element not updating, the problem is from GetX
      orderProducts[index] = orderProducts[index];
      calculateBasketSummary();
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Dedication
  getDedicationTypeById(String id) =>
      dedicationTypes.firstWhere((e) => e.id == id);

  onDeleteDedicationItem(DedicationX dedication) async {
    try {
      /// TODO: Database >>> Delete Dedication Item on basket
      dedications.remove(dedication);

      dedicationDonationAmountController
          .removeWhere((key, val) => key == dedication.id);

      calculateBasketSummary();

      /// update number items for icon basket badge
      basketGeneral.numItemsBadge.value--;
    } catch (e) {
      return Future.error(e);
    }
  }

  onChangedDedicationDonationAmount(
    DedicationX dedication,
    String price,
  ) async {
    if (ValidateX.money(price) == null) {
      try {
        /// TODO: Database >>> Change Dedication Donation Amount on basket
        int index = dedications.indexOf(dedication);
        dedications[index].donationAmount = int.parse(price);
        calculateBasketSummary();
      } catch (e) {
        return Future.error(e);
      }
    }
  }

  //----------------------------------------------------------------------------
  // Guarantee

  onDeleteGuaranteeItem(GuaranteeX guarantee) async {
    try {
      /// TODO: Database >>> Delete Guarantee Item on basket
      guarantees.remove(guarantee);

      calculateBasketSummary();

      /// update number items for icon basket badge
      basketGeneral.numItemsBadge.value--;
    } catch (e) {
      return Future.error(e);
    }
  }


}
