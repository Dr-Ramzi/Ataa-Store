import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/Model/Deduction/deduction.dart';
import '../../../../../Data/data.dart';
import '../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../ScreenSheet/Pay/SubscriptionDeduction/subscriptionDeductionSheet.dart';

class AllDeductionsController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  FilterControllerX filterController = Get.put(
    FilterControllerX(tag: "All Deduction")..isShowDeduction = true,
    tag: "All Deduction",
  );

  //============================================================================
  // Variables

  TextEditingController search = TextEditingController();
  List<DeductionX> deductions = [];
  RxList<DeductionX> deductionsResult = <DeductionX>[].obs;

  //============================================================================
  // Functions

  Future<List<DeductionX>> getData(
      ScrollRefreshLoadMoreParametersX data) async {
    List<DeductionX> results = [];
    if (app.generalSettings.isActiveDeductionSearch) {
      results = await DatabaseX.getDeductionsBySearch(
        page: data.page,
        perPage: data.perPage,
        sortType: data.orderBy,
        searchQuery: data.searchQuery,
        categoryID: data.filters?[NameX.categoryId],
        recurring: data.filters?[NameX.recurring],
      );
      return results;
    } else {
      results = await DatabaseX.getAllDeductions(
        page: data.page,
        perPage: data.perPage,
      );
    }
    return results;
  }

  Future<dynamic> onTapDeduction(int code) async {
    var x = await Get.toNamed(RouteNameX.deductionDetails, arguments: code);
    return x;
  }

  Future<bool> onSubscriptionDonation(deduction) async {
    (dynamic isOpenPayment, dynamic deductionAmount)? subscription =
        await subscriptionDeductionSheetX(deduction);
    if (subscription != null && subscription.$1 == true) {
      var isDone = await Get.toNamed(
        RouteNameX.deductionPayment,
        arguments: [
          deduction,
          deduction.isOpenPrice ? subscription.$2 : deduction.initialPrice
        ],
      );
      if (isDone == true) {
        return true;
      }
    }
    return false;
  }

  //----------------------------------------------------------------------------
  // Filter

  onFilter() async {
    await generalFilterSheetX(controller: filterController);
  }
}
