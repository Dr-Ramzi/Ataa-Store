import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Controller/SelectedOptions/organizationSelectionController.dart';
import '../../../GeneralState/error.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// View organizations to choose one of them
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

organizationSelectionSheetX(OrganizationSelectionController controller) {
  return bottomSheetX(
    title: "Donation program",
    child: FutureBuilder(
      future: controller.getData(),
      builder: (context, snapshot) {
        /// Loading State
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 180,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        /// Error State
        if (snapshot.hasError) {
          return ErrorView(
            error: snapshot.error.toString(),
          );
        }

        /// Main Content
        return Obx(
          () => Column(
            children: [
              /// Options Cards
              ...controller.options.map(
                (org) => RadioButtonX(
                  groupValue: controller.orgSelected.value,
                  value: org,
                  onChanged: controller.onChange,
                  label: org,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
