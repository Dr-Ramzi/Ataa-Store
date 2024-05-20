import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../../ScreenSheet/Pay/SubscriptionDeduction/subscriptionDeductionSheet.dart';

class AllDeductionsController extends GetxController {
  //============================================================================
  // Injection of required controls

  FilterControllerX filterController =
      Get.put(FilterControllerX(), tag: "All Deduction");

  //============================================================================
  // Variables

  TextEditingController search = TextEditingController();
  List<DeductionX> deductions = [];
  RxList<DeductionX> deductionsResult = <DeductionX>[].obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch All donations
      await Future.delayed(const Duration(seconds: 1)); // delete this

      deductions = TestDataX.deductions;
      deductionsResult.value = deductions;

      /// If he moves to another screen and returns here and there was a previous search,
      /// it will return the results of the last search
      if (search.text.isNotEmpty) {
        onSearching(search.text);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  onTapDeduction(String id) =>
      Get.toNamed(RouteNameX.deductionDetails, arguments: id);

  onSubscriptionDonation(deduction) async {
    await subscriptionDeductionSheetX(deduction);
  }

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter() async {
    bool? result =
        await generalFilterSheetX(isDeduction: true, controller: filterController);
    if (result == true) {
      /// TODO: Database >>> Add a deduction filter
      /// TODO: Algorithm >>> Add a deduction filter
    }
  }

  onSearching(String search) async {
    /// TODO: Expected Condition >>> Change the search code if you want to retrieve search results from the database
    try {
      /// clean search text from withe space and convert all char to lower case for contains with donation data
      search = search.toLowerCase().trimLeft().trimRight();

      /// Bring all deductions that partially or completely match the name or description
      deductionsResult.value = deductions
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
