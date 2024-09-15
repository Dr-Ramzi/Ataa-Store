import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class QuickDonationView extends StatelessWidget {
  const QuickDonationView({required this.controller, super.key});
  final QuickDonationController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: StyleX.bottomSheetPadding),
      child: Obx(
        () => AbsorbPointer(
          absorbing: controller.isLoading.value,
          child: Column(
            children: [
              /// Choose Donation Project
              MultipleSelectionCardX(
                title: "Select a donation project (optional)",
                onTap: controller.onTapChooseDonationProject,
                selected: controller
                    .donationProjectSelectedController.orgSelected.value?.name,
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
              ).marginSymmetric(vertical: 6),

              /// Pay with Apple
              PaymentByAppleAndGoogleButtonX(
                isApple: true,
                onTap: controller.onDonatingByApple,
                state: controller.appleButtonState.value,
              ).fadeAnimation400,

              /// Pay with Google
              PaymentByAppleAndGoogleButtonX(
                isApple: false,
                onTap: controller.onDonatingByGoogle,
                state: controller.googleButtonState.value,
              ).fadeAnimation400,

              /// Pay with App
              ButtonStateX(
                onTap: controller.onDonatingByApp,
                state: controller.buttonState.value,
                iconData: Icons.payments_rounded,
                text: 'Payment by payment card or bank transfer',
              ).fadeAnimation500,
            ],
          ),
        ),
      ),
    );
  }
}
