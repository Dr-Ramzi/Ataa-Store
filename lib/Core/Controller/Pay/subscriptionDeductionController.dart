import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Config/config.dart';
import '../../../Data/data.dart';
import '../../../UI/Widget/widget.dart';
import '../../core.dart';
import '../Other/donateOnBehalfOfFamilyController.dart';

class SubscriptionDeductionControllerX extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  late DonateOnBehalfOfFamilyController donateOnBehalfOfFamily;

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  bool isSheet = false;

  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  TextEditingController deductionAmount = TextEditingController();

  RxInt freeDeductionSelected = 0.obs;
  late DeductionX deduction;

  //============================================================================
  // Initialization

  init(DeductionX deduction, {bool isSheet = false}) {
    this.deduction = deduction;
    this.isSheet = isSheet;

    /// check if "donate On Behalf Of Family controller" is has or create
    if (Get.isRegistered<DonateOnBehalfOfFamilyController>(tag: deduction.id)) {
      donateOnBehalfOfFamily =
          Get.find<DonateOnBehalfOfFamilyController>(tag: deduction.id);
    } else {
      donateOnBehalfOfFamily =
          Get.put(DonateOnBehalfOfFamilyController(), tag: deduction.id);
    }
  }

  //============================================================================
  // Functions

  /// clear date on controller
  removeController() {
    Get.delete<DonateOnBehalfOfFamilyController>(tag: deduction.id);
    Get.delete<SubscriptionDeductionControllerX>(tag: deduction.id);
  }

  onChangeDeductionAmount(int val) {
    deductionAmount.text = val.toString();
    freeDeductionSelected.value=val;
  }

  removeFreeDonationSelected(_){
    if(freeDeductionSelected.value!=0) {
      freeDeductionSelected.value=0;
    }
  }
  bool dataVerification() {
    if (deduction.fixedDeductionAmount != null) {
      return true;
    } else if (donateOnBehalfOfFamily.isEnable.value &&
        !donateOnBehalfOfFamily.formKey.currentState!.validate()) {
      /// Verify the donation entry fields for family and friends
      donateOnBehalfOfFamily.autoValidate = AutovalidateMode.always;
      return throw "Please enter the donor's information on his behalf";
    } else if (!formKey.currentState!.validate()) {
      /// Verify input fields
      autoValidate = AutovalidateMode.always;
      return throw "Make sure you enter a valid value in deduction amount";
    }
    return true;
  }

  onDeduction() async {
    if (isLoading.isFalse) {
      try {
        if (dataVerification()) {
          isLoading.value = true;
          buttonState.value = ButtonStateEX.loading;

          /// TODO: Database >>> Create a connection to start the payment process
          /// TODO: Payment >>> Go to the payment screen
          /// TODO: Database >>> Send a response from the payment screen and complete the process
          await Future.delayed(const Duration(seconds: 1));

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// if use this controller form bottom sheet
          if (isSheet) {
            Get.back();
          }
          ToastX.success(
            message:
                "You have successfully subscribed to the periodic deduction",
          );

          /// clear date on controller
          removeController();
        }
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
    }
  }
}
