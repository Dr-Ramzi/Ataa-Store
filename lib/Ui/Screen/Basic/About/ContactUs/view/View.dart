import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Contact us'),
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          /// Lading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleX.hPaddingApp,
                vertical: StyleX.vPaddingApp,
              ),
              child: Column(
                children: [
                  for (int i = 0; i < 3; i++)
                    const ShimmerAnimationX(
                      height: 65,
                      margin: EdgeInsets.only(bottom: 10),
                    )
                ],
              ),
            );
          }

          /// Error State
          if (snapshot.hasError) {
            return ErrorView(
              error: snapshot.error,
            );
          }

          /// Main Content
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: StyleX.hPaddingApp,
              vertical: StyleX.vPaddingApp,
            ),
            child: Column(
              children: [
                ContactCardX(
                  icon: Icons.call_rounded,
                  text: controller.contactUs.phone,
                ).fadeAnimation200,
                ContactCardX(
                  icon: Icons.email_rounded,
                  text: controller.contactUs.email,
                ).fadeAnimation300,
                ContactCardX(
                  icon: Icons.language_rounded,
                  text: controller.contactUs.web,
                ).fadeAnimation400,
              ],
            ),
          );
        },
      ),
    );
  }
}
