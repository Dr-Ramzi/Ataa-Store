import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class NavBarSectionX extends GetView<ZakatCalculatorController> {
  const NavBarSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        /// If one of the Zakat sections is activated, the calculator is displayed
        if (controller.isHasZakat()) {
          return ContainerX(
            maxHeight: 250,
            isShadow: true,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(StyleX.radiusMd),
            ),
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 14,
              left: 30,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Total Money Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: TextX(
                          "Total Money",
                          style: TextStyleX.titleSmall,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    TextX(
                      "${FunctionX.formatLargeNumber(controller.totalMoney.value)} ${"SAR".tr}",
                      fontWeight: FontWeight.w500,
                      style: TextStyleX.titleLarge,
                    ),
                  ],
                ).fadeAnimationX(400, isFromEnd: true),
                const SizedBox(height: 12),

                /// Total amount of zakat
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Title
                    Flexible(
                      child: FittedBox(
                        child: TextX(
                          "Total amount of zakat",
                          style: TextStyleX.titleSmall,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),

                    /// The value of Zakat is displayed after the value of gold is brought
                    if (controller.isGetGoldPrice.value)
                      TextX(
                        "${FunctionX.formatLargeNumber(controller.totalZakat.value)} ${"SAR".tr}",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                        style: TextStyleX.titleLarge,
                      ),

                    /// The loading circle is displayed while fetching the gold price
                    if (!controller.isGetGoldPrice.value)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(2),
                        height: 29,
                        width: 29,
                        child: const CircularProgressIndicator(),
                      )
                  ],
                ).fadeAnimationX(400, isFromEnd: true),
                const SizedBox(height: 4),

                /// Additional amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// title
                    Flexible(
                      child: FittedBox(
                        child: Row(
                          children: [
                            TextX(
                              "Additional amount",
                              style: TextStyleX.titleSmall,
                              fontWeight: FontWeight.w600,
                            ),
                            TextX(
                              " (${"optional".tr})",
                              style: TextStyleX.supTitleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),

                    /// Additional amount Input
                    SizedBox(
                        width: 150,
                        child: Form(
                          key: controller.formKeyAdditionalAmount,
                          autovalidateMode: controller.autoValidate,
                          child: TextFieldX(
                            controller: controller.additionalAmount,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            hint: "0",
                            color: Theme.of(context).cardColor,
                            validate: ValidateX.moneyOptional,
                            onChanged: (_) =>
                                controller.calculateAdditionalAmount(),
                            suffixWidget: TextX(
                              "SAR",
                              style: TextStyleX.titleSmall,
                              color: Get.theme.colorScheme.secondary,
                            ),
                          ),
                        )),
                  ],
                ).fadeAnimationX(400, isFromEnd: true),

                /// line
                const Divider().fadeAnimationX(400, isFromEnd: true),
                const SizedBox(height: 6),

                /// Button of pay zakat
                ButtonStateX(
                  disabled: controller.totalZakat.value == 0,
                  state: controller.buttonState.value,
                  onTap: controller.onPayZakat,
                  text: "Pay Zakat Now",
                  iconData: Icons.payments_rounded,
                ).fadeAnimationX(400, isFromEnd: true),
              ],
            ),
          ).fadeAnimationX(300, isFromEnd: true);
        } else {
          /// If there are no activated zakat sections, the entire section is hidden
          return const SizedBox();
        }
      },
    );
  }
}
