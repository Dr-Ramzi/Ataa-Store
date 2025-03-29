import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class DonationDetailsSectionX extends GetView<CampaignDetailsController> {
  const DonationDetailsSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 120,
          left: StyleX.hPaddingApp,
          right: StyleX.hPaddingApp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Alarm card
            ContainerX(
              color: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    controller.campaign.title,
                    color: Theme.of(context).primaryColor,
                    style: TextStyleX.headerSmall,
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text:
                      "${"This campaign was created by a user of the Ataa platform via".tr} ",
                      style: TextStyleX.titleMedium.copyWith(
                        color: ColorX.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: FontX.fontFamily,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${'Donation campaigns'.tr}.',
                          style: TextStyleX.titleMedium.copyWith(
                            decoration: TextDecoration.underline,
                            color: ColorX.primary,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: FontX.fontFamily,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.showAllCampaigns,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).fadeAnimation300,

            const SizedBox(height: 14),

            TextX(
              controller.campaign.donation.donationBasic.name,
              color: Theme.of(context).primaryColor,
              style: TextStyleX.headerSmall,
            ).fadeAnimation300,

            const SizedBox(height: 14),

            /// Details
            TextX(
              "Project Description",
              style: TextStyleX.titleLarge,
            ).fadeAnimation400,
            const SizedBox(height: 6),
            HtmlWidget(
              Get.isDarkMode
                  ? controller.campaign.donation.donationDetails.description
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
                  : controller.campaign.donation.donationDetails.description,
              textStyle: TextStyleX.titleSmall,
            ).fadeAnimation500,

            const SizedBox(height: 10),

            // if(controller.campaign.donation.donationSettings.isShowCompletionIndicator || controller.campaign.donation.donationSettings.isShowDonationsPercentage)
            ContainerX(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // if (controller.campaign.donation.donationSettings.isShowCompletionIndicator &&
                //     controller.campaign.donation.donationSettings.isShowDonationsPercentage)
                //   TextX(
                //     "${"Collected".tr} ${controller.campaign.donation.donationBasic.completionRate % 1 == 0 ? controller.campaign.donation.donationBasic.completionRate.toInt().toString() : controller.campaign.donation.donationBasic.completionRate.toStringAsFixed(2)}%",
                //     color: Theme.of(context).primaryColor,
                //   ),
                // if (controller
                //     .campaign.donation.donationSettings.isShowCompletionIndicator &&
                //     !controller.campaign.donation.donationSettings.isShowDonationsPercentage)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextX(
                        "${"Collected".tr} ${FunctionX.formatLargeNumber(controller.campaign.currentDonations)} ${"SAR".tr}",
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 8),
                      TextX(
                        "${"Remaining".tr} ${FunctionX.formatLargeNumber(controller.campaign.remainingDonations)} ${"SAR".tr}",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                // if (controller.campaign.donation.donationSettings.isShowCompletionIndicator)
                  const SizedBox(height: 10),

                /// Completion Indicator Line
                // if (controller.campaign.donation.donationSettings.isShowCompletionIndicator)
                  LinearProgressIndicator(
                    value: controller.campaign.currentDonations /
                        controller.campaign.totalDonations,
                    borderRadius: BorderRadius.circular(50),
                    minHeight: 10,
                  ),
              ],),
            ).fadeAnimation550.marginOnly(bottom: 16),

            /// Statistics
            Row(
              children: [
                /// Total donations
                Flexible(
                  child: StatisticCardX(
                    color: Theme.of(context).cardColor,
                    icon: Icons.payments_rounded,
                    statistic:
                    controller.campaign.currentDonations,
                    subtitle: "Total amount of donations",
                    isMoney: true,
                  ),
                ),
                // if (controller.campaign.donation.donationSettings.isShowDonorsCount)
                  const SizedBox(width: 8),
                // if (controller.campaign.donation.donationSettings.isShowDonorsCount)

                /// Total Targets
                  Flexible(
                    child: StatisticCardX(
                      color: Theme.of(context).cardColor,
                      icon: Icons.favorite_rounded,
                      statistic:
                      controller.campaign.countDonations,
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
