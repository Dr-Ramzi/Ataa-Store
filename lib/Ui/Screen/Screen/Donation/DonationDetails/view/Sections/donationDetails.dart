import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
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
                            "${FunctionX.formatLargeNumber(controller.donation.currentDonations)} ${"SAR".tr}",
                            style: TextStyleX.headerSmall,
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
                      horizontal: 16,
                      vertical: 20,
                    ),
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
                            "${FunctionX.formatLargeNumber(controller.donation.remainingDonations)} ${"SAR".tr}",
                            style: TextStyleX.headerSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ).fadeAnimation400,
            const SizedBox(height: 12),

            /// Donations progress bar
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: controller.donation.donationProgress / 100,
                    borderRadius: BorderRadius.circular(50),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(width: 16),
                TextX(
                  "${controller.donation.donationProgress.toStringAsFixed(2)} %",
                  style: TextStyleX.supTitleLarge,
                )
              ],
            ).fadeAnimation400,
            const SizedBox(height: 16),

            /// Details
            TextX(
              "Project Description",
              style: TextStyleX.titleLarge,
            ).fadeAnimation500,
            const SizedBox(height: 6),
            TextX(
              controller.donation.description,
              style: TextStyleX.titleSmall,
              maxLines: 100,
            ).fadeAnimation500,
            const SizedBox(height: 12),
            TextX(
              "Project Idea",
              style: TextStyleX.titleLarge,
            ).fadeAnimation500,
            const SizedBox(height: 6),
            TextX(
              controller.donation.idea,
              style: TextStyleX.titleSmall,
              maxLines: 100,
            ).fadeAnimation500,
            const SizedBox(height: 12),
            TextX(
              "Project plan",
              style: TextStyleX.titleLarge,
            ).fadeAnimation600,
            const SizedBox(height: 6),
            TextX(
              controller.donation.plan,
              style: TextStyleX.titleSmall,
              maxLines: 100,
            ).fadeAnimation600,
            const SizedBox(height: 16),

            /// Statistics More
            Row(
              children: [
                /// Total donations
                Flexible(
                  child: StatisticCardX(
                    color: Theme.of(context).cardColor,
                    icon: Icons.favorite_rounded,
                    statistic: controller.donation.totalDonations,
                    subtitle: "Total donations",
                  ),
                ),
                const SizedBox(width: 8),

                /// Total Targets
                Flexible(
                  child: StatisticCardX(
                    color: Theme.of(context).cardColor,
                    icon: Icons.group_rounded,
                    statistic: controller.donation.totalTargets,
                    subtitle:
                        "${"Targeted so far".tr}\n ${controller.donation.currentTargets} ${"people remaining".tr}",
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
