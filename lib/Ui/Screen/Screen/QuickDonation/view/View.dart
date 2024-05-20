import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';
import '../../../../ScreenSheet/PartOfSheet/DonateOnBehalfOfFamily/donateOnBehalfOfFamily.dart';
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
              /// Choose Donation Program
              MultipleSelectionCardX(
                title: "Choose donation program",
                onTap: controller.onTapChooseDonationProgram,
                selected: controller
                    .donationProgramSelectedController.orgSelected.value,
              ).fadeAnimation200,

              /// Free Donation Options [ 20 , 50 , 100 ] SAR
              FreeDonationOptionsX(
                onSelected: controller.onChangeDonationAmount,
              ).fadeAnimation200,

              /// Input Donation Amount
              Form(
                key: controller.formKey,
                autovalidateMode: controller.autoValidate,
                child: TextFieldX(
                  controller: controller.donationAmount,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  hint: "0",
                  validate: ValidateX.money,
                  suffixWidget: TextX(
                    "SAR",
                    style: TextStyleX.titleSmall,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ).fadeAnimation300,
              ),

              /// View the donation section for family and friends
              DonateOnBehalfOfFamilyPartOfSheetX(
                controller: controller.donateOnBehalfOfFamily,
              ).fadeAnimation400,

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
                text: 'Donate Now',
              ).fadeAnimation500,
            ],
          ),
        ),
      ),
    );
  }
}
