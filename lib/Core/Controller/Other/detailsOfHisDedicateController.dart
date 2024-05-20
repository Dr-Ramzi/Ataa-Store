import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import '../../../Data/data.dart';
import '../../../Ui/Widget/widget.dart';
import '../../core.dart';

class DetailsOfHisDedicateController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  late Rx<String> gender = "".obs;
  RxInt countryCode = 966.obs;

  final FlutterContactPicker contactPicker = FlutterContactPicker();

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  /// The name Mahdi is fetched through the username
  late TextEditingController donorName =
      TextEditingController(text: app.isLogin.value ? app.user.value.name : "");
  TextEditingController giftedName = TextEditingController();
  TextEditingController giftedPhone = TextEditingController();

  //============================================================================
  // Functions

  /// Erase all data and return it to its default state
  clearData() {
    giftedName.text = '';
    giftedPhone.text = "";
    gender.value = "";
    donorName.text = app.isLogin.value ? app.user.value.name : "";
    autoValidate = AutovalidateMode.disabled;
  }

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

  /// Verify the entered data
  /// Note: It will be used from another place, and we will not be able to use
  ///      the formKey verification because it will not appear on the screen,
  ///      and the verification will not be performed if it is not visible.
  bool dataVerification() {
    if (ValidateX.name(donorName.text) == null &&
        ValidateX.name(giftedName.text) == null &&
        ValidateX.phone(giftedPhone.text) == null &&
        gender.value.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  onSave() {
    /// Verify input fields
    if (formKey.currentState!.validate()) {
      /// Check whether gender is left blank
      if (gender.value.isNotEmpty) {
        /// The bottom sheet is closed and processing is completed in another controller
        Get.back();
      } else {
        ToastX.error(message: "You must choose the gender");
      }
    } else {
      autoValidate = AutovalidateMode.always;
    }
  }
}
