import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class SilverSectionX extends GetView<ZakatCalculatorController> {
  const SilverSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      /// Bring the price of silver to calculate the value of zakat
      future: controller.getSilver(),
      builder: (context, snapshot) {
        /// Loading State
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ZakatCalculatorCardX(
            title: "Zakat on silver",
            isOpen: controller.isSilver.value,
            onChangeOpen: controller.onOpenSilver,
            child: const Center(child: CircularProgressIndicator()),
          ).fadeAnimation300;
        }

        /// Error State, Hide this section if it fails
        if (snapshot.hasError) {
          return const SizedBox();
        }

        /// Main Content
        return Obx(
          () => ZakatCalculatorCardX(
            title: "Zakat on silver",
            isOpen: controller.isSilver.value,
            onChangeOpen: controller.onOpenSilver,
            child: Column(
              children: [
                const LabelInputX("Enter the total weight", marginTop: 0),
                TextFieldX(
                  /// To calculate the value of Zakat after changing the value
                  onChanged: (_) => controller.calculateSilver(),
                  controller: controller.silver,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  color: Theme.of(context).cardColor,
                  validate: ValidateX.gram,
                  hint: "0",
                  suffixWidget: TextX(
                    "gram",
                    style: TextStyleX.titleSmall,
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
