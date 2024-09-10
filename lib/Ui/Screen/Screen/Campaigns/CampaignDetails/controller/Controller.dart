import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Other/donateOnBehalfOfFamilyController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class CampaignDetailsController extends GetxController {
  //============================================================================
  // Injection of required controls

  DonateOnBehalfOfFamilyController donateOnBehalfOfFamilyController =
      Get.put(DonateOnBehalfOfFamilyController(), tag: Get.arguments);

  //============================================================================
  // Variables

  final id = Get.arguments;

  late CampaignX campaign;
  late DonationX donation;

  Rx<ButtonStateEX> payDonationButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> addToCartButtonState = ButtonStateEX.normal.obs;

  PageController imagesController = PageController();

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch campaign details
      /// TODO: Database >>> Fetch donation details
      await Future.delayed(const Duration(seconds: 1)); // delete this

      // campaign = TestDataX.campaigns.firstWhere((element) => element.id == id);
      // donation = TestDataX.donations
      //     .firstWhere((element) => element.id == campaign.donationID);
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------

  showAllCampaigns() {
    if (Get.previousRoute == RouteNameX.allCampaigns) {
      Get.back();
    } else {
      Get.toNamed(RouteNameX.allCampaigns);
    }
  }

  onPayDonation() async => await payDonationSheet(donation, campaign: campaign);

  onDonationAddToCart() async =>
      await payDonationSheet(donation, campaign: campaign, onlyAddToCart: true);
}
