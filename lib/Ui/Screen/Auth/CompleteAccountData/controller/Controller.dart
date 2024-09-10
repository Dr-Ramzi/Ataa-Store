import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Error/error.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/data.dart';

class CompleteAccountDataController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  bool isLoading = false;
  Rx<ErrorX?> error = Rx<ErrorX?>(null);
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController email = TextEditingController();

  Rx<String> gender = "".obs;

  //============================================================================
  // Functions

  void onChangeGender(String? value) => gender.value = value!;

  void onTapError() {
    /// Add a link to go to pages through the error message
  }

  Future<void> onSave() async {
    if (!isLoading) {
      if(gender.value.isEmpty){
        error.value=ErrorX(message: 'Gender must be specified.');
        buttonState.value = ButtonStateEX.failed;
      }else if (formKey.currentState!.validate()) {
        isLoading = true;
        buttonState.value = ButtonStateEX.loading;
        error.value=null;
        try {
          /// update on database
          var result = await DatabaseX.completeDataSingUp(
            email: email.text,
            gender: gender.value,
          );

          if(result!=null) {
            app.user.value = result;
          }else{
            app.user.value?.email = email.text.toLowerCase().trim();
            app.user.value?.gender = gender.value;
          }
          app.update();

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// back to home
          Get.back();
        } catch (e) {
          error.value=e.toErrorX;
          error.value!.log();
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
