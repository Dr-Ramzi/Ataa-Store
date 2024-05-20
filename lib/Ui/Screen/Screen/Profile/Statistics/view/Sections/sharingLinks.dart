import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class SharingLinksSectionX extends GetView<StatisticsController> {
  const SharingLinksSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return StatisticGroupCardX(
      linkTo: RouteNameX.sharingLinks,
      linkTitle: "Go to Sharing Links",
      title: "Sharing Links",
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: StatisticCardX(
                  icon: Icons.share_rounded,
                  statistic: controller.statistics.numLinks,
                  subtitle: "Number of links",
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: StatisticCardX(
                  icon: Icons.person_add_alt_rounded,
                  statistic: controller.statistics.newRegistrationsViaLinks,
                  subtitle: "New registrants",
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
                  statistic: controller.statistics.numDonationsViaLinks,
                  subtitle: "Number of donations",
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: StatisticCardX(
                  icon: Icons.visibility_rounded,
                  statistic: controller.statistics.numLinkVisits,
                  subtitle: "Number of visits",
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: StatisticCardX(
                  isMoney: true,
                  icon: Icons.payment_rounded,
                  statistic: controller.statistics.totalAmountDonationsViaLinks,
                  subtitle: "Total donation amounts via links",
                ),
              ),
            ],
          ),
        ],
      ),
    ).fadeAnimation400;
  }
}
