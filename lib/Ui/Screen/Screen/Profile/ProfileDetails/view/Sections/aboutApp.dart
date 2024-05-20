import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class AboutAppSectionX extends GetView<ProfileDetailsController> {
  const AboutAppSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return OptionsGroupCardX(
      title: "About App",
      options: [
        OptionCardX(
          title: 'Settings',
          icon: Icons.settings_rounded,
          onTap: controller.onSettings,
        ).fadeAnimation400,
        OptionCardX(
          title: 'Contact us',
          icon: Icons.call,
          onTap: controller.onContact,
        ).fadeAnimation400,
        OptionCardX(
          title: 'Info Ataa',
          icon: Icons.info_rounded,
          onTap: controller.onInfo,
        ).fadeAnimation400,
        OptionCardX(
          title: 'Our Bank Accounts',
          icon: Icons.account_balance_rounded,
          onTap: controller.onOurBank,
        ).fadeAnimation400,
        OptionCardX(
          title: 'Terms and Conditions',
          icon: Icons.description_rounded,
          onTap: controller.onTermsConditions,
        ).fadeAnimation400,
        OptionCardX(
          title: 'Privacy Policy',
          icon: Icons.verified_user_rounded,
          onTap: controller.onPrivacyPolicy,
          isBottomLine: false,
        ).fadeAnimation400,
      ],
    );
  }
}
