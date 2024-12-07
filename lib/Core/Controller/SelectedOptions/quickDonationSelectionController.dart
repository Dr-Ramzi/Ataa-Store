import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/data.dart';
import '../../../Data/Model/Donation/donation.dart';

class QuickDonationSelectionController extends GetxController {
  //============================================================================
  // Variables

  Rx<DonationX?> selected = Rx<DonationX?>(null);
  ScrollController scrollController =ScrollController();

  //============================================================================
  // Functions

  onChange(DonationX? val) {
    selected.value = val;
    Get.back();
  }

  Future<List<DonationX>> getData(
      ScrollRefreshLoadMoreParametersX data,
      ) async {
    return await DatabaseX.getAllDonationInQuickDonation();
  }
}
