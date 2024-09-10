import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class ZakatDisbursementsView extends GetView<ZakatDisbursementsController> {
  const ZakatDisbursementsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Projects that accept Zakat",
        actions: [BasketIconButtonsX()],
      ),
      body: Obx(
            () {
          return Column(
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
                isEmptyCenter: false,
                padding: const EdgeInsets.only(
                  right: StyleX.hPaddingApp,
                  left: StyleX.hPaddingApp,
                  bottom: StyleX.vPaddingApp,
                  top: 6
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
                    donation: data,
                    doneImageUrl: controller.app.generalSettings.projectCompletionImageUrl,
                    onDonation: controller.onDonationDonation,
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
