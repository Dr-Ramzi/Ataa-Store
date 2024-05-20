import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class OthersSectionX extends GetView<ZakatCalculatorController> {
  const OthersSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ZakatCalculatorCardX(
        title: "Other property",
        isOpen: controller.isOther.value,
        onChangeOpen: controller.onOpenOther,
        child: Column(
          children: [
            const LabelInputX(
              "Enter the amount of other property",
              marginTop: 0,
            ),
            TextFieldX(
              /// To calculate the value of Zakat after changing the value
              onChanged: (_) => controller.calculateOther(),
              controller: controller.others,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              color: Theme.of(context).cardColor,
              validate: ValidateX.money,
              hint: "0",
              suffixWidget: TextX(
                "SAR",
                style: TextStyleX.titleSmall,
                color: Get.theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ).fadeAnimation400,
    );
  }
}
