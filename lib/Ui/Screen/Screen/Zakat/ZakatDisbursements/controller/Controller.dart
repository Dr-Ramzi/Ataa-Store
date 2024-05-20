import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class ZakatDisbursementsController extends GetxController {
  //============================================================================
  // Injection of required controls

  FilterControllerX filterController =
      Get.put(FilterControllerX(), tag: "Zakat");

  //============================================================================
  // Variables

  List<DonationX> donations = [];
  RxList<DonationX> donationsResult = <DonationX>[].obs;

  TextEditingController search = TextEditingController();

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch all donations that are subject to zakat
      await Future.delayed(const Duration(seconds: 1)); // delete this

      donations = TestDataX.donations
          .where((element) => element.isZakat == true)
          .toList();

      donationsResult.value = donations;

      /// If he moves to another screen and returns here and there was a previous search,
      /// it will return the results of the last search
      if (search.text.isNotEmpty) {
        onSearching(search.text);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Other

  onDonationDonation(donation) async => await payDonationSheet(donation);

  onTapDonation(String id) =>
      Get.toNamed(RouteNameX.donationDetails, arguments: id);

  onDonationAddToCart(donation) async =>
      await payDonationSheet(donation, onlyAddToCart: true);

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter() async {
    bool? result =
        await generalFilterSheetX(isZakat: false, controller: filterController);
    if (result == true) {
      /// TODO: Database >>> Add a donation filter
      /// TODO: Algorithm >>> Add a donation filter
      onSearching(search.text);
    }
  }

  onSearching(String search) async {
    /// TODO: Expected Condition >>> Change the search code if you want to retrieve search results from the database
    try {
      /// clean search text from withe space and convert all char to lower case for contains with donation data
      search = search.toLowerCase().trimLeft().trimRight();

      /// Bring all donations that partially or completely match the name or description
      donationsResult.value = donations
          .where(
            (donation) =>
                donation.name.toLowerCase().contains(search) ||
                donation.description.toLowerCase().contains(search),
          )
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
