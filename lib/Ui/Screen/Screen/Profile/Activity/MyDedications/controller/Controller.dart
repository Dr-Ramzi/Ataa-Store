import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class MyDedicationsController extends GetxController {
  //============================================================================
  // Variables

  List<DedicationX> dedications =[];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch All My Dedications
      await Future.delayed(const Duration(seconds: 1)); // delete this

      dedications=TestDataX.dedications;
    } catch (e) {
      return Future.error(e);
    }
  }

}