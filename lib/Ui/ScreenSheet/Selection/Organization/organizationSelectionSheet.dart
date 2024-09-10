import 'package:flutter/material.dart';
import '../../../../Core/Controller/SelectedOptions/organizationSelectionController.dart';
import '../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// View organizations to choose one of them
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

organizationSelectionSheetX(OrganizationSelectionController controller) {
  return bottomSheetX(
    title: "Donation project",
    child: ScrollRefreshLoadMoreX<String>(
      fetchData: controller.getData,
      initLoading: const SizedBox(
        height: 180,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      isExpanded: false,
      itemBuilder: (data, index) {
        return RadioButtonX(
          label: data,
          value: data,
          onChanged: controller.onChange,
          groupValue: controller.orgSelected.value,
        );
      },
    ),
  );
}
