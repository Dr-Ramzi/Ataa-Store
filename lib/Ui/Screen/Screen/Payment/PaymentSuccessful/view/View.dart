import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/assignPaymentTransaction.dart';
import 'Sections/details.dart';
import 'Sections/header.dart';
import 'Sections/rate.dart';

class PaymentSuccessfulView extends GetView<PaymentSuccessfulController> {
  const PaymentSuccessfulView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(
        title: 'Completion of the payment process',
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: StyleX.vPaddingApp,
                horizontal: StyleX.hPaddingApp,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: ContainerX(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        const HeaderSection(),
                        const AssignPaymentTransactionSection(),
                        if (controller
                                .paymentTransaction.paymentDataBankTransfer !=
                            null)
                          TextX(
                            'The bank transfer will be reviewed and you will be notified of the payment status',
                            textAlign: TextAlign.center,
                            style: TextStyleX.supTitleMedium,
                            size: 14,
                          ).fadeAnimation300.marginOnly(top: 12),
                        if (controller
                                .paymentTransaction.paymentDataBankTransfer ==
                            null)
                          const DetailsSection(),
                        Divider(color: context.isDarkMode?null:ColorX.grey.shade100).fadeAnimation400.marginSymmetric(vertical: 24),
                        const RateSection(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}