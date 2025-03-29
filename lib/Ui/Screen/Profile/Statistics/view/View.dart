import 'package:ataa/Ui/Widget/Basic/Utils/future_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/campaigns.dart';
import 'Sections/deductions.dart';
import 'Sections/donations.dart';
import 'Sections/gifts.dart';
import 'Sections/sharingLinks.dart';
import 'Sections/loading.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Dashboard",
        actions: [CartIconButtonsX()],
      ),
      body: FutureBuilderX(
        future: controller.fetchAllStatistics,
        loading: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
            vertical: StyleX.vPaddingApp,
          ),
          child: Column(
            children: [
              for (int i = 0; i < 10; i++) const LoadingSectionX(),
            ],
          ),
        ),
        child: (data) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: StyleX.hPaddingApp,
              vertical: StyleX.vPaddingApp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                TextX(
                  'Statistics',
                  style: TextStyleX.titleLarge,
                  color: Get.theme.primaryColor,
                ).paddingOnly(bottom: 16),
                if (controller.donationStatistics.value != null)
                  const DonationsSectionX(),

                if (controller.campaignStatistics.value != null)
                const CampaignsSectionX(),
                /// TODO: Show >>> Orders Statistics
                // if (controller.orderStatistics.value != null)
                // OrdersSectionX(),
                if (controller.giftStatistics.value != null)
                  const GiftsSectionX(),
                if (controller.deductionStatistics.value != null)
                  const DeductionsSectionX(),
                
                /// TODO: Show >>> Sponsorships Statistics
                // if (controller.sponsorshipStatistics.value != null)
                // SponsorshipsSectionX(),
                if (controller.shareLinkStatistics.value != null)
                  const SharingLinksSectionX(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
