import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';
import '../../../../../../Widget/Basic/Utils/future_builder.dart';
import 'loading.dart';

class SharingLinksSectionX extends GetView<StatisticsController> {
  const SharingLinksSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderX(
      future: controller.getShareLinkStatistics,
      isHideIfError: true,
      isHideIfEmpty: true,
      loading: const LoadingSectionX().fadeAnimation300,
      child: (data) => SizedBox(
        child: StatisticGroupCardX(
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
                      statistic: data.countLinks,
                      subtitle: "Number of links",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.person_add_alt_rounded,
                      statistic: data.countNewRegistrationsViaLinks,
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
                      statistic: data.countDonationsViaLinks,
                      subtitle: "Number of donations",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.visibility_rounded,
                      statistic: data.countLinkVisits,
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
                      statistic: data.totalAmountDonationsViaLinks,
                      subtitle: "Total donation amounts via links",
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
