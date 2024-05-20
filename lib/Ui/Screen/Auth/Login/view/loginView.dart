import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Animation/animation.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/mainContent.dart';

class LoginView extends GetView<LoginController> {
  LoginView({bool isSheet = false, super.key}) {
    /// if open this screen from bottom sheet as in share section
    if (isSheet) {
      Get.put(LoginController());
      controller.isSheet = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    if (controller.isSheet) {
      return const MainContentLoginX();
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
                const MainContentLoginX()
              ],
            ),
          ),
        ),
      );
    }
  }
}
