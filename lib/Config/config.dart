library config;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_actions/quick_actions.dart';
import '../Core/core.dart';
import '../Data/data.dart';
import '../Ui/Screen/Basic/Root/controller/Controller.dart';
import 'Translation/translation.dart';

part "Asset/icons.dart";
part 'Asset/image.dart';
part 'Route/routeName.dart';
part 'Theme/font.dart';
part 'Theme/color.dart';
part 'Theme/textStyle.dart';
part 'Theme/theme.dart';
part 'Theme/style.dart';
part 'Info/quickAction.dart';
part '../Data/Constant/onboarding.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Control the basic application configuration settings, including language,
/// theme, navigation, style, fixed files, etc.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class ConfigX {
  static init() async {
    /// Set the color of the phone's status bar
    ConfigAppHelperX.statusBarColor(Colors.transparent);

    /// Select application directions available
    ConfigAppHelperX.deviceOrientation(up: true, down: false);
  }
}
