import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/empty.dart';
import '../../../../../GeneralState/error.dart';
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
        title: "Association Programs",
        actions: [BasketIconButtonsX()],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            /// Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingSectionX();
            }

            /// Error State
            if (snapshot.hasError) {
              return ErrorView(
                error: snapshot.error.toString(),
              );
            }

            /// Main Content
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title & Subtitle
                const HeaderSectionX(),

                /// Search Bar
                SearchBarX(
                  search: controller.search,
                  onTapFilter: controller.onFilter,
                  onSearching: controller.onSearching,
                ).fadeAnimation200,
                Expanded(
                  child: Obx(
                    () {
                      /// if Empty Donation on Search
                      if (controller.donationsResult.isEmpty) {
                        return const EmptyView(
                          message:
                              "There are no search results.\nTry searching for something else",
                        );
                      } else {
                        /// Donation Result
                        return ListView.builder(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 30,
                            left: StyleX.hPaddingApp,
                            right: StyleX.hPaddingApp,
                          ),
                          itemCount: controller.donationsResult.length,
                          itemBuilder: (context, index) =>
                              CharitableProjectCardX(
                            isSmallCard: false,
                            isZakat: true,
                            obj: controller.donationsResult[index],
                            onTap: controller.onTapDonation,
                            onAddToCart: controller.onBasketDonation,
                            onDonation: controller.onDonationDonation,
                            totalDonations: controller
                                .donationsResult[index].totalDonations,
                            stockValue:
                                controller.donationsResult[index].stockValue,
                          ).fadeAnimation300,
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
