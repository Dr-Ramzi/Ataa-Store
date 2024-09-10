import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class MyGiftingController extends GetxController {
  //============================================================================
  // Variables

  List<GiftingX> gifting =[];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch All My Gifting
      await Future.delayed(const Duration(seconds: 1)); // delete this

      gifting=TestDataX.gifting;
    } catch (e) {
      return Future.error(e);
    }
  }

}