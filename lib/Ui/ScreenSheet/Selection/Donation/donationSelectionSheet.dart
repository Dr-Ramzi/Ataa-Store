import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Controller/SelectedOptions/donationSelectionController.dart';
import '../../../../Data/data.dart';
import '../../../GeneralState/empty.dart';
import '../../../GeneralState/error.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// View donation projects to choose one of them with a search bar
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

donationSelectionSheetX({
  required DonationSelectionControllerX controller,
}) {
  return bottomSheetX(
    isPaddingBottom: false,
    title: "Choose a donation opportunity",
    child: SizedBox(
      height: 400,
      child: FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          /// Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
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
              /// Search Bar
              TextFieldX(
                color: Get.theme.cardColor,
                controller: controller.search,
                hint: "search...",
                icon: Icons.search,
                onChanged: controller.onSearching,
              ).fadeAnimation200,
              const SizedBox(height: 3),
              Obx(
                () {
                  /// Empty State
                  if (controller.donationsResult.isEmpty) {
                    return const Expanded(
                      child: EmptyView(
                        message:
                            "There are no search results.\nTry searching for something else",
                      ),
                    );
                  } else {
                    /// Donations Card Results
                    return Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 10, top: 3),
                        child: Column(
                          children: [
                            ...controller.donationsResult.map(
                              (val) => RadioButtonX<DonationX?>(
                                groupValue: controller.donationSelected.value,
                                value: val,
                                onChanged: controller.onChange,
                                label: val.name,
                              ).fadeAnimation300,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}
