import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Controller/Sort/sortByFrequencyController.dart';
import '../../../../Data/data.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Show sorting options by deduction frequency
/// like: Daily, Weekly, Monthly
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sortByFrequencySheetX({required SortByFrequencyControllerX controller}){
  return bottomSheetX(
    title: "Filter and sort",
    child: Obx(
          () => Column(
        children: [
          /// Options Cards
          ...FrequencySortEX.values.map(
                (val) => RadioButtonX(
              groupValue:
              controller.frequencySelected.value,
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