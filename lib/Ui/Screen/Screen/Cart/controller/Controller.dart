import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Cart/cartGeneralController.dart';
import '../../../../../Core/Controller/Cart/deliveryAddressController.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/Model/Gifting/giftCategory.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';

class CartController extends GetxController {

  /// TODO: Expected Condition >>> User donations were not added here because they were treated as a regular donation, but if they were dealt with separately, they must be added here.

  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  final CartGeneralControllerX basketGeneral = Get.find();
  final DeliveryAddressControllerX deliveryAddressController = Get.find();

  //============================================================================
  // Variables

  /// Text Field
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction;
  RxMap<String, TextEditingController> donationPriceController =
      <String, TextEditingController>{}.obs;
  RxMap<String, TextEditingController> giftingDonationAmountController =
      <String, TextEditingController>{}.obs;

  /// Cart Items
  List<DonationX> donations = [];
  RxList<DonationRecordX> donationRecords = <DonationRecordX>[].obs;
  RxList<GiftingX> gifting = <GiftingX>[].obs;
  List<GiftCategoryX> giftingTypes = [];
  RxList<SponsorshipX> sponsorships = <SponsorshipX>[].obs;
  List<ProductX> products = [];
  RxList<OrderProductX> orderProducts = <OrderProductX>[].obs;

  /// Cart Money
  RxInt basketSummary = 0.obs;
  RxInt shippingCharges = 0.obs;

  /// Cart Process
  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  //============================================================================
  // Functions

  //----------------------------------------------------------------------------

  /// Calculate the total basket amount with the shipping price
  int calculateTotalCart() {
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
      /// Get Cart Data
      await basketGeneral.getData();

      /// Get delivery data if available
      await deliveryAddressController.getData();

      /// TODO: Delete >>> After linking to the database
      // --- delete from here ---
      // donationRecords.value = TestDataX.donationsRecords;
      // orderProducts.value = TestDataX.orderProducts;
      // gifting.value = TestDataX.gifting;
      // giftingTypes = TestDataX.giftingTypes;
      //
      // sponsorships.value = TestDataX.sponsorships.sublist(0, 3);
      // products = TestDataX.products.sublist(0, 3);
      // --- to here ---

      createPriceControllers();

      if (orderProducts.isNotEmpty) {
        /// TODO: Database >>> Fetch shipping charges
        shippingCharges.value = 10;
      }

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

    /// Gifting Donation Amount
    giftingDonationAmountController.value = {};
    for (var element in gifting) {
      giftingDonationAmountController[element.id] = TextEditingController(
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
          gifting.value = [];
          sponsorships.value = [];
          giftingTypes = [];
          basketSummary.value = 0;
          shippingCharges.value = 0;

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// update number items for icon basket badge
          // basketGeneral.cart.value.countItem = 0;

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
      donations.removeWhere((e) => e.id == basketItem.donationId);
      donationPriceController.removeWhere((key, val) => key == basketItem.id);
      donationRecords.remove(basketItem);
      // calculateCartSummary();

      /// update number items for icon basket badge
      // basketGeneral.cart.value.countItem--;
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
        // calculateCartSummary();
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
      // calculateCartSummary();
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
      // calculateCartSummary();

      /// update number items for icon basket badge
      // basketGeneral.cart.value.countItem--;
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
      // calculateCartSummary();
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Gifting
  getGiftingTypeById(String id) =>
      giftingTypes.firstWhere((e) => e.id == id);

  onDeleteGiftingItem(GiftingX val) async {
    try {
      /// TODO: Database >>> Delete Gifting Item on basket
      gifting.remove(val);

      giftingDonationAmountController
          .removeWhere((key, _) => key == val.id);

      // calculateCartSummary();

      /// update number items for icon basket badge
      // basketGeneral.cart.value.countItem--;
    } catch (e) {
      return Future.error(e);
    }
  }

  onChangedGiftingDonationAmount(
    GiftingX val,
    String price,
  ) async {
    if (ValidateX.money(price) == null) {
      try {
        /// TODO: Database >>> Change Gifting Donation Amount on basket
        int index = gifting.indexOf(val);
        gifting[index].donationAmount = int.parse(price);
        // calculateCartSummary();
      } catch (e) {
        return Future.error(e);
      }
    }
  }

  //----------------------------------------------------------------------------
  // Sponsorship

  onDeleteSponsorshipItem(SponsorshipX sponsorship) async {
    try {
      /// TODO: Database >>> Delete Sponsorship Item on basket
      sponsorships.remove(sponsorship);

      // calculateCartSummary();

      /// update number items for icon basket badge
      // basketGeneral.cart.value.countItem--;
    } catch (e) {
      return Future.error(e);
    }
  }


}
