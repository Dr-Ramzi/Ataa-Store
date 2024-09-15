import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/deductions.dart';
import 'Sections/donations.dart';
import 'Sections/gifts.dart';
import 'Sections/sharingLinks.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Dashboard",
        actions: [CartIconButtonsX()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
            vertical: StyleX.vPaddingApp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextX('Statistics',style: TextStyleX.titleLarge,color: Get.theme.primaryColor,).paddingOnly(bottom: 16),
              const DonationsSectionX(),
              /// TODO: Show >>> Campaigns Statistics
              // CampaignsSectionX(),
              /// TODO: Show >>> Orders Statistics
              // OrdersSectionX(),
              const GiftsSectionX(),
              const DeductionsSectionX(),
              /// TODO: Show >>> Sponsorships Statistics
              // SponsorshipsSectionX(),
              const SharingLinksSectionX(),
            ],
          ),
        ),
      ),
    );
  }
}
