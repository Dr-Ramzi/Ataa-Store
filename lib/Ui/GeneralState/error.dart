import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Config/config.dart';
import '../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this screen }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// A general component for dealing with errors
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class ErrorView extends StatelessWidget {
  const ErrorView({required this.error, super.key});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Message Card
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 30,
              ),
              width: double.maxFinite,
              child: Column(
                children: [
                  const Icon(
                    Icons.report_gmailerrorred_rounded,
                    color: ColorX.danger,
                    size: 110.0,
                  ),
                  const SizedBox(height: 20),
                  TextX(
                    error.isNotEmpty ? error : 'Something is wrong',
                    color: ColorX.danger,
                    maxLines: 10,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            /// Action Button
            ButtonX(
              onTap: () => Get.offAllNamed(RouteNameX.root),
              text: "Back to Home",
            )
          ],
        ),
      ),
    );
  }
}
