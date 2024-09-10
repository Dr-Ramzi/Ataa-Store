import 'dart:async';
import 'package:get/get.dart';
import '../../../../Data/data.dart';

class FilterByOrganizationControllerX extends GetxController {
  //============================================================================
  // Variables

  OrganizationX orgEmpty = OrganizationX(id: '', name: '',isShowHome: true, isShowQuickDonation: true);
  late Rx<(String, OrganizationX)> optionSelected =
      ("All", orgEmpty).obs;
  List<(String, OrganizationX)> options = [];
  late (String, OrganizationX) fixedData = ("All", orgEmpty);

  //============================================================================
  // Functions

  onChange((String, OrganizationX)? val) {
    if (val != null) {
      optionSelected.value = val;
    }
    Get.back();
  }

  /// Erase all data and return it to its default state
  clearData() {
    optionSelected.value = fixedData;
  }

  Future<List<(String, OrganizationX)>> getData(
    ScrollRefreshLoadMoreParametersX data,
  ) async {
    List<OrganizationX> results = await DatabaseX.getAllOrganizations(
      page: data.page,
      perPage: data.perPage,
    );
    if (optionSelected.value.$1 != fixedData.$1) {
      var val = results.firstWhere((x) => x.id == optionSelected.value.$2.id,
          orElse: () => optionSelected.value.$2);
      optionSelected.value = (val.name, val);
    }
    return results.map((e) => (e.name, e)).toList();
  }
}
