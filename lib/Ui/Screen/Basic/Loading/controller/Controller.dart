import 'package:ataa/Core/Controller/Cart/cartGeneralController.dart';
import 'package:get/get.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Core/core.dart';

class LoadingController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  CartGeneralControllerX cart = Get.find();

  //============================================================================
  // Functions

  Future<void> init() async {
    /// Configure the global controller when it is on the home page when the application opens so that it fetches user data
    await app.init();
    await cart.getData();
  }

  finish(){
    Get.offAllNamed(LocalDataX.route);
  }

}
