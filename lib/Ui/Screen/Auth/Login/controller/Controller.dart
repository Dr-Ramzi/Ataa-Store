import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Data/data.dart';
import '../../../../Widget/widget.dart';
import '../../OTP/view/View.dart';
import '../../SignUp/view/View.dart';

class LoginController extends GetxController {
  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  bool isSheet = false;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  RxBool isPhone = true.obs;
  int countryCode = 966;
  final loginVia = ValueNotifier(1);

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  //============================================================================
  // Functions

  onChangeCountryCode(String code) => countryCode = int.parse(code);

  onSignUp() {
    if (isLoading.isFalse) {
      if (isSheet) {
        Get.back();

        /// to close login sheet
        bottomSheetX(child: SignUpView(isSheet: true));
      } else if (Get.previousRoute == RouteNameX.signUp) {
        Get.back();

        /// if sign up is open on background so just back to show it
      } else {
        Get.toNamed(RouteNameX.signUp);
      }
    }
  }

  onGuest() {
    if (isLoading.isFalse) {
      LocalDataX.put(LocalKeyX.route, RouteNameX.root);
      Get.offAllNamed(RouteNameX.root);
    }
  }

  Future<void> onLogin() async {
    if (isLoading.isFalse) {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        buttonState.value = ButtonStateEX.loading;
        var massage = '';
        try {
          if (isPhone.value) {
            massage = await loginByPhone();
          } else {
            massage = await loginByEmail();
          }
          ToastX.success(message: massage);
        } catch (error) {
          ToastX.error(message: error);
          buttonState.value = ButtonStateEX.failed;
        }
        isLoading.value = false;

        /// Reset the button state
        Timer(
          const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
          () {
            buttonState.value = ButtonStateEX.normal;
          },
        );
      } else {
        autoValidate = AutovalidateMode.always;
      }
    }
  }

  Future<String> loginByPhone() async {
    String massage = await DatabaseX.loginByPhone(
        phone: int.parse(phone.text), countryCode: countryCode);

    /// The time delay here is aesthetically beneficial
    buttonState.value = ButtonStateEX.success;
    await Future.delayed(
      const Duration(seconds: StyleX.successButtonSecond),
    );

    /// create otp object
    OtpX otp = OtpX(
      phone: phone.text,
      countryCode: countryCode,
      isLogin: true,
      isPhone: true,
    );

    /// go to otp screen
    if (isSheet) {
      Get.back();
      bottomSheetX(child: OTPView(isSheet: true, otp: otp));
    } else {
      Get.toNamed(RouteNameX.otp, arguments: otp);
    }
    return massage;
  }

  Future<String> loginByEmail() async {
    String massage = await DatabaseX.loginByEmail(email: email.text.trim());

    /// The time delay here is aesthetically beneficial
    buttonState.value = ButtonStateEX.success;
    await Future.delayed(
      const Duration(seconds: StyleX.successButtonSecond),
    );

    Get.toNamed(
      RouteNameX.otp,
      arguments: OtpX(
        email: email.text.trim(),
        isLogin: true,
        isPhone: false,
      ),
    );
    return massage;
  }

  //============================================================================
  // Initialization

  @override
  void onInit() {
    super.onInit();


    /// listener if change tap for login by phone or email
    loginVia.addListener(() {
      isPhone.value = loginVia.value == 1;
    });
  }
}
