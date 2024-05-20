import 'package:get/get.dart';

import '../../../Data/data.dart';

class SortByFrequencyControllerX extends GetxController {
  //============================================================================
  // Variables

  /// The values are fetched from enum
  late Rx<FrequencySortEX> frequencySelected = FrequencySortEX.values[0].obs;

  //============================================================================
  // Functions

  onChange(FrequencySortEX? val) =>
      frequencySelected.value = val ?? FrequencySortEX.values[0];
}
