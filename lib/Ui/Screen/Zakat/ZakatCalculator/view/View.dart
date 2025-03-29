import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/cashMoney.dart';
import 'Sections/gold.dart';
import 'Sections/navBar.dart';
import 'Sections/others.dart';
import 'Sections/shares.dart';
import 'Sections/silver.dart';

class ZakatCalculatorView extends GetView<ZakatCalculatorController> {
  const ZakatCalculatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        /// for don't move navbar when open keyboard
        resizeToAvoidBottomInset: controller.isFocusAdditionalAmount.value,
        appBar: AppBarX(
          title: "Zakat Calculator",
          actions: [CartIconButtonsX()],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: StyleX.hPaddingApp,
                      vertical: StyleX.vPaddingApp,
                    ),

                    /// To lock data modification during payment
                    child: AbsorbPointer(
                      absorbing: controller.isPayOrCartLoading.value,

                      /// To verify all text inputs
                      child: Column(
                        children: [
                          /// Title
                          TextX(
                            "Choose the type of zakat you want to calculate",
                            color: Theme.of(context).primaryColor,
                            style: TextStyleX.titleLarge,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ).fadeAnimation200,
                          const SizedBox(height: 12),

                          /// Zakat on cash
                          const CashMoneySectionX(),

                          /// Zakat on gold
                          const GoldSectionX(),

                          /// Zakat on silver
                          const SilverSectionX(),

                          /// Zakat on shares
                          const SharesSectionX(),

                          /// Zakat on Others
                          const OthersSectionX(),

                          if(controller.isHasZakat())
                            const SizedBox(height: 325)
                        ],
                      ),
                    ),
                ),
              ),

              /// Nav bar to pay zakat
              const Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: NavBarSectionX(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
