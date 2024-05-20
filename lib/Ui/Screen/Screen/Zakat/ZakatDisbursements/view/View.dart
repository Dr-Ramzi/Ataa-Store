import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/empty.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import 'Sections/loading.dart';
import '../controller/Controller.dart';

class ZakatDisbursementsView extends GetView<ZakatDisbursementsController> {
  const ZakatDisbursementsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Zakat Disbursements",
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
              children: [
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: StyleX.hPaddingApp,
                          ),
                          itemCount: controller.donationsResult.length,
                          itemBuilder: (context, index) => CharitableProjectCardX(
                            isSmallCard: false,
                            obj: controller.donationsResult[index],
                            onTap: controller.onTapDonation,
                            onAddToCart: controller.onDonationAddToCart,
                            onDonation: controller.onDonationDonation,
                            isZakat: controller.donationsResult[index].isZakat,
                            totalDonations:
                                controller.donationsResult[index].totalDonations,
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
