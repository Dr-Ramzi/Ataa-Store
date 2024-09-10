import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Config/config.dart';
import '../../../Data/data.dart';
import '../../../Ui/Widget/widget.dart';

class AddPaymentCardControllerX extends GetxController {
  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  RxBool isDefault = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;
  TextEditingController name = TextEditingController();
  TextEditingController cardNum = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController date = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  //============================================================================
  // Functions

  /// Erase all data and return it to its default state
  clearData() {
    isDefault.value = false;
    name.text = '';
    cardNum.text = '';
    cvv.text = '';
    date.text = '';
    autoValidate = AutovalidateMode.disabled;
  }

  /// Change the status of the Set Card as Default button
  onChangeDefault(bool val) => isDefault.value = val;

  /// Add the card to the database after verifying it
  onAddCard() async {
    if (isLoading.isFalse) {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        buttonState.value = ButtonStateEX.loading;
        try {
          // TODO: Database >>> Add a payment card to the database
          await Future.delayed(const Duration(seconds: 1)); // delete this

          /// Create a bank card object
          PaymentCardX paymentCard = PaymentCardX(
            id: "",
            name: name.text,
            cardNum: cardNum.text.removeAllWhitespace,
            expiryDate: date.text,
            cvv: int.parse(cvv.text),
            isDefault: isDefault.value,
          );

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// This controller form bottom sheet
          Get.back(result: paymentCard);
          ToastX.success(message: "Added Card successfully");

          /// Clear data on the controller
          clearData();
        } catch (error) {
          ToastX.error(message: error.toString());
          buttonState.value = ButtonStateEX.failed;
        }
        isLoading.value = false;

        /// Reset the button state
        Timer(const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
            () {
          buttonState.value = ButtonStateEX.normal;
        });
      } else {
        autoValidate = AutovalidateMode.always;
      }
    }
  }
}
