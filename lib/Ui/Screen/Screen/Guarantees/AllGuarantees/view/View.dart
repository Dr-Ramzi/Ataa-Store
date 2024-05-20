import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../UI/Animation/animation.dart';
import '../../../../../GeneralState/empty.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/header.dart';
import 'Sections/loading.dart';

class AllGuaranteesView extends GetView<AllGuaranteesController> {
  const AllGuaranteesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Guarantees",
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
            return Obx(
              () => AbsorbPointer(
                absorbing: controller.isLoading.value,
                child: Column(
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
                      child: Column(
                        children: [
                          /// if Empty Guarantees on Search
                          if (controller.guaranteesResult.isEmpty)
                            const Expanded(
                              child: EmptyView(
                                message:
                                    "There are no search results.\nTry searching for something else",
                              ),
                            ),

                          /// Guarantees Result
                          if (controller.guaranteesResult.isNotEmpty)
                            GetBuilder<AllGuaranteesController>(
                              builder: (controller) => Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 30,
                                    left: StyleX.hPaddingApp,
                                    right: StyleX.hPaddingApp,
                                  ),
                                  itemCount: controller.guaranteesResult.length,

                                  /// Cards
                                  itemBuilder: (context, index) =>
                                      GuaranteeCardX(
                                    guarantee:
                                        controller.guaranteesResult[index],
                                    onAddToCart: controller.onAddToCart,
                                    onDonation: controller.onDonation,
                                    payDonationButtonState: controller
                                            .donationButtonsState[
                                        controller.guaranteesResult[index].id]!,
                                    addToCartButtonState: controller
                                            .addToCartButtonsState[
                                        controller.guaranteesResult[index].id]!,
                                  ).fadeAnimation300,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
