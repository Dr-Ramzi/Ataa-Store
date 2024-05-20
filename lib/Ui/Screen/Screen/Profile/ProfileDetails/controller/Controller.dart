import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';

class ProfileDetailsController extends GetxController {
 //============================================================================
 // Injection of required controls

  final AppControllerX app = Get.find();

 //============================================================================
 // Functions

  onEditProfile() => Get.toNamed(RouteNameX.editProfile);
  onStatistics() => Get.toNamed(RouteNameX.statistics);
  onActivity() => Get.toNamed(RouteNameX.activity);
  onNotifications() => Get.toNamed(RouteNameX.notifications);
  onContact() => Get.toNamed(RouteNameX.contactUs);
  onInfo() => Get.toNamed(RouteNameX.info);
  onOurBank() => Get.toNamed(RouteNameX.ourBank);
  onTermsConditions() => Get.toNamed(RouteNameX.termsConditions);
  onPrivacyPolicy() => Get.toNamed(RouteNameX.privacyPolicy);
  onSettings() => Get.toNamed(RouteNameX.settings);

}
