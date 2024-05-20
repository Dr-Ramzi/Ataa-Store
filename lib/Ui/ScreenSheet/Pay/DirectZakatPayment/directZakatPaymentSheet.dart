import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Config/config.dart';
import '../../../../Core/Controller/Pay/directZakatPaymentController.dart';
import '../../../../Core/core.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Paying Zakat directly, follow the Zakat main page
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

directZakatPaymentSheetX() {
  //============================================================================
  // Injection of required controls

  final DirectZakatPaymentControllerX controller = Get.find();

  //============================================================================
  // Content

  return bottomSheetX(
    title: "Pay your calculated zakat with ease",
    child: Obx(
      () {
        /// Mandatory login
        if (!controller.app.isLogin.value) {
          return Column(
            children: [
              const TextX(
                "Log in to pay zakat",
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
                /// Label of Zakat amount
                const LabelInputX(
                  "The Amount",
                  marginTop: 0,
                ).fadeAnimation300,

                /// Input Zakat amount
                Form(
                  key: controller.formKey,
                  autovalidateMode: controller.autoValidate,
                  child: TextFieldX(
                    controller: controller.money,
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
                const SizedBox(height: 10),

                /// Buttons
                Row(
                  children: [
                    Flexible(
                      child: ButtonStateX(
                        state: controller.buttonState.value,
                        onTap: controller.onDirectZakatPayment,
                        text: "Pay Zakat Now",
                        iconData: Icons.payments_rounded,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: ButtonX.second(
                        onTap: controller.onCancel,
                        text: "Cancel",
                      ),
                    ),
                  ],
                ).fadeAnimation400
              ],
            ),
          );
        }
      },
    ),
  );
}
