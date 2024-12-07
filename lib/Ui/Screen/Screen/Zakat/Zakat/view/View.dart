import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class ZakatView extends GetView<ZakatController> {
  const ZakatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Zakat",
        actions: [CartIconButtonsX()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp,
          vertical: StyleX.vPaddingApp,
        ),

        /// Cards
        child: Column(
          children: [
            OptionWithIconCardX(
              title: "Zakat expenditures",
              subtitle:
              "Pay your zakat to projects for which zakat deductions apply",
              icon: Icons.verified,
              onTap: controller.onTapZakatDisbursements,
            ).fadeAnimation200,
            OptionWithIconCardX(
              title: "Zakat calculator",
              subtitle:"A smart tool to calculate Zakat on your money and property easily",
              icon: Iconsax.calculator5,
              onTap: controller.onTapZakatCalculator,
            ).fadeAnimation300,
            OptionWithIconCardX(
              title: "Paying zakat",
              subtitle: "Pay your Zakat with ease",
              icon: Icons.upgrade_rounded,
              onTap: controller.onTapPayingZakat,
            ).fadeAnimation400,
          ],
        ),
      ),
    );
  }
}
