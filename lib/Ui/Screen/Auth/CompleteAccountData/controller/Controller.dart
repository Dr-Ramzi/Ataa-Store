import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';

class CompleteAccountDataController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  bool isLoading = false;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController email = TextEditingController();

  Rx<String> gender = "male".obs;

  //============================================================================
  // Functions

  void onChangeGender(String? value) => gender.value = value!;

  Future<void> onSave() async {
    if (!isLoading) {
      if (formKey.currentState!.validate()) {
        isLoading = true;
        buttonState.value = ButtonStateEX.loading;
        try {
          /// update on database
          app.user.value = await DatabaseX.completeDataSingUp(
            email: email.text,
            gender: gender.value,
          );

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// back to home
          Get.back();
        } catch (error) {
          ToastX.error(message: error.toString());
          buttonState.value = ButtonStateEX.failed;
        }
        isLoading = false;

        /// Reset the button state
        Timer(
          const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
          () {
            buttonState.value = ButtonStateEX.normal;
          },
        );
      } else {
        autoValidate = AutovalidateMode.always;
      }
    }
  }
}
