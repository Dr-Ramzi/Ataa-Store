import 'package:get/get.dart';
import '../../../Ui/ScreenSheet/Sort/SortByFrequency/sortByFrequency.dart';
import '../../../Ui/ScreenSheet/Sort/SortByGeneral/sortByGeneral.dart';
import '../Sort/sortByFrequencyController.dart';
import '../Sort/sortByGeneralController.dart';
import 'filterByOrganizationController.dart';

class FilterControllerX extends GetxController {
  //============================================================================
  // Injection of required controls

  FilterByOrganizationControllerX filterByOrgController =
      Get.put(FilterByOrganizationControllerX());
  SortByGeneralControllerX sortByGeneralController =
      Get.put(SortByGeneralControllerX());
  SortByFrequencyControllerX sortByFrequencyController =
      Get.put(SortByFrequencyControllerX());

  //============================================================================
  // Variables

  RxBool isZakat = false.obs;
  RxString sort = "All".obs;

  //============================================================================
  // Functions

  onChangeSort(String val) => sort.value = val;
  onChangeZakat(bool val) => isZakat.value = val;

  /// If it does not return a positive value, the filtering process will not be performed
  onCancelFilter() => Get.back(result: false);

  /// The return value is captured and filtered accordingly, and the filtering data is taken from the value of the variables
  onFilter() => Get.back(result: true);

  onTapSortByFrequency() =>
      sortByFrequencySheetX(controller: sortByFrequencyController);

  onTapSortByGeneral() =>
      sortByGeneralSheetX(controller: sortByGeneralController);
}
