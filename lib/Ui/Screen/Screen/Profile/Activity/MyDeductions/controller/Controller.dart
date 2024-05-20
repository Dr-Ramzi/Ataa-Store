import 'dart:async';
import 'package:get/get.dart';

import '../../../../../../../Data/data.dart';
import '../../../../../../Widget/widget.dart';

class MyDeductionsController extends GetxController {
  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  RxList<DeductionRecordX> deductions = <DeductionRecordX>[].obs;
  RxList<ButtonStateEX> buttonsState = <ButtonStateEX>[].obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// Clear previously saved data if you restart this function again
      buttonsState.value = [];

      /// TODO: Database >>> Fetch All My Deductions
      await Future.delayed(const Duration(seconds: 1)); // delete this

      deductions.value = TestDataX.deductionRecords;

      /// Create buttons statuses for deductions
      for (int i = 0; i < deductions.length; i++) {
        buttonsState.add(ButtonStateEX.normal);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  onUnsubscribe(int index) async {
    if (isLoading.isFalse) {
      try {
        isLoading.value = true;
        buttonsState[index] = ButtonStateEX.loading;

        /// TODO: Database >>> Cancel subscription to deduction
        await Future.delayed(const Duration(seconds: 1)); // delete this

        /// Remove deduction from variables
        deductions.removeAt(index);
        buttonsState.removeAt(index);

        ToastX.success(message: "Subscription has been canceled successfully");
      } catch (error) {
        ToastX.error(message: error.toString());
        buttonsState[index] = ButtonStateEX.failed;
      }
      isLoading.value = false;
    }
  }
}
