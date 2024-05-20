import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../Animation/animation.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class MainContentSignUpX extends GetView<SignUpController> {
  const MainContentSignUpX({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isLoading.value,
        child: Column(
          children: [
            /// Title
            TextX(
              'Sign Up',
              style: TextStyleX.headerMedium,
              color: Theme.of(context).primaryColor,
            ).fadeAnimation200,
            const SizedBox(height: 10.0),

            /// Subtitle
            TextX(
              'Open your account in minutes from your place',
              color: Theme.of(context).colorScheme.secondary,
              textAlign: TextAlign.center,
            ).fadeAnimation200,
            const SizedBox(height: 40.0),

            /// Input Fields
            Form(
              key: controller.formKey,
              autovalidateMode: controller.autoValidate,
              child: Column(
                children: [
                  TextFieldX(
                    controller: controller.name,
                    label: "Name",
                    hint: 'your name',
                    validate: ValidateX.name,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ).fadeAnimation400,
                  const SizedBox(height: 10),
                  PhoneFieldX(
                    controller: controller.phone,
                    label: "Mobile Number",
                    onChange: controller.onChangePhone,
                    countryCode: controller.countryCode,
                  ).fadeAnimation400,
                ],
              ),
            ),

            /// Agree to the terms of use
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Obx(
                () => AgreeToPrivacyTermsX(
                  agreedTerms: controller.agreedTerms.value,
                  onChangeAgreedTerms: controller.onChangeAgreedTerms,
                ),
              ),
            ).fadeAnimation400,

            /// Buttons
            ButtonStateX(
              disabled: !controller.agreedTerms.value,
              onTap: controller.onSignUp,
              state: controller.buttonState.value,
              text: 'Next',
            ).fadeAnimation600,
            if (!controller.isSheet)
              const SizedBox(
                height: 5.0
              ),
            if (!controller.isSheet)
              ButtonX.second(
                onTap: controller.onGuest,
                text: 'Browse the platform as a visitor',
              ).fadeAnimation600,
            const SizedBox(height: 25.0),

            /// Text Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextX(
                  "Already have an account?",
                  color: Theme.of(context).colorScheme.secondary,
                  style: TextStyleX.titleSmall,
                ),
                InkWell(
                  onTap: controller.onLogin,
                  borderRadius: BorderRadius.circular(StyleX.radius),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 5,
                    ),
                    child: TextX(
                      "Login",
                      color: Theme.of(context).primaryColor,
                      style: TextStyleX.titleSmall,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ).fadeAnimation600,
          ],
        ),
      ),
    );
  }
}
