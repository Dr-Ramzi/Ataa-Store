import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/empty.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/loading.dart';

class AllDeductionsView extends GetView<AllDeductionsController> {
  const AllDeductionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: "Deductions", actions: [BasketIconButtonsX()]),
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
                      /// if Empty Deduction on Search
                      if (controller.deductionsResult.isEmpty) {
                        return const EmptyView(
                          message:
                              "There are no search results.\nTry searching for something else",
                        );
                      } else {
                        /// Deduction Result
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: StyleX.hPaddingApp,
                          ),
                          itemCount: controller.deductionsResult.length,
                          itemBuilder: (context, index) =>
                              CharitableProjectCardX(
                            onTap: controller.onTapDeduction,
                            onDonation: controller.onSubscriptionDonation,
                            obj: controller.deductionsResult[index],
                            deduction:
                                controller.deductionsResult[index].deduction,
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
