import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
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
    return Scaffold(
      appBar: AppBarX(
        title: "Zakat Calculator",
        actions: [BasketIconButtonsX()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp,
          vertical: StyleX.vPaddingApp,
        ),
        child: Obx(
          /// To lock data modification during payment
          () => AbsorbPointer(
            absorbing: controller.isLoading.value,

            /// To verify all text inputs
            child: Form(
              key: controller.formKey,
              autovalidateMode: controller.autoValidate,
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

                  /// Zakat on cash money
                  const CashMoneySectionX(),

                  /// Zakat on gold
                  const GoldSectionX(),

                  /// Zakat on silver
                  const SilverSectionX(),

                  /// Zakat on shares
                  const SharesSectionX(),

                  /// Zakat on Others
                  const OthersSectionX(),
                ],
              ),
            ),
          ),
        ),
      ),

      /// Nav bar to pay zakat
      bottomNavigationBar: const NavBarSectionX(),
    );
  }
}
