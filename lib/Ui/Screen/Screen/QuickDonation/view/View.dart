import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Section/AppleAndGooglePay/view/View.dart';
import '../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class QuickDonationView extends StatelessWidget {
  const QuickDonationView({required this.controller, super.key});
  final QuickDonationController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: StyleX.bottomSheetPadding),
      child: FutureBuilderX(
        future: controller.init,
        loading: const SizedBox(height: 250,child: CircularProgressIndicator(),),
        child: (_) => Obx(() => AbsorbPointer(
              absorbing: controller.isLoading.value || controller.appleAndGooglePayController.isLoading.value,
              child: Stack(
                children: [
                  Column(
                    children: [
                      /// Choose Donation Project
                      MultipleSelectionCardX(
                        title: "Select a donation project",
                        // title: "Select a donation project (optional)",
                        onTap: controller.onTapChooseDonationProject,
                        selected: controller.donationProjectSelectedController
                            .orgSelected.value?.name,
                      ).fadeAnimation200,

                      /// Free Donation Options [ 20 , 50 , 100 ] SAR
                      FreeDonationOptionsX(
                        onSelected: controller.onChangeDonationAmount,
                        selected: controller.freeDonationSelected.value,
                      ).fadeAnimation200,

                      /// Input Donation Amount
                      Form(
                        key: controller.formKey,
                        autovalidateMode: controller.autoValidate,
                        child: TextFieldX(
                          controller: controller.donationAmount,
                          onChanged: controller.removeFreeDonationSelected,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          hint: "0",
                          validate: controller.validateAmount,
                          suffixWidget: TextX(
                            "SAR",
                            style: TextStyleX.titleSmall,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ).fadeAnimation300,
                      ).marginOnly(top: 6),

                      /// Pay with Apple & Google
                      AppleAndGooglePaySectionX(
                        controller: controller.appleAndGooglePayController,
                      ).fadeAnimation400,

                      const SizedBox(height: 5),

                      /// Pay with App
                      ButtonStateX(
                        onTap: controller.onDonatingByApp,
                        state: controller.buttonState.value,
                        iconData: Icons.payments_rounded,
                        text: 'Payment by payment card or bank transfer',
                      ).fadeAnimation500,
                    ],
                  ),
                  if(controller.appleAndGooglePayController.isLoading.value)
                    const Positioned.fill(
                      child: BlurX(
                        blur: 2,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
