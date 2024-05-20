import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class CashMoneySectionX extends GetView<ZakatCalculatorController> {
  const CashMoneySectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ZakatCalculatorCardX(
        title: "Zakat on cash money",
        isOpen: controller.isCashMoney.value,
        onChangeOpen: controller.onOpenCashMoney,
        child: Column(
          children: [
            const LabelInputX("The Amount", marginTop: 0),
            TextFieldX(
              /// To calculate the value of Zakat after changing the value
              onChanged: (_) => controller.calculateCashMoney(),
              controller: controller.caskMoney,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              validate: ValidateX.money,
              color: Theme.of(context).cardColor,
              hint: "0",
              suffixWidget: TextX(
                "SAR",
                style: TextStyleX.titleSmall,
                color: Get.theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ).fadeAnimation200,
    );
  }
}
