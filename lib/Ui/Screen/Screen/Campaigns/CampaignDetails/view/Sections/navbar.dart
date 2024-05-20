import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class NavBarSectionX extends GetView<CampaignDetailsController> {
  const NavBarSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    /// Nav Bar Position
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,

      /// Card
      child: ContainerX(
        isShadow: true,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(StyleX.radiusMd),
        ),
        padding: EdgeInsets.only(
          left: StyleX.hPaddingApp,
          right: StyleX.hPaddingApp,
          top: 20,
          bottom: 20+MediaQuery.of(context).padding.bottom
        ),

        /// Button
        child: Obx(
          () => AddToCartAndDonationButtonsX(
            onDonation: controller.onPayDonation,
            onAddToCart: controller.onDonationAddToCart,
            payDonationButtonState: controller.payDonationButtonState.value,
            addToCartButtonState: controller.addToCartButtonState.value,
          ).fadeAnimation600,
        ),
      ),
    );
  }
}
