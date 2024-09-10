import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../Config/config.dart';
import '../../../../ScreenSheet/Other/Language/languageSheet.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Settings'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp,
          vertical: StyleX.vPaddingApp,
        ),
        child: Column(
          children: [
            /// Card
            OptionsGroupCardX(
              options: [
                /// Language
                OptionCardX(
                  title: 'Language',
                  icon: Iconsax.translate5,
                  onTap: () {
                    languageSheetX(controller.changeLanguage);
                  },
                ).fadeAnimation200,

                /// Theme
                OptionCardX(
                  title: 'Theme',
                  icon: Iconsax.moon5,
                  onTap: controller.changeTheme,
                  isBottomLine: false,
                  child: Obx(
                    () => SwitchX(
                      value: controller.themeIsDark.value,
                      onChange: (_) => controller.changeTheme(),
                    ),
                  ),
                ).fadeAnimation300,
              ],
            ).fadeAnimation100,
          ],
        ),
      ),
    );
  }
}
