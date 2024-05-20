import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Controller/Filter/filterByOrganizationController.dart';
import '../../../GeneralState/error.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Show available organizations to choose from
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

filterByOrganizationSheetX() {
  //============================================================================
  // Injection of required controls

  final FilterByOrganizationControllerX controller = Get.find();

  //============================================================================
  // Content

  return bottomSheetX(
    title: "Filter by program",
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
                (val) => RadioButtonX(
                  groupValue: controller.orgSelected.value,
                  value: val,
                  onChanged: controller.onChange,
                  label: val,
                ).fadeAnimation300,
              ),
            ],
          ),
        );
      },
    ),
  );
}
