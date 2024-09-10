import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class CompleteAccountDataView extends GetView<CompleteAccountDataController> {
  const CompleteAccountDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70.0,
            bottom: StyleX.vPaddingApp,
            left: StyleX.hPaddingApp,
            right: StyleX.hPaddingApp,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Logo
                  const LogoX().fadeAnimation200,
                  const SizedBox(height: 40.0),

                  /// Title
                  TextX(
                    'Complete account information',
                    style: TextStyleX.headerMedium,
                    color: Theme.of(context).primaryColor,
                    textAlign: TextAlign.center,
                  ).fadeAnimation200,
                  const SizedBox(height: 10.0),

                  /// Subtitle
                  TextX(
                    'Just a few steps away from completing your profile',
                    color: Theme.of(context).colorScheme.secondary,
                    textAlign: TextAlign.center,
                  ).fadeAnimation200,
                  const SizedBox(height: 25.0),

                  /// Error Message
                  Obx(
                    () {
                      if (controller.error.value!=null) {
                        return GestureDetector(
                          onTap: controller.onTapError,
                          child: MessageCardX(
                            message: controller.error.value?.message,
                            isError: true,
                          ),
                        ).marginOnly(bottom: 14).fadeAnimation200;
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),

                  /// Email Field
                  Form(
                    key: controller.formKey,
                    autovalidateMode: controller.autoValidate,
                    child: TextFieldX(
                      controller: controller.email,
                      label: "Email",
                      hint: "name@example.com",
                      validate: ValidateX.emailNoRequired,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                    ),
                  ).fadeAnimation400,
                  const SizedBox(height: 10),

                  /// Gender
                  const LabelInputX("Gender",isRequired: true).fadeAnimation400,
                  Obx(
                    () {
                      return Row(
                        children: [
                          Flexible(
                            child: RadioButtonX(
                              label: "Male",
                              groupValue: controller.gender.value,
                              value: "male",
                              onChanged: controller.onChangeGender,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: RadioButtonX(
                              label: "Female",
                              groupValue: controller.gender.value,
                              value: "female",
                              onChanged: controller.onChangeGender,
                            ),
                          ),
                        ],
                      ).fadeAnimation400;
                    },
                  ),
                  const SizedBox(height: 25),

                  /// Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => ButtonStateX(
                            onTap: controller.onSave,
                            state: controller.buttonState.value,
                            text: 'Save',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: ButtonX.second(
                          onTap: Get.back,
                          text: "Skip",
                        ),
                      ),
                    ],
                  ).fadeAnimation600,
                ],
              ),

              /// Sponsor Logo
              const SponsorLogoX().fadeAnimation700,
            ],
          ),
        ),
      ),
    );
  }
}
