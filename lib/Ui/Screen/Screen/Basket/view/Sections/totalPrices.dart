import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../ScreenSheet/Other/DeliveryAddress/deliveryAddress.dart';
import '../../controller/Controller.dart';

class TotalPricesSectionX extends GetView<BasketController> {
  const TotalPricesSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    /// Card
    return ContainerX(
      isShadow: true,
      isBorder: true,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(StyleX.radiusMd),
      ),
      padding: const EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 16,
        top: 26,
      ),
      child: SafeArea(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// If there are products, the delivery price and the basket price will be shown. If there are no products, only the final total will be shown under. There is no need to display details.
              if (controller.orderProducts.isNotEmpty)
                Column(
                  children: [
                    /// Basket Summary
                    Row(
                      children: [
                        TextX("Basket Summary",
                            style: TextStyleX.supTitleLarge),
                        const Spacer(),
                        TextX(
                          "${FunctionX.formatLargeNumber(controller.basketSummary.value)} ${"SAR".tr}",
                          style: TextStyleX.supTitleLarge,
                        ),
                      ],
                    ).fadeAnimation500,

                    /// Dash Line
                    DashLineX(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                    ).fadeAnimation500,

                    /// Shipping charges
                    Row(
                      children: [
                        TextX("Shipping charges",
                            style: TextStyleX.supTitleLarge),
                        const Spacer(),
                        TextX(
                          "${FunctionX.formatLargeNumber(controller.shippingCharges.value)} ${"SAR".tr}",
                          style: TextStyleX.supTitleLarge,
                        ),
                      ],
                    ).fadeAnimation600,

                    ///  Dash Line
                    DashLineX(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                    ).fadeAnimation600,
                  ],
                ),

              /// Total Basket
              Row(
                children: [
                  TextX(
                    "Total Basket",
                    style: TextStyleX.titleSmall,
                    fontWeight: FontWeight.w700,
                  ),
                  const Spacer(),
                  TextX(
                    "${FunctionX.formatLargeNumber(controller.calculateTotalBasket())} ${"SAR".tr}",
                    style: TextStyleX.titleSmall,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ).fadeAnimation600,
              const SizedBox(height: 18),

              /// Delivery information button
              if (controller.orderProducts.isNotEmpty)
                ButtonX.second(
                  onTap: () => deliveryAddressSheetX(
                    controller: controller.deliveryAddressController,
                  ),
                  text: controller.deliveryAddressController.isHasData.value
                      ? "Edit delivery address"
                      : "Add delivery address",
                ).fadeAnimation700,

              /// Payment button
              if (controller.orderProducts.isEmpty ||
                  (controller.orderProducts.isNotEmpty &&
                      controller.deliveryAddressController.isHasData.value))
                ButtonStateX(
                  state: controller.buttonState.value,
                  onTap: controller.onPay,
                  text: "Complete Payment",
                  iconData: Icons.payments_rounded,
                ).fadeAnimation700
            ],
          ),
        ),
      ),
    ).fadeAnimation200;
  }
}
