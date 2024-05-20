import 'package:flutter/material.dart';
import '../../../../../Widget/widget.dart';

class LoadingSectionX extends StatelessWidget {
  const LoadingSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LogoX(),
        SizedBox(height: 70, width: double.maxFinite),
        CircularProgressIndicator(),
      ],
    );
  }
}
