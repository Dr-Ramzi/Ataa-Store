import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Info'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Logo
                  const LogoX(height: 50.0)
                      .marginSymmetric(vertical: 40)
                      .fadeAnimation200,
        
                  /// App Name
                  TextX(
                    InfoX.nameApp,
                    color: Theme.of(context).primaryColor,
                    style: TextStyleX.headerSmall,
                  ).fadeAnimation200,
                  const SizedBox(
                    height: 20.0,
                  ),
        
                  /// Options
                  OptionsGroupCardX(
                    options: [
                      OptionCardX(
                        title: 'Terms and Conditions',
                        icon: Icons.description_rounded,
                        onTap: controller.onTerms,
                      ),
                      OptionCardX(
                        title: 'Privacy Policy',
                        icon: Icons.verified_user_rounded,
                        onTap: controller.onPrivacy,
                      ),
                      const OptionCardX(
                        title: 'Version',
                        icon: Icons.verified_rounded,
                        isBottomLine: false,
                        child: TextX(InfoX.version),
                      ),
                    ],
                  ).fadeAnimation400
                ],
              ),
        
              /// Created By
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InkWell(
                  onTap: controller.onTapCreatedBy,
                  borderRadius: BorderRadius.circular(StyleX.radius),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    child: TextX(
                      'Created by Saker Al Dakak',
                      style: TextStyleX.supTitleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ).fadeAnimation600,
            ],
          ),
        ),
      ),
    );
  }
}
