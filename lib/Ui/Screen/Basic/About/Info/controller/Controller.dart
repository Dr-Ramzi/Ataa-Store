import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../Config/config.dart';

class InfoController extends GetxController {
  //============================================================================
  // Functions

  onTerms()=>Get.toNamed(RouteNameX.termsConditions);
  onPrivacy()=>Get.toNamed(RouteNameX.privacyPolicy);
  onTapCreatedBy() async {
    try {
      await launchUrl(Uri.parse('https://www.linkedin.com/in/sakeraldakak'));
    } catch (_) {}
  }
}
