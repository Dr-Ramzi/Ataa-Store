part of '../../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Default data if no stored data is available
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class LocalDefaultDataX{
  static String route=RouteNameX.onboarding;
  static String token='';
  static String cartId = '';
  static bool cartIdIsAssign = false;
  static SettingsX settings= SettingsX(
    language: Get.deviceLocale?.languageCode ?? TranslationX.fallbackLocale.languageCode,
    themeIsDark: Get.isPlatformDarkMode,
  );
}
