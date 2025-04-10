import 'dart:async';
import 'package:flutter/material.dart';
import '../Util/console/console.dart';
import '../Util/info.dart';
import '../Util/string.dart';

part 'lib/logging_console.dart';

class LoggingX {
  static init() async{
    await ignoreException(NetworkImageLoadException);
    await ignoreException(ArgumentError);
    // FlutterError.onError = LoggingConsoleX.log;
    // PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    //   LoggingConsoleX.logger(error, stack);
    //   return true;
    // };
    // ErrorWidget.builder = CaptureScreenErrorX.builder;
  }
  static Future<void> ignoreException(Type exceptionType) async {
    final originalOnError = FlutterError.onError!;
    FlutterError.onError = (FlutterErrorDetails details) {
      final currentError = details.exception.runtimeType;
      if (currentError == exceptionType) {
        return;
      }
      originalOnError(details);
    };
  }
  static safeZone(Function() zone) {
    runZonedGuarded(
      zone,
      LoggingConsoleX.logger,
    );
  }
}
