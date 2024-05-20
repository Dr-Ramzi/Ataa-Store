import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../Config/config.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Screen/Auth/Login/view/loginView.dart';
import '../../../../Widget/widget.dart';
import '../../OTP/view/View.dart';

class SignUpController extends GetxController {
  //============================================================================
  // Variables
  
  RxBool isLoading = false.obs;
  bool isSheet = false;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  int countryCode = 966;
  RxBool agreedTerms = true.obs;

  //============================================================================
  // Functions
  
  onChangeAgreedTerms(val) => agreedTerms.value = val;

  onChangePhone(val) => countryCode = int.parse(val);

  onLogin() {
    if (isLoading.isFalse) {
      if (isSheet) {
        Get.back();
        bottomSheetX(child: LoginView(isSheet: true));
      } else if (Get.previousRoute == RouteNameX.login) {
        Get.back();
      } else {
        Get.toNamed(RouteNameX.login);
      }
    }
  }

  onGuest() {
    if (isLoading.isFalse) {
      LocalDataX.put(LocalKeyX.route, RouteNameX.root);
      Get.offAllNamed(RouteNameX.root);
    }
  }

  Future<void> onSignUp() async {
    if (isLoading.isFalse) {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        buttonState.value = ButtonStateEX.loading;
        try {
          /// Connect to the database to create the account
          await DatabaseX.signUp(
            name: name.text.trim(),
            phone: int.parse(phone.text),
            countryCode: countryCode,
          );

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// create otp object
          OtpX otp = OtpX(
            phone: phone.text,
            countryCode: countryCode,
            isLogin: false,
            isPhone: true,
          );

          /// go to otp screen
          if (isSheet) {
            Get.back(); // close sign up sheet
            bottomSheetX(child: OTPView(isSheet: true, otp: otp));
          } else {
            Get.toNamed(RouteNameX.otp, arguments: otp);
          }
        } catch (error) {
          ToastX.error(message: error.toString());
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
}
