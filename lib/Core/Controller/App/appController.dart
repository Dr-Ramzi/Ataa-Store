part of '../../core.dart';

class AppControllerX extends GetxController {
  //============================================================================
  // Variables

  Rx<UserX> user = UserX.empty().obs;
  RxBool isLogin=LocalDataX.token.isNotEmpty.obs;

  //============================================================================
  // Functions


  init() async {
    if (LocalDataX.token != '') {
      try {
        /// TODO: Delete >>> Static data when linking with database
        await Future.delayed(const Duration(seconds: 1)); // delete this
        user.value = UserX(
          id: '1',
          name: "Saker",
          phone: 504432349,
          countryCode: 966,
          email: "sakeraldakak@gmail.com",
          gender: 'male',
          token: LocalDataX.token,
          imageURL: "https://avatars.githubusercontent.com/u/131809848?v=4",
        );
        // user = await DatabaseX.getProfile();
        // update();
      } catch (_) {}
    }
  }
  onLoginSheet(){
    bottomSheetX(child: LoginView(isSheet: true));
  }

  logOut() async {
    try {
      LocalDataX.put(LocalKeyX.userID, '');
      LocalDataX.put(LocalKeyX.token, '');
      LocalDataX.put(LocalKeyX.route, RouteNameX.login);
      Get.offAllNamed(RouteNameX.login);
      isLogin.value=false;
      await DatabaseX.logout();
    } catch (e) {
      return Future.error(e);
    }
  }
}
