import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Config/config.dart';
import '../../../Data/data.dart';
import '../../../UI/Widget/widget.dart';
import '../../core.dart';

class DirectZakatPaymentControllerX extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  TextEditingController money = TextEditingController();

  //============================================================================
  // Functions

  onCancel() => Get.back();

  /// Erase all data and return it to its default state
  clearDate() {
    money.text = "";
    autoValidate = AutovalidateMode.disabled;
  }

  onDirectZakatPayment() async {
    if (isLoading.isFalse) {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        buttonState.value = ButtonStateEX.loading;
        try {
          /// TODO: Database >>> Create a connection to start the payment process
          /// TODO: Payment >>> Go to the payment screen
          /// TODO: Database >>> Send a response from the payment screen and complete the process
          await Future.delayed(const Duration(seconds: 1)); // delete this

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// This controller form bottom sheet
          Get.back();
          ToastX.success(message: "Zakat has been paid successfully");

          /// Clear date on controller
          clearDate();
        } catch (error) {
          ToastX.error(message: error.toString());
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
      } else {
        autoValidate = AutovalidateMode.always;
      }
    }
  }
}
