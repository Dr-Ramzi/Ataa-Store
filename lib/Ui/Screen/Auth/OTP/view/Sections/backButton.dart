import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Animation/animation.dart';

class BackButtonSectionX extends StatelessWidget {
  const BackButtonSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Get.back(),
          borderRadius: BorderRadius.circular(StyleX.radius),
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: context.isDarkMode?Colors.white10:ColorX.grey.shade50,
              borderRadius: BorderRadius.circular(StyleX.radius),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_rounded,
              ),
            ),
          ),
        ),
      ],
    ).fadeAnimation100;
  }
}
