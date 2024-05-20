import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../GeneralState/error.dart';
import '../controller/Controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Privacy Policy'),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            /// Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: StyleX.hPaddingApp,
                  vertical: StyleX.vPaddingApp,
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < 20; i++)
                      const ShimmerAnimationX(
                        height: 34,
                        margin: EdgeInsets.only(bottom: 10),
                      )
                  ],
                ),
              );
            }
        
            /// Error State
            if (snapshot.hasError) {
              return ErrorView(
                error: snapshot.error.toString(),
              );
            }
        
            /// Main Content
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleX.hPaddingApp,
                vertical: StyleX.vPaddingApp,
              ),
              child: TextX(controller.privacyPolicy).fadeAnimation200,
            );
          },
        ),
      ),
    );
  }
}
