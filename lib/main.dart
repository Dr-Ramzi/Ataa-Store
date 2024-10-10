import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Config/Route/routeList.dart';
import 'Config/Translation/translation.dart';
import 'Config/config.dart';
import 'Core/Controller/Cart/cartGeneralController.dart';
import 'Core/Logging/logging.dart';
import 'Core/core.dart';
import 'Data/data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// The project's starting point: everything is initialized here before the
/// project starts running.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void main() async {
  await LoggingX.safeZone(() async {
    // Ensures that the Flutter framework is properly initialized
    WidgetsFlutterBinding.ensureInitialized();

    await LoggingX.init();
    await ConfigX.init();
    await DataX.init();
    await CoreX.init();

    // Start the Flutter application
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// Remove mark debug
      debugShowCheckedModeBanner: false,

      /// Initialization of the main controllers
      initialBinding: BindingsBuilder(() {
        Get.put<AppControllerX>(
          AppControllerX(),
          permanent: true,
        );
        Get.put<CartGeneralControllerX>(
          CartGeneralControllerX(),
          permanent: true,
        );
      }),

      /// Routes
      getPages: RouteListX.routes,
      initialRoute: RouteNameX.loading,

      /// Settings GetX
      smartManagement: SmartManagement.full,
      useInheritedMediaQuery: true,

      /// App name with translate
      title: 'Ataa'.tr,

      /// Translate App
      translations: TranslationX(),
      locale: TranslationX.getLocale,
      fallbackLocale: TranslationX.fallbackLocale,

      /// Themes
      themeMode: ThemeX.getTheme,
      theme: ThemeX.light,
      darkTheme: ThemeX.dark,
    );
  }
}
