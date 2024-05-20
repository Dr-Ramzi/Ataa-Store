import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/Controller/Other/donateOnBehalfOfFamilyController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class DonationDetailsController extends GetxController {
  //============================================================================
  // Injection of required controls

  DonateOnBehalfOfFamilyController donateOnBehalfOfFamilyController = Get.put(DonateOnBehalfOfFamilyController(),tag: Get.arguments);

  //============================================================================
  // Variables

  final id = Get.arguments; // The ID is sent from the previous page
  late DonationX donation;

  Rx<ButtonStateEX> payDonationButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> addToCartButtonState = ButtonStateEX.normal.obs;

  PageController imagesController = PageController();

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch donation details
      await Future.delayed(const Duration(seconds: 1)); // delete this

      donation = TestDataX.donations.firstWhere((element) => element.id == id);

    } catch (e) {
      return Future.error(e);
    }
  }

  onPayDonation () async => await payDonationSheet(donation);
  onDonationAddToCart () async => await payDonationSheet(donation,onlyAddToCart:true);

}
