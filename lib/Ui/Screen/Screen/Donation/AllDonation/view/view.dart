import 'package:ataa/Data/data.dart';
import 'package:ataa/Ui/Widget/Basic/Other/scrollRefreshLoadMore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Animation/animation.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class AllDonationView extends GetView<AllDonationController> {
  const AllDonationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ScrollRefreshLoadMoreX<DonationX>(
                fetchData: controller.getData,
                filters: controller.filterController.filters.value,
                orderBy: controller.filterController.orderBy.value,
                searchQueryController: controller.search,
                padding: const EdgeInsets.only(
                  right: StyleX.hPaddingApp,
                  left: StyleX.hPaddingApp,
                  top: 6,
                  bottom: 60,
                ),
                initLoading: Column(
                  children: [
                    for (int i = 0; i < 5; i++)
                      ShimmerAnimationShapeX.donationCard()
                  ],
                ),
                emptyMessage: "There are no current donation projects",
                itemBuilder: (data, index) {
                  return DonationCardX(
                    doneImageUrl: controller.app.generalSettings.projectCompletionImageUrl,
                    onDonation: controller.onDonationDonation,
                    donation: data,
                    onAddToCart: controller.onDonationAddToCart,
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