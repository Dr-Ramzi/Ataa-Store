import 'dart:async';
import 'package:get/get.dart';
import '../../../../Data/data.dart';

class FilterByOrganizationControllerX extends GetxController {
  //============================================================================
  // Variables

  RxString orgSelected = "All".obs;
  List<OrganizationX> organizations = [];
  List<String> options = [];

  //============================================================================
  // Functions

  onChange(String? val) => orgSelected.value = val ?? "";

  getData() async {
    try {
      /// TODO: Database >>> Fetch available organizations in the filtering process
      await Future.delayed(const Duration(seconds: 1)); // delete this
      organizations = TestDataX.organizations; // delete this
      options = ["All", ...TestDataX.organizations.map((e) => e.name)];
    } catch (e) {
      return Future.error(e);
    }
  }
}
