import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/data.dart';
import '../../../Data/Model/Donation/donation.dart';

class ZakatSelectionControllerX extends GetxController {
  //============================================================================
  // Variables

  late Rx<DonationX?> optionSelected = Rx<DonationX?>(null);
  List<(String, DonationX)> options = [];
  ScrollController scrollController = ScrollController();
  //============================================================================
  // Functions

  onChange(DonationX val) {
      optionSelected.value = val;
    Get.back();
  }

  /// Erase all data and return it to its default state
  clearData() {
    optionSelected.value = null;
  }

  Future<List<DonationX>> getData(
    ScrollRefreshLoadMoreParametersX data,
  ) async {
    return await DatabaseX.getAllDonations(
      page: data.page,
      perPage: data.perPage,
      isZakat: true,
    );
  }
}
