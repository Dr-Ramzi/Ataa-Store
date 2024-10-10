import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Data/Model/Donation/donation.dart';
import '../../../Data/data.dart';
import '../../core.dart';

class DonationSelectionControllerX extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();

  //============================================================================
  // Variables

  Rx<DonationX?> donationSelected = Rx<DonationX?>(null);
  TextEditingController search = TextEditingController();

  //============================================================================
  // Functions

  Future<List<DonationX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    List<DonationX> results = await DatabaseX.getDonationsBySearch(
      page: data.page,
      perPage: data.perPage,
      searchQuery: data.searchQuery,
    );
    return results;
  }

  /// Erase all data and return it to its default state
  clearData() {
    donationSelected.value = null;
    search.text = "";
  }

  onChange(DonationX? val){
    donationSelected.value = val;
    Get.back();
  }
}
