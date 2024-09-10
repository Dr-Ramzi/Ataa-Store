import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';
import 'loading.dart';

class CampaignsSectionX extends GetView<StatisticsController> {
  const CampaignsSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderX(
      future: controller.getCampaignStatistics,
      isHideIfError: true,
      isHideIfEmpty: true,
      loading: const LoadingSectionX().fadeAnimation100,
      child: (data) => SizedBox(
        child: StatisticGroupCardX(
          linkTo: RouteNameX.myCampaigns,
          linkTitle: "Go to my campaigns",
          title: "My Campaigns",
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.equalizer_rounded,
                      statistic: data.countCampaigns,
                      subtitle: "Number of campaigns",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: StatisticCardX(
                      isMoney: true,
                      icon: Icons.payments_rounded,
                      statistic: data.totalAmountCampaign,
                      subtitle: "Total campaign donation amounts",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.favorite_rounded,
                      statistic: data.countCampaignDonating,
                      subtitle: "Number of donations",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.visibility_rounded,
                      statistic: data.countCampaignVisits,
                      subtitle: "Number of visits",
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
