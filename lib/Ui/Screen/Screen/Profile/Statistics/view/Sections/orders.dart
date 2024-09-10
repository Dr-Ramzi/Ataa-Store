import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';
import '../../../../../../Widget/Basic/Utils/future_builder.dart';
import 'loading.dart';

class OrdersSectionX extends GetView<StatisticsController> {
  const OrdersSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderX(
      future: controller.getOrderStatistics,
      isHideIfError: true,
      isHideIfEmpty: true,
      loading: const LoadingSectionX().fadeAnimation200,
      child: (data) => SizedBox(
        child: StatisticGroupCardX(
          linkTo: RouteNameX.myOrders,
          linkTitle: "Go to my orders",
          title: "My Orders",
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.shopping_bag_rounded,
                      statistic: data.countOrders,
                      subtitle: "Number of requests",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: StatisticCardX(
                      icon: Icons.verified_rounded,
                      statistic: data.countCompletedOrders,
                      subtitle: "Completed orders",
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
                      icon: Icons.payments_rounded,
                      statistic: data.totalAmountOrders,
                      subtitle: "Total amount of orders",
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
