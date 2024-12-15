part of '../../core.dart';

class AppControllerX extends GetxController {
  //============================================================================
  // Variables

  Rx<UserX?> user = Rx<UserX?>(null);

  late GeneralAppSettingsX generalSettings;
  late HomeElementSettingsX homeElementSettings;
  RxBool isLogin = LocalDataX.token.isNotEmpty.obs;

  //============================================================================
  // Functions

  init() async {
    /// General Settings
    generalSettings = await DatabaseX.getGeneralSettings();
    homeElementSettings = await DatabaseX.getHomeElementSettings();

    /// Profile
    if (isLogin.value) {
      user.value = await DatabaseX.getProfile();
    }
    update();
  }

  onLoginSheet() async {
    await bottomSheetX(child: LoginView(isSheet: true).paddingOnly(top: 14));
  }

  onSignUpSheet() async {
    await bottomSheetX(child: SignUpView(isSheet: true).paddingOnly(top: 14));
  }

  logOut() async {
    try {
      isLogin.value = false;
      user.value = null;
      LocalDataX.remove(LocalKeyX.token);
      LocalDataX.put(LocalKeyX.route, RouteNameX.login);
      Get.find<CartGeneralControllerX>().delete();
      Get.delete<AllDonationController>();
      Get.lazyPut(() => AllDonationController());
      if (Get.currentRoute != RouteNameX.login) {
        await Future.wait([
          DatabaseX.logout(),
          Future.microtask(() => Get.offAllNamed(RouteNameX.login)),
        ]);
      } else {
        await DatabaseX.logout();
      }
    } catch (_) {}
  }
}
