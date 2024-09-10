import 'dart:async';
import 'package:get/get.dart';
import '../../../../Data/data.dart';

class OrganizationSelectionController extends GetxController {
  bool? isQuickDonation;
  OrganizationSelectionController({this.isQuickDonation});
  //============================================================================
  // Variables

  RxString orgSelected = "All".obs;

  //============================================================================
  // Functions

  onChange(String? val) {
    orgSelected.value = val ?? "";
    Get.back();
  }

  Future<List<String>> getData(
      ScrollRefreshLoadMoreParametersX data) async {
    try {
      List<OrganizationX> results = await DatabaseX.getAllOrganizations(
        isQuickDonation: isQuickDonation,
        page: data.page,
        perPage: data.perPage,
      );
      return ["All", ...results.map((e) => e.name)];
    } catch (e) {
      return Future.error(e);
    }
  }
}
