import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class DeductionDetailsSectionX extends GetView<DeductionDetailsController> {
  const DeductionDetailsSectionX({super.key});
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
            /// Description
            TextX(
              "Description of deduction",
              style: TextStyleX.titleLarge,
            ).fadeAnimation500,
            const SizedBox(height: 6),
            TextX(
              controller.deduction.description,
              style: TextStyleX.titleSmall,
              maxLines: 100,
            ).fadeAnimation500,
            const SizedBox(height: 26),

            /// Statistics
            Row(
              children: [
                /// Total donations
                Flexible(
                  child: StatisticCardX(
                    color: Theme.of(context).cardColor,
                    icon: Icons.payments_rounded,
                    statistic: controller.deduction.currentDonations,
                    isMoney: true,
                    subtitle: "Total amount of donations",
                  ),
                ),
                const SizedBox(width: 8),

                /// Total Targets
                Flexible(
                  child: StatisticCardX(
                    color: Theme.of(context).cardColor,
                    icon: Icons.group_rounded,
                    statistic: controller.deduction.totalNumberSubscriptions,
                    subtitle: "Total number of subscribers",
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
