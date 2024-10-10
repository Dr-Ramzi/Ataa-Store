import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/Model/Donation/donation.dart';
import '../../../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/header.dart';
import 'Sections/loading.dart';

class OrganizationDetailsView extends GetView<OrganizationDetailsController> {
  const OrganizationDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Program",
        actions: [CartIconButtonsX()],
      ),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: StyleX.hPaddingApp,
              vertical: StyleX.vPaddingApp,
            ),
            controller: controller.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title & Subtitle
                const HeaderSectionX(isMargin: false),

                /// Search Bar
                SearchBarX(
                  search: controller.search,
                  onTapFilter: controller.onFilter,
                  isMargin: false,
                  disabledSearch:
                      !controller.app.generalSettings.isActiveProjectSearch,
                ).marginSymmetric(vertical: 10).fadeAnimation200,

                TextX(
                  'Program Donation Opportunities',
                  style: TextStyleX.titleLarge,
                ).paddingSymmetric(vertical: 10).fadeAnimation200,
                ScrollRefreshLoadMoreX<DonationX>(
                  fetchData: controller.getData,
                  filters: controller.filterController.filters.value,
                  orderBy: controller.filterController.orderBy.value,
                  searchQueryController: controller.search,
                  parentScrollController: controller.scrollController,
                  padding: const EdgeInsets.only(top: 10),
                  initLoading: const LoadingSectionX(),
                  emptyMessage: "There are no current donation projects",
                  itemBuilder: (data, index) {
                    return DonationCardX(
                      donation: data,
                      doneImageUrl: controller
                          .app.generalSettings.projectCompletionImageUrl,
                      onDonation: controller.onPayDonation,
                      onAddToCart: controller.onAddToCart,
                    ).fadeAnimation300;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//import 'package:ataa/UI/Animation/animation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../Config/config.dart';
// import '../../../../../../Data/data.dart';
// import '../../../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
// import '../../../../../Widget/widget.dart';
// import '../controller/Controller.dart';
// import 'Sections/header.dart';
// import 'Sections/loading.dart';
//
// class OrganizationDetailsView extends GetView<OrganizationDetailsController> {
//   const OrganizationDetailsView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarX(
//         title: "Program",
//         actions: [CartIconButtonsX()],
//       ),
//       body: SafeArea(
//         child: Obx(
//           () {
//             return ScrollRefreshLoadMoreX<DonationX>(
//               fetchData: controller.getData,
//               filters: controller.filterController.filters.value,
//               orderBy: controller.filterController.orderBy.value,
//               searchQueryController: controller.search,
//               isEmptySearchCenter: false,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: StyleX.hPaddingApp,
//                 vertical: StyleX.vPaddingApp,
//               ),
//               initLoading: const LoadingSectionX(),
//               isScrollingInitLoading: false,
//               emptyMessage: "There are no current donation projects",
//               header: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Title & Subtitle
//                   const HeaderSectionX(isMargin:false),
//
//                   /// Search Bar
//                   SearchBarX(
//                     search: controller.search,
//                     onTapFilter: controller.onFilter,
//                     isMargin:false,
//                     disabledSearch:
//                         !controller.app.generalSettings.isActiveProjectSearch,
//                   ).marginSymmetric(vertical: 10),
//
//                   TextX('Program Donation Opportunities',style: TextStyleX.titleLarge,).paddingSymmetric(vertical: 10),
//
//                 ],
//               ),
//               isScrollingHeader: true,
//               isHideHeaderIfInitLoading: false,
//               isHideHeaderIfEmpty: false,
//               itemBuilder: (data, index) {
//                 return DonationCardX(
//                   donation: data,
//                   doneImageUrl: controller.app.generalSettings.projectCompletionImageUrl,
//                   onDonation: controller.onPayDonation,
//                   onAddToCart: controller.onAddToCart,
//                 ).fadeAnimation300;
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
