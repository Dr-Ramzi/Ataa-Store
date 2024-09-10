import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';
import '../../../../../../Widget/Basic/Utils/future_builder.dart';
import 'loading.dart';

class SponsorshipsSectionX extends GetView<StatisticsController> {
  const SponsorshipsSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderX(
      future: controller.getSponsorshipStatistics,
      isHideIfError: true,
      isHideIfEmpty: true,
      loading: const LoadingSectionX().fadeAnimation300,
      child: (data) => SizedBox(
        child: StatisticGroupCardX(
          linkTo: RouteNameX.mySponsorships,
          linkTitle: "Go to my sponsorships",
          title: "My Sponsorships",
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.thumb_up_alt_rounded,
                      statistic: data.countSponsorships,
                      subtitle: "Number of sponsorships",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: StatisticCardX(
                      isMoney: true,
                      icon: Icons.payments_rounded,
                      statistic: data.totalAmountSponsorships,
                      subtitle: "Total bail amounts",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ).fadeAnimation200,
      ),
    );
  }
}
