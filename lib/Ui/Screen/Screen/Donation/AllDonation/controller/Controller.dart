import 'package:ataa/Core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../../Data/Model/Donation/donation.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class AllDonationController extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  late FilterControllerX filterController = Get.put(
    FilterControllerX(tag: "All Donation")..isShowSort = app.generalSettings.isActiveProjectSearch,
    tag: "All Donation",
  );

  //============================================================================
  // Variables

  TextEditingController search = TextEditingController();
  RxString searchQuery = ''.obs;

  //============================================================================
  // Functions

  Future<List<DonationX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    List<DonationX> results = await DatabaseX.getDonationsBySearch(
      page: data.page,
      perPage: data.perPage,
      sortType: data.orderBy,
      searchQuery: data.searchQuery,
      isZakat: data.filters?[NameX.isZakat],
      categoryID: data.filters?[NameX.categoryId],
    );
    return results;
  }

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter() async {
    await generalFilterSheetX(controller: filterController);
  }

  //----------------------------------------------------------------------------
  // Other


  onDonationDonation(donation) async => await payDonationSheet(donation);

  onDonationAddToCart(donation) async =>
      await payDonationSheet(donation, onlyAddToCart: true);
}
