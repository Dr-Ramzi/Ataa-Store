import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Config/Route/routeList.dart';
import 'Config/Translation/translation.dart';
import 'Config/config.dart';
import 'Core/core.dart';
import 'Data/data.dart';
import 'Ui/Screen/Basic/Root/controller/Controller.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// The project's starting point: everything is initialized here before the
/// project starts running.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpOverridesHelperX();

  /// Application sections initialization
  await ConfigX.init();
  await DataX.init();
  await CoreX.init();

  runApp(const MyApp());
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
        Get.lazyPut(
              () => RootController(),
          fenix: true,
        );
      }),

      /// Routes
      getPages: RouteListX.routes,
      initialRoute: LocalDataX.route,

      /// Settings GetX
      smartManagement: SmartManagement.full,
      useInheritedMediaQuery: true,

      /// App name with translate
      title: InfoX.nameApp.tr,

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