import 'dart:async';
import 'package:ataa/Core/Extension/convert/convert.dart';
import 'package:ataa/Data/Enum/gift_color_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Basket/basketGeneralController.dart';
import '../../../../../Core/Controller/Other/detailsOfHisDedicateController.dart';
import '../../../../../Core/Controller/Other/previewDedicateController.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/Model/Gifting/giftCategory.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';
import '../../../../ScreenSheet/Other/DetailsOfHisDedicate/detailsOfHisDedicateSheet.dart';
import '../../../../ScreenSheet/Other/MandatoryAuth/mandatoryAuth.dart';
import '../../../../ScreenSheet/Other/PreviewDedicate/previewDedicateSheet.dart';

class GiftingController extends GetxController {
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

  GiftingX gifting = GiftingX.empty();

  List<String> colors = [];
  List<GiftCategoryX> giftCategories = [];
  List<GiftingCardX> cards = [];
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
  Rx<ButtonStateEX> giftingButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> previewButtonState = ButtonStateEX.normal.obs;

  RxInt typeSelectedIndex = (-1).obs;
  RxInt cardSelectedIndex = (-1).obs;
  RxInt colorSelectedIndex = 0.obs;
  RxInt orgSelectedIndex = (-1).obs;

  RxInt freeDonationSelected = 0.obs;


  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  late Rx<String> gender = "male".obs;
  RxInt countryCode = 966.obs;

  final FlutterContactPicker contactPicker = FlutterContactPicker();

  GlobalKey<FormState> formKey2 = GlobalKey();
  AutovalidateMode autoValidate2 = AutovalidateMode.disabled;

  /// The name Mahdi is fetched through the username
  late TextEditingController donorName =
  TextEditingController(text: app.isLogin.value ? app.user.value!.name : "");
  TextEditingController giftedName = TextEditingController();
  TextEditingController giftedPhone = TextEditingController();

  //============================================================================
  // Functions

  Future<void> getData() async {
    try {
      // giftCategories = await DatabaseX.getAllGiftCategories();
      // cards = TestDataX.giftingCardX;
      // colors = GiftColorStatusX.values.map((e) => e.code.substring(1)).toList();
      // if (giftCategories.isNotEmpty) {
      //   organizations = (await DatabaseX.getGiftCategoryDetails(
      //           id: giftCategories.first.id))
      //       .donationCategories;
      // }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<GiftCategoryX>> getGiftCategories(
    ScrollRefreshLoadMoreParametersX data,
  ) async {
    return await DatabaseX.getAllGiftCategories(
      page: data.page,
      perPage: data.perPage,
    );
  }

  //----------------------------------------------------------------------------
  // Change

  onChangeType(index) {
    typeSelectedIndex.value = index;
    update();
  }

  onChangeCard(index) => cardSelectedIndex.value = index;
  onChangeColor(index) => colorSelectedIndex.value = index;
  onChangeOrg(index) => orgSelectedIndex.value = index;
  onChangeShowAmount(bool val) => isShowAmount.value = val;
  onChangeSendToMe(bool val) => isSendToMe.value = val;
  onChangeSendLater(bool val) => isSendLater.value = val;
  onChangeDate(DateTime? date) => sendLaterDate.value = date;
  onChangeDonationAmount(int val) {
    donationAmount.text = val.toString();
    freeDonationSelected.value = val;
  }

  removeFreeDonationSelected(_) {
    if (freeDonationSelected.value != 0) {
      freeDonationSelected.value = 0;
    }
  }

  //----------------------------------------------------------------------------
  // Other
  onChangeGender(String? value) => gender.value = value!;

  onChangeCountryCode(String val) => countryCode.value = int.parse(val);

  /// Get the Mahdi's information from his contacts
  onPhoneFromContacts() async {
    try {
      Contact? contact = await contactPicker.selectContact();
      if (contact != null) {
        /// If name is empty, it returns the previous value
        giftedName.text = contact.fullName ?? giftedName.text;

        /// To check if there is a phone number and then check if this number is empty or not
        if (contact.phoneNumbers != null && contact.phoneNumbers!.isNotEmpty) {
          /// Separate the phone number from the country code
          var result = FunctionX.extractCountryCodeAndPhoneNumber(
            contact.phoneNumbers![0],
          );
          /// Assign a value to the phone number because it cannot be empty
          giftedPhone.text = result.$1;

          /// If name is empty, it returns the previous value
          countryCode.value = result.$2 ?? countryCode.value;
        }
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Other

  onTapDetailsDedicate() =>
      detailsOfHisDedicateSheetX(controller: detailsOfHisDedicateController);

  //----------------------------------------------------------------------------
  // Auxiliary functions

  /// Erase all data and return it to its default state
  clearData() {
    gifting = GiftingX.empty();
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
    update();
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

  onGifting() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification()) {
          isLoading.value = true;
          giftingButtonState.value = ButtonStateEX.loading;

          _fillDedicateInformation();

          // TODO: Database >>> Create a connection to start the payment process
          // TODO: Payment >>> Go to the payment screen
          // TODO: Database >>> Send a response from the payment screen and complete the process
          await Future.delayed(const Duration(seconds: 1));

          /// The time delay here is aesthetically beneficial
          giftingButtonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          clearData();
          ToastX.success(message: "Successfully dedicated");

          isLoading.value = false;
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        giftingButtonState.value = ButtonStateEX.failed;
      }

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          giftingButtonState.value = ButtonStateEX.normal;
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
          await basketController.addGifting(gifting);

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
    gifting.typeID = giftCategories[typeSelectedIndex.value].id;
    gifting.cardID = giftCategories[typeSelectedIndex.value].id;
    gifting.orgID = giftCategories[typeSelectedIndex.value].id;
    gifting.donationAmount = int.parse(donationAmount.text);
    gifting.isShowAmount = isShowAmount.value;
    gifting.isSendToMe = isSendToMe.value;
    gifting.isSendLater = isSendLater.value;
    gifting.sendLaterDate = sendLaterDate.value;

    gifting.mahdiName = detailsOfHisDedicateController.donorName.text;
    gifting.name = detailsOfHisDedicateController.giftedName.text;
    gifting.gender = detailsOfHisDedicateController.gender.value;
    gifting.phone = detailsOfHisDedicateController.giftedPhone.text.toIntX;
    gifting.countryCode = detailsOfHisDedicateController.countryCode.value;
  }

  onPreviewDedicate() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification(isPreview: true)) {
          isLoading.value = true;
          _fillDedicateInformation();
          previewDedicateController.gifting = gifting;
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
