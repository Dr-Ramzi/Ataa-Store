import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/Model/Donation/donation.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class ZakatDisbursementsController extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  FilterControllerX filterController =
      Get.put(FilterControllerX(tag: "Zakat")..isShowZakat=false, tag: "Zakat");

  //============================================================================
  // Variables

  TextEditingController search = TextEditingController();

  //============================================================================
  // Functions

  Future<List<DonationX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    try {
      List<DonationX> results = await DatabaseX.getDonationsBySearch(
        page: data.page,
        perPage: data.perPage,
        sortType: data.orderBy,
        searchQuery: data.searchQuery,
        isZakat: true,
        categoryID: data.filters?[NameX.categoryId],
      );
      return results;
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Other

  onDonationDonation(donation) async => await payDonationSheet(donation);

  onDonationAddToCart(donation) async =>
      await payDonationSheet(donation, onlyAddToCart: true);

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter() async {
    await generalFilterSheetX(controller: filterController);
  }

}
