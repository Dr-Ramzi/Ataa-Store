import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';
import '../../../../../UI/Widget/widget.dart';
import '../controller/Controller.dart';

class CompleteAccountDataView extends GetView<CompleteAccountDataController> {
  const CompleteAccountDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 80.0,
            bottom: 50.0,
            left: StyleX.hPaddingApp,
            right: StyleX.hPaddingApp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Logo
              const LogoX().fadeAnimation200,
              const SizedBox(height: 50.0),

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

              /// Email Field
              Form(
                key: controller.formKey,
                autovalidateMode: controller.autoValidate,
                child: TextFieldX(
                  controller: controller.email,
                  label: "Email",
                  hint: "name@example.com",
                  validate: ValidateX.email,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
              ).fadeAnimation400,
              const SizedBox(height: 10),

              /// Gender
              const LabelInputX("Gender").fadeAnimation400,
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
        ),
      ),
    );
  }
}
