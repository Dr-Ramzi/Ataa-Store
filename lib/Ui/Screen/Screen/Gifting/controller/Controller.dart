import 'dart:async';
import 'package:ataa/Data/Enum/gift_color_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Cart/cartGeneralController.dart';
import '../../../../../Core/Controller/Other/previewDedicateController.dart';
import '../../../../../Core/Error/error.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/Model/Gifting/giftCardFormByGender.dart';
import '../../../../../Data/Model/Gifting/giftCategory.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';
import '../../../../ScreenSheet/Other/PreviewDedicate/previewDedicateSheet.dart';

class GiftingController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  CartGeneralControllerX basketController = Get.find();
  PreviewDedicateControllerX previewDedicateController =
      Get.put(PreviewDedicateControllerX());

  //============================================================================
  // Variables

  late GiftingX gifting;

  /// Loading
  RxBool isLoading = false.obs;
  RxBool isLoadingForGetGiftCategoryDetails = false.obs;
  Rx<ButtonStateEX> addToCartButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> giftingButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> previewButtonState = ButtonStateEX.normal.obs;

  /// Data
  final List<String> colors =
      GiftColorStatusX.values.map((e) => e.code.substring(1)).toList();
  RxList<GiftCategoryX> giftCategories = <GiftCategoryX>[].obs;
  RxList<OrganizationX> organizations = <OrganizationX>[].obs;

  /// Input
  GlobalKey<FormState> formKeyDonationAmount = GlobalKey();
  AutovalidateMode autoValidateDonationAmount = AutovalidateMode.disabled;
  GlobalKey<FormState> formKeyPhoneSendToMe = GlobalKey();
  AutovalidateMode autoValidatePhoneSendToMe = AutovalidateMode.disabled;
  GlobalKey<FormState> formKeyForDedicatesData = GlobalKey();
  AutovalidateMode autoValidateForDedicatesData = AutovalidateMode.disabled;
  TextEditingController donationAmount = TextEditingController();
  TextEditingController date = TextEditingController();

  /// Options
  RxBool isShowAmount = false.obs;

  RxBool isSendToMe = false.obs;
  TextEditingController phoneSendToMe = TextEditingController();
  int countryCodeForSendToMe = 966;

  RxBool isSendLater = false.obs;
  Rx<DateTime?> sendLaterDate = Rx<DateTime?>(null);

  /// Selected
  RxInt colorSelectedIndex = 0.obs;
  late Rx<GiftCategoryX> giftCategorySelected;
  Rx<GiftCardFormByGenderX?> giftCardFormByGenderSelected = Rx(null);
  Rx<OrganizationX?> orgSelected = Rx(null);
  RxInt freeDonationSelected = 0.obs;
  Rx<String> gender = "male".obs;
  RxInt countryCode = 966.obs;

  /// For Card
  RxString donorNameForCard = ''.obs;
  RxString giftedNameForCard = ''.obs;
  RxString donationAmountForCard = ''.obs;

  /// init
  final FlutterContactPicker contactPicker = FlutterContactPicker();

  /// The name Mahdi is fetched through the username
  late TextEditingController donorName = TextEditingController(
      text: app.isLogin.value ? app.user.value!.name : "");
  TextEditingController giftedName = TextEditingController();
  TextEditingController giftedPhone = TextEditingController();

  //============================================================================
  // Functions

  Future<void> getData() async {
    try {
      giftCategories.value = await DatabaseX.getAllGiftCategories();
      if (giftCategories.isEmpty) {
        throw ErrorX.createErrorByCode(ErrorCodesX.notFound);
      } else {
        giftCategorySelected = giftCategories.first.obs;
        await getGiftCategoryDetails(giftCategories.first.id);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GiftCategoryX>> getGiftCategories(
      ScrollRefreshLoadMoreParametersX data) async {
    return await DatabaseX.getAllGiftCategories(
      page: data.page,
      perPage: data.perPage,
    );
  }

  getGiftCategoryDetails(String id) async {
    isLoadingForGetGiftCategoryDetails.value = true;
    giftCategorySelected.value = await DatabaseX.getGiftCategoryDetails(id: id);
    organizations.value = giftCategorySelected.value.donationCategories;
    orgSelected.value = null;
    isLoadingForGetGiftCategoryDetails.value = false;
    onChangeGiftCardFormByGender();
  }

  //----------------------------------------------------------------------------
  // Change

  onChangeGiftCardFormByGender() {
    giftCardFormByGenderSelected.value = gender.value == 'male'
        ? giftCategorySelected.value.giftCardFormMale
        : giftCategorySelected.value.giftCardFormFemale;
  }

  onChangeCategory(index) {
    giftCategorySelected.value = giftCategories[index];
    getGiftCategoryDetails(giftCategorySelected.value.id);
  }

  onChangeColor(index) => colorSelectedIndex.value = index;
  onChangeOrg(index) {
    orgSelected.value = organizations[index];
  }

  onChangeShowAmount(bool val) => isShowAmount.value = val;
  onChangeSendToMe(bool val) => isSendToMe.value = val;
  onChangeSendLater(bool val) => isSendLater.value = val;
  onChangeDate(DateTime? date) => sendLaterDate.value = date;
  onChangeDonationAmount(int val) {
    donationAmount.text = val.toString();
    freeDonationSelected.value = val;
  }

  onChangeAmountForFreeDonationSelected(val) {
    if (int.tryParse(val) != null) {
      freeDonationSelected.value = int.parse(val);
    }
  }

  onChangeGender(String? value) {
    gender.value = value!;
    onChangeGiftCardFormByGender();
  }

  onChangeCountryCode(String val) => countryCode.value = int.parse(val);
  onChangeCountryCodeForSendToMe(String val) =>
      countryCodeForSendToMe = int.parse(val);

  //----------------------------------------------------------------------------
  // Phone From Contacts

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
  // Auxiliary functions

  /// Erase all data and return it to its default state
  clearData() {
    gifting = GiftingX.empty();
    donationAmount.text = "";
    date.text = "";
    giftedName.text = "";
    giftedPhone.text = "";
    isShowAmount.value = false;
    isSendToMe.value = false;
    isSendLater.value = false;
    sendLaterDate.value = null;

    giftCategorySelected.value = giftCategories.first;
    colorSelectedIndex.value = 0;
    orgSelected.value = null;
    autoValidateDonationAmount = AutovalidateMode.disabled;
    update();
  }

  /// Verify the entered data
  bool dataVerification({bool isPreview = false}) {
    if (orgSelected.value == null) {
      return throw "You must choose the field of donation";
    } else if (!formKeyForDedicatesData.currentState!.validate()) {
      autoValidateForDedicatesData = AutovalidateMode.always;
      return throw "There is an error in the gift data, please check the fields";
    } else if (!(formKeyDonationAmount.currentState?.validate() ?? false)) {
      autoValidateDonationAmount = AutovalidateMode.always;
      return throw "Make sure you enter a valid value in donation amount";
    } else if (!isPreview &&
        isSendToMe.isTrue &&
        !formKeyPhoneSendToMe.currentState!.validate()) {
      autoValidatePhoneSendToMe = AutovalidateMode.always;
      return throw "You must enter a phone number in the designated phone field to send a copy to your mobile.";
    } else if (!isPreview && isSendLater.value && sendLaterDate.value == null) {
      return throw "You must enter the date the gift was sent";
    } else {
      return true;
    }
  }

  //----------------------------------------------------------------------------
  // Main processors

  onGifting({bool isAddToCart = false}) async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification()) {
          isLoading.value = true;
          if (isAddToCart) {
            addToCartButtonState.value = ButtonStateEX.loading;
          } else {
            giftingButtonState.value = ButtonStateEX.loading;
          }

          // GiftingX gifting = GiftingX(
          //   id: '',
          //   categoryID: typeID,
          //   orgID: orgID,
          //   donationAmount: donationAmount,
          //   isShowAmount: isShowAmount,
          //   isSendToMe: isSendToMe,
          //   isSendLater: isSendLater,
          //   mahdiName: mahdiName,
          //   name: name,
          //   gender: gender,
          //   phone: phone,
          //   countryCode: countryCode,
          //   typeName: typeName,
          //   giftingData: giftingData,
          //   paymentMethod: paymentMethod,
          //   giftingURL: giftingURL,
          // );

          /// The time delay here is aesthetically beneficial
          if (isAddToCart) {
            addToCartButtonState.value = ButtonStateEX.success;
          } else {
            giftingButtonState.value = ButtonStateEX.success;
          }
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          clearData();
          isLoading.value = false;
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        if (isAddToCart) {
          addToCartButtonState.value = ButtonStateEX.failed;
        } else {
          giftingButtonState.value = ButtonStateEX.failed;
        }
      }

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          if (isAddToCart) {
            addToCartButtonState.value = ButtonStateEX.normal;
          } else {
            giftingButtonState.value = ButtonStateEX.normal;
          }
        },
      );
    }
  }

  onPreviewGift() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification(isPreview: true)) {
          isLoading.value = true;
          previewDedicateController.nameFrom = donorNameForCard.value;
          previewDedicateController.nameTo = giftedNameForCard.value;
          previewDedicateController.amount = donationAmountForCard.value;
          previewDedicateController.isShowAmount = isShowAmount.value;
          previewDedicateController.orgName = orgSelected.value!.name;
          previewDedicateController.color =
              Color(int.parse("0xff${colors[colorSelectedIndex.value]}"));
          previewDedicateController.giftCardFormByGender =
              giftCardFormByGenderSelected.value!;
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

  //============================================================================
  // Initialization

  @override
  void onInit() {
    donorName.addListener(() => donorNameForCard.value = donorName.text);
    giftedName.addListener(() => giftedNameForCard.value = giftedName.text);
    donationAmount
        .addListener(() => donationAmountForCard.value = donationAmount.text);
    super.onInit();
  }

  @override
  void dispose() {
    donorName.dispose();
    giftedName.dispose();
    donationAmount.dispose();
    super.dispose();
  }
}
