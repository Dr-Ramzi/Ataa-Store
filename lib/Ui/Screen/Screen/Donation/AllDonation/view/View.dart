import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Animation/animation.dart';
import '../../../../../GeneralState/empty.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/loading.dart';

class AllDonationView extends GetView<AllDonationController> {
  const AllDonationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
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
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 30,
                          left: StyleX.hPaddingApp,
                          right: StyleX.hPaddingApp,
                        ),
                        itemCount: controller.donationsResult.length,
                        /// Cards
                        itemBuilder: (context, index) =>
                            CharitableProjectCardX(
                          isSmallCard: false,
                          isZakat: controller.donationsResult[index].isZakat,
                          onTap: controller.onTapDonation,
                          onDonation: controller.onDonationDonation,
                          obj: controller.donationsResult[index],
                          onAddToCart: controller.onDonationAddToCart,
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
    );
  }
}
