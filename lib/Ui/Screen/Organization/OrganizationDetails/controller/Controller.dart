import 'package:ataa/Core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../Data/Model/Donation/donation.dart';
import '../../../../../Data/data.dart';
import '../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class OrganizationDetailsController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  FilterControllerX filterController =
      Get.put(FilterControllerX(tag: "Organization Details")..isShowOrganization=false, tag: "Organization Details");

  //============================================================================
  // Variables

  OrganizationX org = Get.arguments; // The ID is sent from the previous page

  TextEditingController search = TextEditingController();
  ScrollController scrollController = ScrollController();

  //============================================================================
  // Functions

  Future<List<DonationX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    try {
      List<DonationX> results = await DatabaseX.getDonationsBySearch(
        page: data.page,
        perPage: data.perPage,
        sortType: data.orderBy,
        searchQuery: data.searchQuery,
        isZakat: data.filters?[NameX.isZakat],
        categoryID: org.id,
      );
      return results;
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter() async {
    await generalFilterSheetX(controller: filterController);
  }

  //----------------------------------------------------------------------------
  // Other

  onPayDonation(donation) async => await payDonationSheet(donation);

  onAddToCart(donation) async =>
      await payDonationSheet(donation, onlyAddToCart: true);
}
