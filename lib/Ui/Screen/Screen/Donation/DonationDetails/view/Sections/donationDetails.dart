import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class DonationDetailsSectionX extends GetView<DonationDetailsController> {
  const DonationDetailsSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 120,
          left: StyleX.hPaddingApp,
          right: StyleX.hPaddingApp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Donations progress bar
            if(controller.donation.donationSettings.isShowCompletionIndicator)
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: controller.donation.donationBasic.completionRate / 100,
                    borderRadius: BorderRadius.circular(50),
                    minHeight: 8,
                  ),
                ),
                if(controller.donation.donationSettings.isShowDonationsPercentage)
                const SizedBox(width: 16),
                if(controller.donation.donationSettings.isShowDonationsPercentage)
                TextX(
                  "${controller.donation.donationBasic.completionRate.toStringAsFixed(2)} %",
                  style: TextStyleX.supTitleLarge,
                )
              ],
            ).marginOnly(bottom: 16).fadeAnimation400,

            /// Details
            TextX(
              "Project Description",
              style: TextStyleX.titleLarge,
            ).fadeAnimation500,
            const SizedBox(height: 6),
            HtmlWidget(
              controller.donation.donationDetails.description,
              textStyle: TextStyleX.titleSmall,
            ).fadeAnimation500,
            const SizedBox(height: 16),

            /// Statistics
            Row(
              children: [
                /// Total donations
                Flexible(
                  child: StatisticCardX(
                    color: Theme.of(context).cardColor,
                    icon: Icons.payments_rounded,
                    statistic: controller.donation.donationBasic.currentDonations,
                    subtitle: "Total amount of donations",
                    isMoney: true,
                  ),
                ),
                if(controller.donation.donationSettings.isShowDonorsCount)
                const SizedBox(width: 8),
                if(controller.donation.donationSettings.isShowDonorsCount)
                /// Total Targets
                Flexible(
                  child: StatisticCardX(
                    color: Theme.of(context).cardColor,
                    icon: Icons.favorite_rounded,
                    statistic: controller.donation.donationBasic.countDonations,
                    subtitle:"Number of donations",
                  ),
                ),
              ],
            ).fadeAnimation600
          ],
        ),
      ),
    );
  }
}
