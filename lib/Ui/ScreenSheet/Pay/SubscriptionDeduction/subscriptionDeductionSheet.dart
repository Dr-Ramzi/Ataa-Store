import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Config/config.dart';
import '../../../../Core/Controller/Pay/subscriptionDeductionController.dart';
import '../../../../Core/core.dart';
import '../../../../Data/data.dart';
import '../../../Widget/widget.dart';
import '../../PartOfSheet/DonateOnBehalfOfFamily/donateOnBehalfOfFamily.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// View the deduction details and subscribe to it
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

subscriptionDeductionSheetX(DeductionX deduction) {
  //============================================================================
  // Injection of required controls

  final SubscriptionDeductionControllerX controller = Get.put(
    SubscriptionDeductionControllerX(),
    tag: deduction.id,
  );
  controller.init(deduction, isSheet: true);

  //============================================================================
  // Content

  return bottomSheetX(
    title: "Participation in deduction",
    child: Obx(
      () {
        /// Mandatory login
        if (!controller.app.isLogin.value) {
          return Column(
            children: [
              const TextX(
                "Log in to donate to the project",
                fontWeight: FontWeight.w600,
              ).fadeAnimation200,
              const SizedBox(height: 16),
              ButtonX(
                onTap: controller.app.onLoginSheet,
                text: "Login",
              ).fadeAnimation300,
            ],
          );
        } else {
          /// Main Content
          return AbsorbPointer(
            absorbing: controller.isLoading.value,
            child: Column(
              children: [
                /// Display the fixed deduction value
                if (deduction.fixedDeductionAmount != null)
                  ContainerX(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: Get.theme.colorScheme.onSecondary,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        /// Title
                        TextX(
                          "Deduction amount",
                          color: Get.theme.primaryColor,
                        ),
                        const SizedBox(height: 6),

                        /// Fixed Deduction Amount
                        TextX(
                          "${controller.deduction.fixedDeductionAmount.toString()} ${"SAR".tr}",
                          style: TextStyleX.titleLarge,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ).fadeAnimation200,

                /// Enter the deduction amount manually
                if (deduction.fixedDeductionAmount == null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Free Deduction Options [ 20 , 50 , 100 ] SAR
                      FreeDonationOptionsX(
                        isMarginTop: false,
                        onSelected: controller.onChangeDeductionAmount,
                        selected: controller.freeDeductionSelected.value,
                      ).fadeAnimation300,

                      /// Field to enter the deduction value
                      Form(
                        key: controller.formKey,
                        autovalidateMode: controller.autoValidate,
                        child: TextFieldX(
                          controller: controller.deductionAmount,
                          onChanged: controller.removeFreeDonationSelected,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          hint: "0",
                          validate: ValidateX.money,
                          suffixWidget: TextX(
                            "SAR",
                            style: TextStyleX.titleSmall,
                            color: Get.theme.colorScheme.secondary,
                          ),
                        ),
                      ).fadeAnimation300,

                      /// View the deduction section for family and friends
                      DonateOnBehalfOfFamilyPartOfSheetX(
                        controller: controller.donateOnBehalfOfFamily,
                      ),
                    ],
                  ),

                /// Alert message about deduction
                ContainerX(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Get.theme.colorScheme.onPrimary,
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_rounded,
                        color: ColorX.primary.shade800,
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: TextX(
                          "The amount will be automatically deducted on the first day of every calendar month.",
                          color: ColorX.primary.shade800,
                          style: TextStyleX.titleSmall,
                          fontWeight: FontWeight.w600,
                          maxLines: 5,
                        ),
                      )
                    ],
                  ),
                ).fadeAnimation400,

                /// Subscription Button
                ButtonStateX(
                  state: controller.buttonState.value,
                  onTap: controller.onDeduction,
                  text: "Subscribe Now",
                  iconData: Icons.payments_rounded,
                ).fadeAnimation500
              ],
            ),
          );
        }
      },
    ),
  );
}
