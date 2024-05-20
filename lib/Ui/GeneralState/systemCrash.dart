import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Config/config.dart';
import '../Animation/animation.dart';
import '../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this screen }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// A general element for dealing with cases of unexpected and unaddressed errors
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class SystemCrashView extends StatelessWidget {
  const SystemCrashView({required this.error, super.key});
  final FlutterErrorDetails error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          /// Error Title
          TextX(
            kDebugMode
                ? error.summary.toString()
                : 'Oups! Something went wrong!',
            textAlign: TextAlign.center,
            color: kDebugMode ? ColorX.danger : null,
            style: TextStyleX.titleLarge,
          ).fadeAnimation200,
          const SizedBox(height: 12),
          if (kDebugMode)
            /// Error Message
            const TextX(
              "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
              textAlign: TextAlign.center,
            ).fadeAnimation300,
        ],
      ),
    );
  }
}
