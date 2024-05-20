import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class DonationDetailsSectionX extends GetView<CampaignDetailsController> {
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
            /// Alarm card
            ContainerX(
              color: Theme.of(context).colorScheme.onPrimary,
              child: Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: ColorX.primary,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text:
                            "${"This campaign was created by a user of the Ataa platform via".tr} ",
                        style: TextStyleX.titleMedium
                            .copyWith(color: ColorX.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'User Campaigns'.tr,
                            style: TextStyleX.titleMedium.copyWith(
                                decoration: TextDecoration.underline,
                                color: ColorX.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = controller.showAllCampaigns,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ).fadeAnimation300,
            const SizedBox(height: 12),

            /// Donations progress bar
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: controller.campaign.donationProgress / 100,
                    borderRadius: BorderRadius.circular(50),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(width: 16),
                TextX(
                  "${controller.campaign.donationProgress.toStringAsFixed(2)} %",
                  style: TextStyleX.supTitleLarge,
                )
              ],
            ).fadeAnimation400,
            const SizedBox(height: 12),

            /// Statistics
            Row(
              children: [
                /// Been Collected
                Expanded(
                  child: ContainerX(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextX(
                          "Been Collected",
                          style: TextStyleX.titleSmall,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(height: 5),
                        FittedBox(
                          child: TextX(
                            "${FunctionX.formatLargeNumber(controller.campaign.currentDonations)} ${"SAR".tr}",
                            style: TextStyleX.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                /// Remaining Amount
                Expanded(
                  child: ContainerX(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextX(
                          "Remaining Amount",
                          style: TextStyleX.titleSmall,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(height: 5),
                        FittedBox(
                          child: TextX(
                            "${FunctionX.formatLargeNumber(controller.campaign.remainingDonations)} ${"SAR".tr}",
                            style: TextStyleX.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ).fadeAnimation400,
            const SizedBox(height: 12),

            /// Total donations
            StatisticCardX(
              color: Theme.of(context).cardColor,
              icon: Icons.favorite_rounded,
              statistic: controller.campaign.totalDonations,
              subtitle: "Total donations",
            ).fadeAnimation600
          ],
        ),
      ),
    );
  }
}
