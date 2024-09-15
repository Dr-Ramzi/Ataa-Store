import 'package:ataa/Data/data.dart';
import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class AllDeductionsView extends GetView<AllDeductionsController> {
  const AllDeductionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: "Deductions", actions: [CartIconButtonsX()]),
      body: Obx(
            () {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SearchBarX(
                disabledSearch : !controller.app.generalSettings.isActiveProjectSearch,
                search: controller.search,
                onTapFilter: controller.onFilter,
              ).fadeAnimation200,
              ScrollRefreshLoadMoreX<DeductionX>(
                fetchData: controller.getData,
                filters: controller.filterController.filters.value,
                orderBy: controller.filterController.orderBy.value,
                searchQueryController: controller.search,
                padding: const EdgeInsets.only(
                  right: StyleX.hPaddingApp,
                  left: StyleX.hPaddingApp,
                  top: 6,
                  bottom: StyleX.vPaddingApp,
                ),
                initLoading: Column(
                  children: [
                    for (int i = 0; i < 5; i++)
                      ShimmerAnimationShapeX.deductionCard()
                  ],
                ),
                emptyMessage: "There are no current deductions.",

                itemBuilder: (data, index) {
                  return DeductionCardX(
                    onTap: controller.onTapDeduction,
                    onSubscribe: controller.onSubscriptionDonation,
                    deduction: data,
                  ).fadeAnimation300;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
