import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class ColorsBarSectionX extends GetView<DedicationsController> {
  const ColorsBarSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        TextX(
          "Choose the card color",
          style: TextStyleX.titleLarge,
        ).paddingSymmetric(horizontal: StyleX.hPaddingApp).fadeAnimation400,
        const SizedBox(height: 8),

        /// Colors Options
        Obx(
          () => ColorBarSelectorX(
            colors: controller.colors,
            colorSelectedIndex: controller.colorSelectedIndex.value,
            onChangeColor: controller.onChangeColor,
          ),
        ).fadeAnimation400,
        const SizedBox(height: 20),
      ],
    );
  }
}
