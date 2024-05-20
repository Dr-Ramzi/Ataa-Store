import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class GoldSectionX extends GetView<ZakatCalculatorController> {
  const GoldSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      /// Fetch the price of gold to calculate the value of zakat
      future: controller.getGold(),
      builder: (context, snapshot) {
        /// Loading State
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ZakatCalculatorCardX(
            title: "Zakat on gold",
            isOpen: controller.isGold.value,
            onChangeOpen: controller.onOpenGold,
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
            title: "Zakat on gold",
            isOpen: controller.isGold.value,
            onChangeOpen: controller.onOpenGold,
            child: Column(
              children: [
                /// Duplicate the item in grams because the carat may be empty when it is first created
                for (int index = 0;
                    index < controller.goldGrams.length;
                    index++)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Carat Input
                          Flexible(
                            child: Column(
                              children: [
                                const LabelInputX("Caliber"),
                                DropdownX<dynamic>(
                                  color: Theme.of(context).cardColor,
                                  value: controller.getGoldCaratValue(index),
                                  list: controller.getGoldCaratsList(),
                                  onChanged: (val) => controller
                                      .onChangeGoldCarat(val.toString(), index),
                                  hint: "-- Choose --",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),

                          /// Gram Input
                          Flexible(
                            child: Column(
                              children: [
                                const LabelInputX("Weight in grams"),
                                TextFieldX(
                                  /// To calculate the value of Zakat after changing the value
                                  onChanged: (_) => controller.calculateGold(),
                                  controller: controller.goldGrams[index],
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
                          const SizedBox(width: 2),

                          /// Remove row of gold zakat
                          InkWell(
                            onTap: () => controller.onRemoveZakatGoldRow(index),
                            child: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: Theme.of(context).colorScheme.error,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 30,
                      )
                    ],
                  ).fadeAnimation200,

                /// Add new row of gold zakat
                InkWell(
                  onTap: controller.onAddZakatGoldRow,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      TextX(
                        "Add another caliber",
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
