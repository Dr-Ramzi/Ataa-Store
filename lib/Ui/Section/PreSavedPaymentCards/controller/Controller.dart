import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/core.dart';
import '../../../../Data/data.dart';

class PreSavedPaymentCardsController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  Rx<PaymentCardX?> paymentCardSelected = Rx<PaymentCardX?>(null);
  List<PaymentCardX> paymentCards = [];
  RxBool isAddNewCardOpen = true.obs;
  RxBool isSaveForLater = false.obs;
  RxBool isValidate = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController cardNum = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController date = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  //============================================================================
  // Functions

  Future<void> getData() async {
    if (app.isLogin.value && paymentCards.isEmpty) {
      paymentCards = await DatabaseX.getAllPaymentCards();
      isAddNewCardOpen.value = paymentCards.isEmpty;
      paymentCardSelected.value=paymentCards.firstWhereOrNull((element) => element.isDefault);
      isValidate.value = paymentCardSelected.value!=null;
    }else{
      isValidate.value = true;
    }
  }

  onChange(PaymentCardX data) {
    paymentCardSelected.value = data;
    isAddNewCardOpen.value = false;
    isValidate.value = checkIsValidate();
  }

  onChangeOpenAddNewCard() {
    isAddNewCardOpen.value = !isAddNewCardOpen.value;
    paymentCardSelected.value = null;
    isValidate.value = checkIsValidate();
  }

  /// Erase all data and return it to its default state
  clearData() {
    isSaveForLater.value = false;
    name.text = '';
    cardNum.text = '';
    cvv.text = '';
    date.text = '';
    autoValidate = AutovalidateMode.disabled;
  }

  onChangeSaveForLater(bool val) => isSaveForLater.value = val;

  bool validate() {
    if (paymentCardSelected.value == null &&
        paymentCards.isNotEmpty &&
        isAddNewCardOpen.isFalse) {
      throw 'Payment method details must be specified.';
    } else if ((paymentCards.isEmpty || isAddNewCardOpen.isTrue) &&
        !formKey.currentState!.validate()) {
      autoValidate = AutovalidateMode.always;
      throw 'There is an error in the card data entered.';
    } else {
      return true;
    }
  }

  bool checkIsValidate() {
    if (paymentCardSelected.value == null &&
        paymentCards.isNotEmpty &&
        isAddNewCardOpen.isFalse) {
      return false;
    } else if ((paymentCards.isEmpty || isAddNewCardOpen.isTrue) &&
            formKey.currentState != null
        ? formKey.currentState!.validate()
        : false) {
      return false;
    } else {
      return true;
    }
  }
}
