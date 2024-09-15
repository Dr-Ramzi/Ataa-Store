import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../../ScreenSheet/Pay/SubscriptionDeduction/subscriptionDeductionSheet.dart';

class AllDeductionsController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  FilterControllerX filterController =
      Get.put(FilterControllerX(tag: "All Deduction")..isShowDeduction=true, tag: "All Deduction");

  //============================================================================
  // Variables

  TextEditingController search = TextEditingController();
  List<DeductionX> deductions = [];
  RxList<DeductionX> deductionsResult = <DeductionX>[].obs;

  //============================================================================
  // Functions

  Future<List<DeductionX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    List<DeductionX> results = await DatabaseX.getDeductionsBySearch(
      page: data.page,
      perPage: data.perPage,
      sortType: data.orderBy,
      searchQuery: data.searchQuery,
      categoryID: data.filters?[NameX.categoryID],
      recurring: data.filters?[NameX.recurring],
    );
    return results;
  }


  onTapDeduction(String id) =>
      Get.toNamed(RouteNameX.deductionDetails, arguments: id);

  onSubscriptionDonation(deduction) async {
    await subscriptionDeductionSheetX(deduction);
  }

  //----------------------------------------------------------------------------
  // Filter

  onFilter() async {
    await generalFilterSheetX(controller: filterController);
  }
}
