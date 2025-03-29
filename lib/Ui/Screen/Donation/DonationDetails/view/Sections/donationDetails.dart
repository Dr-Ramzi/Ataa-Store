import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../UI/Widget/widget.dart';
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
            if (controller
                    .donation.donationSettings.isShowCompletionIndicator &&
                controller.donation.donationSettings.isShowDonationsPercentage)
            TextX(
              "${"Collected".tr} ${controller.donation.donationBasic.completionRate % 1 == 0 ? controller.donation.donationBasic.completionRate.toInt().toString() : controller.donation.donationBasic.completionRate.toStringAsFixed(2)}%",
              color: Theme.of(context).primaryColor,
            ).fadeAnimation350,
            if (controller
                    .donation.donationSettings.isShowCompletionIndicator &&
                !controller.donation.donationSettings.isShowDonationsPercentage)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextX(
                    "${"Collected".tr} ${FunctionX.formatLargeNumber(controller.donation.donationBasic.currentDonations)} ${"SAR".tr}",
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  TextX(
                    "${"Remaining".tr} ${FunctionX.formatLargeNumber(controller.donation.donationBasic.remainingDonations)} ${"SAR".tr}",
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ).fadeAnimation350,
            if (controller.donation.donationSettings.isShowCompletionIndicator)
              const SizedBox(height: 10),

            /// Completion Indicator Line
            if (controller.donation.donationSettings.isShowCompletionIndicator)
              LinearProgressIndicator(
                value: controller.donation.donationBasic.currentDonations /
                    controller.donation.donationBasic.totalDonations,
                borderRadius: BorderRadius.circular(50),
                minHeight: 10,
              ).marginOnly(bottom: 16).fadeAnimation400,

            /// Details
            TextX(
              "Project Description",
              style: TextStyleX.titleLarge,
            ).fadeAnimation500,
            const SizedBox(height: 6),
            HtmlWidget(
              Get.isDarkMode
                  ? controller.donation.donationDetails.description
                      .replaceAllMapped(
                          RegExp(
                              r'color:\s*(rgb\(0,\s*0,\s*0\)|#000000|black|rgb\(255,\s*255,\s*255\)|#ffffff|white)',
                              caseSensitive: false), (match) {
                      const colorMap = {
                        'rgb(0, 0, 0)': 'rgb(255, 255, 255)',
                        '#000000': '#ffffff',
                        'black': 'white',
                        'rgb(255, 255, 255)': 'rgb(0, 0, 0)',
                        '#ffffff': '#000000',
                        'white': 'black',
                      };
                      return 'color: ${colorMap[match.group(1)?.toLowerCase()] ?? match.group(1)}';
                    })
                  : controller.donation.donationDetails.description,
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
                    statistic:
                        controller.donation.donationBasic.currentDonations,
                    subtitle: "Total amount of donations",
                    isMoney: true,
                  ),
                ),
                if (controller.donation.donationSettings.isShowDonorsCount)
                  const SizedBox(width: 8),
                if (controller.donation.donationSettings.isShowDonorsCount)

                  /// Total Targets
                  Flexible(
                    child: StatisticCardX(
                      color: Theme.of(context).cardColor,
                      icon: Icons.favorite_rounded,
                      statistic:
                          controller.donation.donationBasic.countDonations,
                      subtitle: "Number of donations",
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
