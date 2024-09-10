part of '../../core.dart';

class AppControllerX extends GetxController {
  //============================================================================
  // Variables

  Rx<UserX?> user = Rx<UserX?>(null);

  late GeneralAppSettingsX generalSettings;
  RxBool isLogin = LocalDataX.token.isNotEmpty.obs;

  //============================================================================
  // Functions

  init() async {
    /// General Settings
    generalSettings = await DatabaseX.getGeneralSettings();

    /// Profile
    if (isLogin.value) {
      user.value = await DatabaseX.getProfile();
    }
    update();
  }

  onLoginSheet() {
    bottomSheetX(child: LoginView(isSheet: true));
  }

  logOut() async {
    try {
      isLogin.value = false;
      user.value=null;
      LocalDataX.remove(LocalKeyX.token);
      LocalDataX.put(LocalKeyX.route, RouteNameX.login);

      LocalDataX.remove(LocalKeyX.basketID);
      if (Get.isRegistered<BasketGeneralControllerX>()) {
        Get.find<BasketGeneralControllerX>().delete();
      } else {
        Get.put(BasketGeneralControllerX()).delete();
      }
      if (Get.currentRoute != RouteNameX.login) {
        await Future.microtask(() => Get.offAllNamed(RouteNameX.login));
      }
      await DatabaseX.logout();
    } catch (_) {}
  }
}
