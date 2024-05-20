import 'package:get/get.dart';
import '../../../../../../../Data/data.dart';

class MyGuaranteesController extends GetxController {
  //============================================================================
  // Variables

  List<GuaranteeX> guarantees =[];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >> Fetch All my Guarantees
      await Future.delayed(const Duration(seconds: 1)); // delete this

      guarantees=TestDataX.guarantees;
    } catch (e) {
      return Future.error(e);
    }
  }
}