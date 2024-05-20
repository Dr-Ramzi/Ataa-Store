import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Controller/Filter/filterController.dart';
import '../../../Widget/widget.dart';
import '../FilterByOrganization/filterByOrganizationSheet.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// A general filtering option that serves more than one department
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

generalFilterSheetX({
  required FilterControllerX controller,
  bool isOrganization = true,
  bool isDeduction = false,
  bool isZakat = true,
}) {
  return bottomSheetX(
    title: "Filter and sort",
    child: Column(
      children: [
        /// Zakat
        if (isZakat && !isDeduction)
          SwitchX(
            value: controller.isZakat.value,
            onChange: controller.onChangeZakat,
            label: "Zakat disbursement only",
            margin: const EdgeInsets.only(bottom: 5),
          ).fadeAnimation200,

        /// Frequency
        if (isDeduction)
          Obx(
            () => MultipleSelectionCardX(
              title: "Filter by frequency",
              onTap: controller.onTapSortByFrequency,
              selected: controller
                  .sortByFrequencyController.frequencySelected.value.name,
            ),
          ).fadeAnimation200,
        if (isDeduction) const SizedBox(height: 10),

        /// Organization
        if (isOrganization)
          Obx(
            () => MultipleSelectionCardX(
              title: "Filter by program",
              onTap: filterByOrganizationSheetX,
              selected: controller.filterByOrgController.orgSelected.value,
            ),
          ).fadeAnimation300,
        if (isOrganization) const SizedBox(height: 10),

        /// Sort
        Obx(
          () => MultipleSelectionCardX(
            title: "Sort by",
            onTap: controller.onTapSortByGeneral,
            selected:
                controller.sortByGeneralController.generalSelected.value.name,
          ),
        ).fadeAnimation300,
        const SizedBox(height: 10),

        /// Buttons
        Row(
          children: [
            Flexible(
              child: ButtonX(
                onTap: controller.onFilter,
                text: "Apply",
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: ButtonX.second(
                onTap: controller.onCancelFilter,
                text: "Cancel",
              ),
            )
          ],
        ).fadeAnimation400
      ],
    ),
  );
}
