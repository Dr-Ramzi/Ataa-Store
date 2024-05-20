import 'dart:async';
import 'package:ataa/Core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';

class DonateOnBehalfOfFamilyController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  RxBool isEnable = false.obs;
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
    donorName.text = app.isLogin.value ? app.user.value.name : "";
    isEnable.value = false;
    autoValidate = AutovalidateMode.disabled;
  }

  onEnable(bool val) => isEnable.value = val;

  onChangeCountryCode(String countryCode) {
    this.countryCode.value = int.parse(countryCode);
  }

  /// Get the Mahdi's information from his contacts
  onPhoneFromContacts() async {
    try {
      Contact? contact = await contactPicker.selectContact();
      if (contact != null) {
        /// If name is empty, it returns the previous value
        giftedName.text = contact.fullName ?? giftedName.text;
        print(contact.phoneNumbers?.first??'ss');

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
}
