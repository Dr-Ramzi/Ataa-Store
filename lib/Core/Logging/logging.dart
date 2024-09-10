import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../Util/console/console.dart';
import '../Util/info.dart';
import '../Util/string.dart';
import '../Error/error.dart';

part 'lib/logging_console.dart';

class LoggingX {
  static init() {
    FlutterError.onError = LoggingConsoleX.log;
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      LoggingConsoleX.logger(error, stack);
      return true;
    };
    ErrorWidget.builder = CaptureScreenErrorX.builder;
  }

  static safeZone(Function() zone) {
    runZonedGuarded(
      zone,
      LoggingConsoleX.logger,
    );
  }
}
