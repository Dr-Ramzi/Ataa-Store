import 'dart:async';
import 'package:get/get.dart';
import '../../../../Data/data.dart';

class OrganizationSelectionController extends GetxController {
  //============================================================================
  // Variables

  Rx<OrganizationX?> orgSelected = Rx<OrganizationX?>(null);
  OrganizationX allOption = OrganizationX(
    id: '',
    name: 'All',
    isShowHome: false,
    isShowQuickDonation: false,
  );

  //============================================================================
  // Functions

  onChange(OrganizationX? val) {
    orgSelected.value = val;
    Get.back();
  }

  Future<List<OrganizationX>> getData(
    ScrollRefreshLoadMoreParametersX data,
  ) async {
    return await DatabaseX.getAllOrganizations(
      page: data.page,
      perPage: data.perPage,
    );
  }

  @override
  void onInit() {
    orgSelected.value ??= allOption;
    super.onInit();
  }
}
