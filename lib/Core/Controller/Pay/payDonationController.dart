import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Config/config.dart';
import '../../../Data/data.dart';
import '../../../Ui/Widget/widget.dart';
import '../../core.dart';
import '../Basket/basketGeneralController.dart';
import '../Other/donateOnBehalfOfFamilyController.dart';

class PayDonationControllerX extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  final BasketGeneralControllerX basketGeneral = Get.find();
  late DonateOnBehalfOfFamilyController donateOnBehalfOfFamily;

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  bool isSheet = false;

  Rx<ButtonStateEX> payDonationButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> addToCartButtonState = ButtonStateEX.normal.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController donationAmount = TextEditingController();

  RxString packageSelected = ''.obs;
  double numOfStock = 1;
  RxInt freeDonationSelected = 0.obs;

  late DonationX donation;
  CampaignX? campaign;

  //============================================================================
  // Initialization

  init(DonationX donation, CampaignX? campaign, {bool isSheet = false}) {
    this.donation = donation;
    this.campaign = campaign;
    this.isSheet = isSheet;

    /// check if "donate On Behalf Of Family controller" is has or create
    if (Get.isRegistered<DonateOnBehalfOfFamilyController>(tag: donation.id)) {
      donateOnBehalfOfFamily =
          Get.find<DonateOnBehalfOfFamilyController>(tag: donation.id);
    } else {
      donateOnBehalfOfFamily =
          Get.put(DonateOnBehalfOfFamilyController(), tag: donation.id);
    }

    /// Prepare the donation amount if it is a stock type
    onChangeStockValue(1);
  }

  //============================================================================
  // Functions

  onChangeStockValue(double val) {
    numOfStock = val;
    if (campaign == null && donation.donationShares.isShare) {
      donationAmount.text =
          ((donation.donationShares.price * numOfStock).toInt()).toString();
    } else if (campaign != null && campaign!.stockValue != null) {
      donationAmount.text =
          ((campaign!.stockValue! * numOfStock).toInt()).toString();
    }
  }

  onChangePackage(String? val) => packageSelected.value = val!;

  onChangeDonationAmount(int val) {
    donationAmount.text = val.toString();
    freeDonationSelected.value=val;
  }

  removeFreeDonationSelected(_){
    if(freeDonationSelected.value!=0) {
      freeDonationSelected.value=0;
    }
  }
  /// clear date on controller
  removeController() {
    Get.delete<DonateOnBehalfOfFamilyController>(tag: donation.id);
    Get.delete<PayDonationControllerX>(tag: donation.id);
  }

  bool dataVerification() {
    // if(!donation.donationShares.isShare &&
    //     donation.openPackages.isEmpty && donation.donationDeductionPackages.isEmpty && num.parse(donationAmount.text) < app.generalSettings.minimumDonationAmount){
    //   /// Verify the lowest possible donation value in Free Donation
    //   return throw "${"The minimum donation amount is".tr} ${app.generalSettings.minimumDonationAmount} ${"SAR".tr}";
    // }else
    //
      if (campaign == null &&
        donation.openPackages.isNotEmpty &&
        packageSelected.value.isEmpty) {
      /// Verify package selection
      return throw "You must choose one of the packages";
    } else if (((campaign != null && campaign!.stockValue != null) ||
            donation.donationShares.isShare) &&
        numOfStock <= 0) {
      /// Verify the number of shares
      return throw "You must choose to enter a number of shares of at least 1";
    } else if (!formKey.currentState!.validate()) {
      /// Verify input fields
      autoValidate = AutovalidateMode.always;
      return throw "Make sure you enter a valid value in donation amount";
    } else if (donateOnBehalfOfFamily.isEnable.value &&
        !donateOnBehalfOfFamily.formKey.currentState!.validate()) {
      /// Verify the donation entry fields for family and friends
      donateOnBehalfOfFamily.autoValidate = AutovalidateMode.always;
      return throw "Please enter the donor's information on his behalf";
    }
    return true;
  }

  onPayDonation() async {
    if (isLoading.isFalse) {
      try {
        /// check is validate data
        if (dataVerification()) {
          isLoading.value = true;
          payDonationButtonState.value = ButtonStateEX.loading;

          /// TODO: Database >>> Create a connection to start the payment process
          /// TODO: Payment >>> Go to the payment screen
          /// TODO: Database >>> Send a response from the payment screen and complete the process
          await Future.delayed(const Duration(seconds: 1)); // delete this

          /// The time delay here is aesthetically beneficial
          payDonationButtonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// if use this controller form bottom sheet
          if (isSheet) {
            Get.back();
          }

          ToastX.success(message: "The donation was successful");

          /// clear date on controller
          removeController();
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        payDonationButtonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          payDonationButtonState.value = ButtonStateEX.normal;
        },
      );
    }
  }

  onDonationAddToCart() async {
    if (isLoading.isFalse) {
      try {
        /// check is validate data
        if (dataVerification()) {
          isLoading.value = true;
          addToCartButtonState.value = ButtonStateEX.loading;

          /// Connect to basket Controller to add to cart in database
          await basketGeneral.addDonation(donation);

          /// The time delay here is aesthetically beneficial
          addToCartButtonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// if use this controller form bottom sheet
          if (isSheet) {
            Get.back();
          }

          ToastX.success(message: "Added to cart successfully");

          /// clear date on controller
          removeController();
        }
      } catch (error) {
        ToastX.error(message: error.toString());
        addToCartButtonState.value = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          addToCartButtonState.value = ButtonStateEX.normal;
        },
      );
    }
  }
}
