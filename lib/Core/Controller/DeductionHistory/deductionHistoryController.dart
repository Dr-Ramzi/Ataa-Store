import 'dart:async';
import 'package:get/get.dart';
import '../../../../Data/data.dart';
import '../../../Data/Enum/model_type_status.dart';
import '../../../Data/Model/Deduction/Order/deductionOrder.dart';
import '../../../Data/Model/PaymentTransaction/paymentTransactionItem.dart';

class DeductionHistoryControllerX extends GetxController {
  //============================================================================
  // Variables

  late DeductionOrderX myDeduction;
  List<PaymentTransactionItemX<DeductionOrderX>> history = [];

  //============================================================================
  // Functions

  /// Erase all data and return it to its default state
  clearData() {
    history = [];
  }

  Future<void> getData() async {
    history = await DatabaseX.getAllMyRecords<DeductionOrderX>(
      type: ModelTypeStatusX.deduction,
      orderModelFromJson: DeductionOrderX.fromJson,
      isAllWithoutPaginated: true,
      byModelId:myDeduction.modelId,
    );
  }
}
