part of '../../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Default data if no stored data is available
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class LocalDefaultDataX{
  static String route=RouteNameX.onboarding;
  static String token='';
  static String cartId = '';
  static bool cartIdIsAssign = false;
  static String userID='';
  static int unreadNotifications=0;
  static List<Map<String,dynamic>> allNotifications=[];
  static SettingsX settings= SettingsX(
    language: Get.deviceLocale?.languageCode ?? TranslationX.fallbackLocale.languageCode,
    themeIsDark: Get.isPlatformDarkMode,
  );
}
