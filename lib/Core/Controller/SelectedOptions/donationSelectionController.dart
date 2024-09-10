import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/data.dart';

class DonationSelectionControllerX extends GetxController {
  //============================================================================
  // Variables

  List<DonationX> donations = [];
  Rx<DonationX?> donationSelected = Rx<DonationX?>(null);
  RxList<DonationX> donationsResult = <DonationX>[].obs;
  TextEditingController search = TextEditingController();

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch donation opportunities from the database
      await Future.delayed(const Duration(seconds: 1)); // delete this
      // donations = TestDataX.donations;
      donationsResult.value = [];
      donationsResult.addAll(donations);
      onSearching(search.text);
    } catch (e) {
      return Future.error(e);
    }
  }

  /// Erase all data and return it to its default state
  clearData() {
    donations = [];
    donationsResult.value = [];
    donationSelected.value = null;
    search.text = "";
  }

  onChange(DonationX? val){
    donationSelected.value = val;
    Get.back();
  }

  /// The search process changes each time the search input
  onSearching(String search) async {
    /// TODO: Database >>> Change the search code if you want to retrieve search results from the database
    try {
      /// clean search text from withe space and convert all char to lower case for contains with donation data
      search = search.toLowerCase().trimLeft().trimRight();

      /// Bring all deductions that partially or completely match the name or description
      donationsResult.value = donations.where((donation) {
        return donation.name.toLowerCase().contains(search) ||
            donation.description.toLowerCase().contains(search);
      }).toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
