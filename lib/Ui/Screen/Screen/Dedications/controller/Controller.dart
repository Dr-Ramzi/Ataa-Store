import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Basket/basketGeneralController.dart';
import '../../../../../Core/Controller/Other/detailsOfHisDedicateController.dart';
import '../../../../../Core/Controller/Other/previewDedicateController.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';
import '../../../../ScreenSheet/Other/DetailsOfHisDedicate/detailsOfHisDedicateSheet.dart';
import '../../../../ScreenSheet/Other/MandatoryAuth/mandatoryAuth.dart';
import '../../../../ScreenSheet/Other/PreviewDedicate/previewDedicateSheet.dart';

class DedicationsController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  BasketGeneralControllerX basketController = Get.find();
  DetailsOfHisDedicateController detailsOfHisDedicateController =
      Get.put(DetailsOfHisDedicateController());
  PreviewDedicateControllerX previewDedicateController =
      Get.put(PreviewDedicateControllerX());

  //============================================================================
  // Variables

  DedicationX dedication = DedicationX.empty();

  List<String> colors = [];
  List<DedicationTypeX> types = [];
  List<DedicationCardX> cards = [];
  List<OrganizationX> organizations = [];

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController donationAmount = TextEditingController();
  TextEditingController date = TextEditingController();

  RxBool isShowAmount = false.obs;
  RxBool isSendToMe = false.obs;
  RxBool isSendLater = false.obs;
  Rx<DateTime?> sendLaterDate = Rx<DateTime?>(null);

  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> addToCartButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> dedicationButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> previewButtonState = ButtonStateEX.normal.obs;

  RxInt typeSelectedIndex = (-1).obs;
  RxInt cardSelectedIndex = (-1).obs;
  RxInt colorSelectedIndex = 0.obs;
  RxInt orgSelectedIndex = (-1).obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch Dedications [ Types + Cards + Colors ]
      /// TODO: Database >>> Fetch Organizations
      await Future.delayed(const Duration(seconds: 1)); // delete this

      types = TestDataX.dedicationTypes;
      cards = TestDataX.dedicationCards;
      colors = TestDataX.dedicationColors;
      organizations = TestDataX.organizations;
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Change

  onChangeType(index) => typeSelectedIndex.value = index;
  onChangeCard(index) => cardSelectedIndex.value = index;
  onChangeColor(index) => colorSelectedIndex.value = index;
  onChangeOrg(index) => orgSelectedIndex.value = index;
  onChangeShowAmount(bool val) => isShowAmount.value = val;
  onChangeSendToMe(bool val) => isSendToMe.value = val;
  onChangeSendLater(bool val) => isSendLater.value = val;
  onChangeDate(DateTime? date) => sendLaterDate.value = date;
  onChangeDonationAmount(int val) => donationAmount.text = val.toString();

  //----------------------------------------------------------------------------
  // Other

  onTapDetailsDedicate() =>
      detailsOfHisDedicateSheetX(controller: detailsOfHisDedicateController);

  //----------------------------------------------------------------------------
  // Auxiliary functions

  /// Erase all data and return it to its default state
  clearData() {
    dedication = DedicationX.empty();
    donationAmount.text = "";
    date.text = "";
    isShowAmount.value = false;
    isSendToMe.value = false;
    isSendLater.value = false;
    sendLaterDate.value = null;

    typeSelectedIndex.value = -1;
    cardSelectedIndex.value = -1;
    colorSelectedIndex.value = 0;
    orgSelectedIndex.value = -1;
    autoValidate = AutovalidateMode.disabled;
    detailsOfHisDedicateController.clearData();
  }

  /// Verify the entered data
  bool dataVerification({bool isPreview = false}) {
    /// Mandatory login before paying zakat
    if (!isPreview && !app.isLogin.value) {
      mandatoryAuthSheetX();
      return false;
    } else if (typeSelectedIndex.value < 0) {
      return throw "You must choose the type of gift";
    } else if (cardSelectedIndex.value < 0) {
      return throw "You must choose the shape of the gift card";
    } else if (orgSelectedIndex.value < 0) {
      return throw "You must choose the field of donation";
    } else if (!formKey.currentState!.validate()) {
      autoValidate = AutovalidateMode.always;
      return throw "Make sure you enter a valid value in donation amount";
    } else if (!isPreview && isSendLater.value && sendLaterDate.value == null) {
      return throw "You must enter the date the gift was sent";
    } else if (!detailsOfHisDedicateController.dataVerification()) {
      return throw "The dedicates information must be entered";
    } else {
      return true;
    }
  }

  //----------------------------------------------------------------------------
  // Main processors

  onDedication() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification()) {
          isLoading.value = true;
          dedicationButtonState.value = ButtonStateEX.loading;

          _fillDedicateInformation();

          // TODO: Database >>> Create a connection to start the payment process
          // TODO: Payment >>> Go to the payment screen
          // TODO: Database >>> Send a response from the payment screen and complete the process
          await Future.delayed(const Duration(seconds: 1));

          /// The time delay here is aesthetically beneficial
          dedicationButtonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          clearData();
          ToastX.success(message: "Successfully dedicated");

          isLoading.value = false;
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        dedicationButtonState.value = ButtonStateEX.failed;
      }

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          dedicationButtonState.value = ButtonStateEX.normal;
        },
      );
    }
  }

  onAddToCart() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification()) {
          isLoading.value = true;
          addToCartButtonState.value = ButtonStateEX.loading;

          _fillDedicateInformation();

          /// Connect to basket Controller to add to cart in database
          await basketController.addDedication(dedication);

          /// The time delay here is aesthetically beneficial
          addToCartButtonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          clearData();
          ToastX.success(message: "Added to cart successfully");

          isLoading.value = false;
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        addToCartButtonState.value = ButtonStateEX.failed;
      }

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          addToCartButtonState.value = ButtonStateEX.normal;
        },
      );
    }
  }

  _fillDedicateInformation() {
    dedication.typeID = types[typeSelectedIndex.value].id;
    dedication.cardID = types[typeSelectedIndex.value].id;
    dedication.orgID = types[typeSelectedIndex.value].id;
    dedication.donationAmount = int.parse(donationAmount.text);
    dedication.isShowAmount = isShowAmount.value;
    dedication.isSendToMe = isSendToMe.value;
    dedication.isSendLater = isSendLater.value;
    dedication.sendLaterDate = sendLaterDate.value;

    dedication.mahdiName = detailsOfHisDedicateController.donorName.text;
    dedication.name = detailsOfHisDedicateController.giftedName.text;
    dedication.gender = detailsOfHisDedicateController.gender.value;
    dedication.phone = detailsOfHisDedicateController.giftedPhone.text;
    dedication.countryCode = detailsOfHisDedicateController.countryCode.value;
  }

  onPreviewDedicate() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification(isPreview: true)) {
          isLoading.value = true;
          _fillDedicateInformation();
          previewDedicateController.dedication = dedication;
          await previewDedicateSheetX(controller: previewDedicateController);
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        previewButtonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          previewButtonState.value = ButtonStateEX.normal;
        },
      );
    }
  }
}
