import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class GuaranteesSectionX extends GetView<StatisticsController> {
  const GuaranteesSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticGroupCardX(
      linkTo: RouteNameX.myGuarantees,
      linkTitle: "Go to my guarantees",
      title: "My Guarantees",
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: StatisticCardX(
                  icon: Icons.thumb_up_alt_rounded,
                  statistic: controller.statistics.numGuarantees,
                  subtitle: "Number of guarantees",
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: StatisticCardX(
                  isMoney: true,
                  icon: Icons.payments_rounded,
                  statistic: controller.statistics.totalAmountGuarantees,
                  subtitle: "Total bail amounts",
                ),
              ),
            ],
          ),
        ],
      ),
    ).fadeAnimation400;
  }
}
