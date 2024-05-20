import 'dart:async';
import 'package:get/get.dart';
import '../../../Data/data.dart';

class FilterByCountryControllerX extends GetxController {
  //============================================================================
  // Variables

  RxString countrySelected = "All".obs;
  List<String> options = [];

  //============================================================================
  // Functions

  onChange(String? val) => countrySelected.value = val ?? "";

  getData() async {
    try {
      /// TODO: Database >>> Fetch available countries in the filtering process
      await Future.delayed(const Duration(seconds: 1)); // delete this
      options = ["All", ...TestDataX.countriesGuarantees];
    } catch (e) {
      return Future.error(e);
    }
  }
}
