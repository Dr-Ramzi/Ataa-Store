import 'dart:async';

import 'package:ataa/Core/Error/error.dart';
import 'package:ataa/Data/Enum/payment_method_status.dart';
import 'package:ataa/Data/Model/Deduction/deduction.dart';
import 'package:ataa/Data/Model/PaymentCard/paymentCardForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../Data/Model/PaymentTransaction/paymentTransaction.dart';
import '../../../../../../Data/Model/PaymentTransaction/paymentTransactionForm.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Section/PreSavedPaymentCards/controller/Controller.dart';

class DeductionPaymentController extends GetxController {
  //============================================================================
  // Injection of required controls

  final PreSavedPaymentCardsController preSavedPaymentCardsController =
      Get.put(PreSavedPaymentCardsController(),tag: 'DeductionPayment');

  //============================================================================
  // Variables

  RxBool isInit = false.obs;
  RxBool isLoading = false.obs;
  Rx<ErrorX?> error = Rx<ErrorX?>(null);
  DeductionX deduction = Get.arguments[0];
  double price = Get.arguments[1];
  Rx<ButtonStateEX> buttonState = Rx<ButtonStateEX>(ButtonStateEX.normal);
  final ScrollController scrollController = ScrollController();

  //============================================================================
  // Functions

  Future<void> getData() async {
    await preSavedPaymentCardsController.getData();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  onPay() async {
    if (isLoading.isFalse) {
      try {
        if (preSavedPaymentCardsController.validate()) {
          error.value = null;
          isLoading.value = true;
          buttonState.value = ButtonStateEX.loading;

          PaymentTransactionFormX form = PaymentTransactionFormX(
            price: price,
            paymentMethod: PaymentMethodStatusX.creditCard,
            paymentCardId:
                preSavedPaymentCardsController.paymentCardSelected.value?.id,
            paymentCard: preSavedPaymentCardsController
                        .paymentCardSelected.value ==
                    null
                ? PaymentCardFormX(
                    name: preSavedPaymentCardsController.name.text,
                    cardNum: preSavedPaymentCardsController
                        .cardNum.text.removeAllWhitespace,
                    month: int.parse(preSavedPaymentCardsController.date.text
                        .split(RegExp(r'(/)'))[0]),
                    year: int.parse(preSavedPaymentCardsController.date.text
                        .split(RegExp(r'(/)'))[1]),
                    cvv: int.parse(preSavedPaymentCardsController.cvv.text),
                    isDefault: false)
                : null,
            isSavePaymentCard:
                preSavedPaymentCardsController.paymentCardSelected.value == null
                    ? preSavedPaymentCardsController.isSaveForLater.value
                    : null,
          );
          PaymentTransactionX paymentTransaction =
              await DatabaseX.createPaymentTransactionForDeduction(
            form: form,
            deductionId: deduction.id,
          );
          if (paymentTransaction.verificationUrl != null) {
            dynamic result = await Get.toNamed(
              RouteNameX.verificationUrl,
              arguments: paymentTransaction.verificationUrl,
            );
            if (result != true) {
              throw 'Payment was not verified, try again.';
            }
          }
          Get.offAndToNamed(RouteNameX.paymentSuccessful,
              arguments: paymentTransaction);
        }
      } catch (e) {
        e.toErrorX.log();
        error.value = e.toErrorX;
        scrollToTop();
        buttonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
          () {
        buttonState.value = ButtonStateEX.normal;
      });
    }
  }
}