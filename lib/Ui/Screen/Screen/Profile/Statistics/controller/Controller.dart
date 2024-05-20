import 'package:get/get.dart';
import '../../../../../../Data/data.dart';

class StatisticsController extends GetxController {
  //============================================================================
  // Variables

  late StatisticsX statistics;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch statistics
      await Future.delayed(const Duration(seconds: 1)); // delete this

      statistics = TestDataX.statistics;
    } catch (e) {
      return Future.error(e);
    }
  }
}
