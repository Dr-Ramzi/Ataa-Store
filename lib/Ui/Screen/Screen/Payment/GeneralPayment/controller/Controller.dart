import 'dart:async';
import 'dart:io';

import 'package:ataa/Core/Controller/Cart/cartGeneralController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../Core/Error/error.dart';
import '../../../../../../Data/Enum/payment_method_status.dart';
import '../../../../../../Data/Model/Donation/donation.dart';
import '../../../../../../Data/Model/PaymentCard/paymentCardForm.dart';
import '../../../../../../Data/Model/PaymentTransaction/paymentTransaction.dart';
import '../../../../../../Data/Model/PaymentTransaction/paymentTransactionForm.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Section/AppleAndGooglePay/controller/Controller.dart';
import '../../../../../Section/PayByBankTransfer/controller/Controller.dart';
import '../../../../../Section/PreSavedPaymentCards/controller/Controller.dart';

class GeneralPaymentController extends GetxController {
  //============================================================================
  // Injection of required controls

  final PreSavedPaymentCardsController preSavedPaymentCardsController = Get.put(
    PreSavedPaymentCardsController(),
    tag: 'GeneralPayment',
  );
  final PayByBankTransferController payByBankTransferController = Get.put(
    PayByBankTransferController(),
    tag: 'GeneralPayment-PayByBank',
  );
  late final AppleAndGooglePayController appleAndGooglePayController = Get.put(
    AppleAndGooglePayController()
      ..onPayDoneCallback = onPayByAppleOrGoogle
      ..onTapCallback = onTapAppleAndGooglePay,
    tag: 'GeneralPayment-AppleAndGooglePay',
  );
  final CartGeneralControllerX cart = Get.find();

  //============================================================================
  // Variables

  RxBool isInit = false.obs;
  RxBool isLoading = false.obs;
  Rx<ErrorX?> error = Rx<ErrorX?>(null);
  final payVia = ValueNotifier(1);
  RxBool isViaCard = true.obs;
  double? quickDonationAmount = Get.arguments?[NameX.amount];
  String? quickDonationOrgId = Get.arguments?[NameX.orgId];
  DonationX? quickDonationDonation = Get.arguments?[NameX.donation];
  double? totalCart = Get.arguments?[NameX.totalCart];

  Rx<ButtonStateEX> buttonState = Rx<ButtonStateEX>(ButtonStateEX.normal);
  final ScrollController scrollController = ScrollController();

  //============================================================================
  // Functions

  Future<void> getData() async {
    await appleAndGooglePayController.init(
      title: totalCart != null ? 'Giving basket' : 'quick donation',
      total: totalCart ?? quickDonationAmount!,
    );
    await preSavedPaymentCardsController.getData();
    await payByBankTransferController.getData();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onTapAppleAndGooglePay() {
    error.value=null;
  }

  onPayByAppleOrGoogle(String token) async {
    try {
      PaymentTransactionFormX form = PaymentTransactionFormX(
        price: quickDonationAmount,
        paymentMethod: Platform.isIOS
            ? PaymentMethodStatusX.applePay
            : PaymentMethodStatusX.googlePay,
        applePayToken: Platform.isIOS ? token : null,
        googlePayToken: Platform.isIOS ? null : token,
      );
      await sendPayToServer(form: form);
    } catch (e) {
      e.toErrorX.log();
      error.value = e.toErrorX;
    }
  }

  sendPayToServer({required PaymentTransactionFormX form}) async {
    late PaymentTransactionX paymentTransaction;
    if (totalCart != null) {
      paymentTransaction =
          await DatabaseX.createPaymentTransactionForCart(form: form);
      try{
        await cart.getData();
      }catch(_){
        cart.countItem.value=0;
        cart.cart.value.countItem=0;
        cart.cart.value.items=[];
      }
    } else {
      paymentTransaction =
          await DatabaseX.createPaymentTransactionForQuickDonation(
        form: form,
        orgId: quickDonationOrgId!,
      );
    }

    if (paymentTransaction.verificationUrl != null) {
      dynamic result = await Get.toNamed(
        RouteNameX.verificationUrl,
        arguments: paymentTransaction.verificationUrl,
      );
      if (result != true) {
       throw ErrorX(message:'Payment was not verified, try again.');
      }
    }

    if(totalCart!=null){
      /// for close cart screen
     Get.back();
    }
    Get.offAndToNamed(
      RouteNameX.paymentSuccessful,
      arguments: paymentTransaction,
    );
  }

  onPay() async {
    if (isLoading.isFalse) {
      try {
        if ((isViaCard.isTrue && preSavedPaymentCardsController.validate()) || isViaCard.isFalse) {
          error.value = null;
          isLoading.value = true;
          buttonState.value = ButtonStateEX.loading;

          late PaymentTransactionFormX form;
          if (isViaCard.isTrue) {
            form = PaymentTransactionFormX(
              price: quickDonationAmount,
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
                      isDefault: false,)
                  : null,
              isSavePaymentCard:
                  preSavedPaymentCardsController.paymentCardSelected.value ==
                          null
                      ? preSavedPaymentCardsController.isSaveForLater.value
                      : null,
            );
          } else {
            form = PaymentTransactionFormX(
              price: quickDonationAmount,
              paymentMethod: PaymentMethodStatusX.bankTransfer,
              bankAccountId: payByBankTransferController.bankAccountSelected.value!.id,
              transferImageFile: File(payByBankTransferController.image.value!.path),
            );
          }
          await sendPayToServer(form: form);
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

  //============================================================================
  // Initialization

  @override
  void onInit() {
    super.onInit();

    /// listener if change tap
    payVia.addListener(() {
      isViaCard.value = payVia.value == 1;
    });
  }
}