import 'dart:async';
import 'package:ataa/Core/Error/error.dart';
import 'package:ataa/Ui/ScreenSheet/DeductionHistory/deductionHistorySheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/Controller/DeductionHistory/deductionHistoryController.dart';
import '../../../../../../../Data/Enum/model_type_status.dart';
import '../../../../../../../Data/Model/Deduction/Order/deductionOrder.dart';
import '../../../../../../../Data/Model/PaymentTransaction/paymentTransactionItem.dart';
import '../../../../../../../Data/data.dart';
import '../../../../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
import '../../../../../../Widget/widget.dart';

class MyDeductionsController extends GetxController {
  //============================================================================
  // Injection of required controls

  DeductionHistoryControllerX deductionHistoryController =
  Get.put(DeductionHistoryControllerX());

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  RxList<ButtonStateEX> buttonsState = <ButtonStateEX>[].obs;
  RxBool isShowMore = false.obs;
  GlobalKey<ScrollRefreshLoadMoreXState> scrollRefreshLoadMoreKey = GlobalKey<ScrollRefreshLoadMoreXState>();
  //============================================================================
  // Functions

  Future<List<PaymentTransactionItemX<DeductionOrderX>>> getData(ScrollRefreshLoadMoreParametersX data) async {
    var result = await DatabaseX.getAllMyRecords<DeductionOrderX>(
      type: ModelTypeStatusX.deduction,
      orderModelFromJson: DeductionOrderX.fromJson,
      page: data.page,
      perPage: data.perPage,
    );
    /// Create buttons statuses for deductions
    for (int i = 0; i < result.length; i++) {
      buttonsState.add(ButtonStateEX.normal);
    }
    return result;
  }

  onShowMore(){
    isShowMore.value=true;
  }
  onTransactionHistory(PaymentTransactionItemX<DeductionOrderX> data)async{
    deductionHistoryController.myDeduction=data;
    await deductionHistorySheetX(controller: deductionHistoryController);
  }

  onUnsubscribe(PaymentTransactionItemX<DeductionOrderX> data,int index) async {
    if (isLoading.isFalse) {
      try {
        isLoading.value = true;
        buttonsState[index] = ButtonStateEX.loading;
        DeductionOrderX result = await DatabaseX.updateMyDeductionSubscriptionStatus(id: data.orderModel.modelId, status: false);
        data.orderModel=result;
        scrollRefreshLoadMoreKey.currentState?.updateItemByIndex(index,data);

        /// The time delay here is aesthetically beneficial
        buttonsState[index] = ButtonStateEX.normal;

        ToastX.success(message: "Subscription has been canceled successfully");
      } catch (error) {
        error.toErrorX.log();
        ToastX.error(message: error.toString());
        buttonsState[index] = ButtonStateEX.failed;
      }
      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
            () {
          buttonsState[index] = ButtonStateEX.normal;
          // This is to fix the update button display status.
          isLoading.value = true;
          isLoading.value = false;
        },
      );
    }
  }


}
