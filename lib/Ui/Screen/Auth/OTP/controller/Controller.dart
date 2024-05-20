import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/data.dart';
import '../../../../ScreenSheet/Other/AccountCreated/accountCreatedSheet.dart';
import '../../../../Widget/widget.dart';

class OTPController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  bool isSheet = false;
  RxBool isLoading = false.obs;
  RxBool isResendAgain = false.obs;
  RxBool isLoadingResendAgain = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  /// if open OTP from sheet then get OTP object from view screen parameters
  OtpX otp = Get.arguments ?? OtpX.empty();

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController otpCode = TextEditingController();

  late Timer timer;
  RxInt start = 60.obs;

  //============================================================================
  // Functions

  /// Some titles have been duplicated if the title has changed in any case
  String getTitle() {
    if (otp.isLogin) {
      // is Login
      return "Confirm the operation";
    } else if (!otp.isLogin && !otp.isEdit) {
      // is Sign up
      return "Confirm mobile number";
    } else if (otp.isEdit) {
      // is Edit from profile
      return "Confirm the operation";
    }
    return "OTP";
  }

  /// Some labels have been repeated if the explanation of a case has changed
  String getSubTitle() {
    if (otp.isPhone && otp.isLogin) {
      // is login via phone
      return "Please enter the verification code sent to your mobile number";
    } else if (!otp.isPhone && otp.isLogin) {
      // is login via email
      return "Please enter the verification code sent to your email";
    } else if (!otp.isLogin && !otp.isEdit) {
      // is sign up via phone
      return "Please enter the verification code sent to your mobile number";
    } else if (otp.isPhone && otp.isEdit) {
      // is edit phone from profile
      return "Please enter the verification code sent to your mobile number";
    } else if (!otp.isPhone && otp.isEdit) {
      // is edit email from profile
      return "Please enter the verification code sent to your email";
    }
    return ""; // like default
  }

  onVerify() async {
    if (isLoading.isFalse) {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        buttonState.value = ButtonStateEX.loading;
        try {
          if (otp.isPhone) {
            app.user.value = await DatabaseX.otpByPhone(
                otp: int.parse(otpCode.text),
                phone: int.parse(otp.phone!),
                countryCode: otp.countryCode!);
          } else {
            app.user.value = await DatabaseX.otpByEmail(
                otp: int.parse(otpCode.text), email: otp.email!);
          }
          if (otp.isEdit) {
            /// The time delay here is aesthetically beneficial
            buttonState.value = ButtonStateEX.success;
            await Future.delayed(
              const Duration(seconds: StyleX.successButtonSecond),
            );

            Get.back(result: true);
          } else {
            /// save data on local
            LocalDataX.put(LocalKeyX.userID, app.user.value.id);
            LocalDataX.put(LocalKeyX.token, app.user.value.token);
            LocalDataX.put(LocalKeyX.route, RouteNameX.root);
            app.isLogin.value = true;

            /// The time delay here is aesthetically beneficial
            buttonState.value = ButtonStateEX.success;
            await Future.delayed(
              const Duration(seconds: StyleX.successButtonSecond),
            );

            if (isSheet) {
              Get.back();

              /// to close otp sheet
            } else {
              /// go to home
              Get.offAllNamed(RouteNameX.root);

              /// if sign up, show sheet to complete account data
              if (otp.email == null) {
                accountCreatedSheet();
              }
            }
          }
        } catch (e) {
          ToastX.error(message: e.toString());
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

  /// Resend the code and set a new timer
  void onResend() async {
    isLoadingResendAgain.value = true;
    try {
      String message = await sendCode();
      isResendAgain.value = false;
      startTimer();
      ToastX.success(message: message);
    } catch (e) {
      ToastX.error(message: e.toString());
    }
    isLoadingResendAgain.value = false;
  }

  /// use api from backend to send code otp
  sendCode() async {
    try {
      /// TODO: Back-end >>> Fix re-sending the code in case of creating an account
      if (otp.isPhone) {
        return await DatabaseX.loginByPhone(
            phone: int.parse(otp.phone!), countryCode: otp.countryCode!);
      } else {
        return await DatabaseX.loginByEmail(email: otp.email!);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  /// A timer to calculate the time remaining until the code can be re-sent
  startTimer() {
    if (!isResendAgain.value) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (start.value != 0) {
          start--;
        } else {
          start.value = 60;
          isResendAgain.value = true;
          timer.cancel();
        }
      });
    }
  }

  //============================================================================
  // Initialization

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
}
