import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Data/data.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/mainContent.dart';

class OTPView extends GetView<OTPController> {
  OTPView({bool isSheet = false, OtpX? otp, super.key}) {
    /// if open this screen from bottom sheet as in share section
    if (isSheet) {
      Get.put(OTPController());
      controller.isSheet = true;
      if (otp != null) {
        controller.otp = otp;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller.isSheet) {
      return const MainContentOtpX();
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 80.0,
              bottom: 50.0,
              left: StyleX.hPaddingApp,
              right: StyleX.hPaddingApp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoX().fadeAnimation200,
                const SizedBox(height: 50.0),
                const MainContentOtpX()
              ],
            ),
          ),
        ),
      );
    }
  }
}
