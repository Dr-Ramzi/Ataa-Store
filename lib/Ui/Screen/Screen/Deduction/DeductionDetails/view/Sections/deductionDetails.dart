import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
            HtmlWidget(Get.isDarkMode
                ? controller.deduction.description.replaceAllMapped(
                RegExp(r'color:\s*(rgb\(0,\s*0,\s*0\)|#000000|black|rgb\(255,\s*255,\s*255\)|#ffffff|white)', caseSensitive: false),
                    (match) {
                  const colorMap = {
                    'rgb(0, 0, 0)': 'rgb(255, 255, 255)',
                    '#000000': '#ffffff',
                    'black': 'white',
                    'rgb(255, 255, 255)': 'rgb(0, 0, 0)',
                    '#ffffff': '#000000',
                    'white': 'black',
                  };
                  return 'color: ${colorMap[match.group(1)?.toLowerCase()] ?? match.group(1)}';
                }):
              controller.deduction.description,
              textStyle: TextStyleX.titleSmall,
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
                    statistic: controller.deduction.achievedAmount,
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
                    statistic: controller.deduction.subscribersCount,
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
