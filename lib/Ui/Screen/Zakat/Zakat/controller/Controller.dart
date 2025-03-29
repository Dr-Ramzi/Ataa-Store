import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../ScreenSheet/Pay/DirectZakatPayment/directZakatPaymentSheet.dart';

class ZakatController extends GetxController {
  //============================================================================
  // Functions

  onTapPayingZakat() => directZakatPaymentSheetX();
  onTapZakatCalculator() => Get.toNamed(RouteNameX.zakatCalculator);
  onTapZakatDisbursements() => Get.toNamed(RouteNameX.zakatDisbursements);
}
