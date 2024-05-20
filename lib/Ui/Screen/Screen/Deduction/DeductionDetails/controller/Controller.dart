import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/Controller/Other/donateOnBehalfOfFamilyController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Pay/SubscriptionDeduction/subscriptionDeductionSheet.dart';

class DeductionDetailsController extends GetxController {
  //============================================================================
  // Injection of required controls

  DonateOnBehalfOfFamilyController donateOnBehalfOfFamilyController = Get.put(DonateOnBehalfOfFamilyController(),tag: Get.arguments);

  //============================================================================
  // Variables

  final id = Get.arguments; // The ID is sent from the previous page
  late DeductionX deduction;

  Rx<ButtonStateEX> subscriptionButtonState = ButtonStateEX.normal.obs;
  PageController imagesController = PageController();

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch deduction details
      await Future.delayed(const Duration(seconds: 1)); /// delete this
      ///
      deduction = TestDataX.deductions.firstWhere((element) => element.id == id);
    } catch (e) {
      return Future.error(e);
    }
  }

  onSubscriptionDeduction () async => await subscriptionDeductionSheetX(deduction);
}
