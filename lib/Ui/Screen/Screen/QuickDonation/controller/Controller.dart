import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Other/donateOnBehalfOfFamilyController.dart';
import '../../../../../Core/Controller/SelectedOptions/organizationSelectionController.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';
import '../../../../ScreenSheet/Selection/Organization/organizationSelectionSheet.dart';

class QuickDonationController extends GetxController {
  //============================================================================
  // Injection of required controls

  OrganizationSelectionController donationProgramSelectedController =
      Get.put(OrganizationSelectionController(), tag: "Quick Donation");
  DonateOnBehalfOfFamilyController donateOnBehalfOfFamily =
      Get.put(DonateOnBehalfOfFamilyController(), tag: "Quick Donation");

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> appleButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> googleButtonState = ButtonStateEX.normal.obs;

  List<OrganizationX> organizations = [];
  RxString donationProgramSelected = "All".obs;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController donationAmount = TextEditingController();

  //============================================================================
  // Functions

  getOrganizations() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      organizations = TestDataX.organizations;
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Other

  onChangeDonationAmount(int val) => donationAmount.text = val.toString();

  onTapChooseDonationProgram() async =>
      await organizationSelectionSheetX(donationProgramSelectedController);

  onChangeDonationProgram(String? val) =>
      donationProgramSelected.value = val ?? "";

  //----------------------------------------------------------------------------
  // Data processing

  /// Erase all data and return it to its default state
  clearData() {
    donationAmount.text = '';
    donationProgramSelected.value = "All";
    autoValidate = AutovalidateMode.disabled;
    donateOnBehalfOfFamily.clearData();
    donationProgramSelectedController.orgSelected.value =
        donationProgramSelected.value;
  }

  /// Verify the entered data
  dataVerification() {
    if (!formKey.currentState!.validate()) {
      // check input fields
      autoValidate = AutovalidateMode.always;
      return Future.error(
          "Make sure you enter a valid value in donation amount");
    } else if (donateOnBehalfOfFamily.isEnable.value &&
        !donateOnBehalfOfFamily.formKey.currentState!.validate()) {
      // Check the input fields to donate on behalf of the family
      donateOnBehalfOfFamily.autoValidate = AutovalidateMode.always;
      return Future.error("Please enter the donor's information on his behalf");
    }
  }

  // ----------------------------------------------------------------------------
  // Main processors

  /// Note: The different payment methods below can be combined into one function,
  ///       but this depends on the possibility of there being a different treatment
  ///       for linking with payment methods and interacting with them.

  onDonatingByApple() async {
    if (isLoading.isFalse) {
      isLoading.value = true;
      appleButtonState.value = ButtonStateEX.loading;
      try {
        /// check is validate data
        await dataVerification();

        // TODO: Database >>> Create a connection to start the payment process
        // TODO: Payment >>> Go to the payment screen
        // TODO: Database >>> Send a response from the payment screen and complete the process
        await Future.delayed(const Duration(seconds: 1)); // delete this

        /// The time delay here is aesthetically beneficial
        appleButtonState.value = ButtonStateEX.success;
        await Future.delayed(
          const Duration(seconds: StyleX.successButtonSecond),
        );

        /// Close the bottom sheet
        Get.back();
        ToastX.success(message: "The donation was successful");

        /// Clear date on controller
        clearData();
      } catch (error) {
        ToastX.error(message: error.toString());
        appleButtonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          appleButtonState.value = ButtonStateEX.normal;
        },
      );
    }
  }

  onDonatingByGoogle() async {
    if (isLoading.isFalse) {
      isLoading.value = true;
      googleButtonState.value = ButtonStateEX.loading;
      try {
        /// check is validate data
        await dataVerification();

        // TODO: Database >>> Create a connection to start the payment process
        // TODO: Payment >>> Go to the payment screen
        // TODO: Database >>> Send a response from the payment screen and complete the process
        await Future.delayed(const Duration(seconds: 1)); // delete this

        /// The time delay here is aesthetically beneficial
        googleButtonState.value = ButtonStateEX.success;
        await Future.delayed(
          const Duration(seconds: StyleX.successButtonSecond),
        );

        /// Close the bottom sheet
        Get.back();
        ToastX.success(message: "The donation was successful");

        /// clear date on controller
        clearData();
      } catch (error) {
        ToastX.error(message: error.toString());
        googleButtonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          googleButtonState.value = ButtonStateEX.normal;
        },
      );
    }
  }

  onDonatingByApp() async {
    if (isLoading.isFalse) {
      isLoading.value = true;
      buttonState.value = ButtonStateEX.loading;
      try {
        /// check is validate data
        await dataVerification();

        // TODO: Database >>> Create a connection to start the payment process
        // TODO: Payment >>> Go to the payment screen
        // TODO: Database >>> Send a response from the payment screen and complete the process
        await Future.delayed(const Duration(seconds: 1)); // delete this

        /// The time delay here is aesthetically beneficial
        buttonState.value = ButtonStateEX.success;
        await Future.delayed(
          const Duration(seconds: StyleX.successButtonSecond),
        );

        /// Close the bottom sheet
        Get.back();
        ToastX.success(message: "The donation was successful");

        /// clear date on controller
        clearData();
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
