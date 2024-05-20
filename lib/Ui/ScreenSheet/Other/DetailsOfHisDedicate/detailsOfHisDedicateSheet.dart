import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Config/config.dart';
import '../../../../Core/Controller/Other/detailsOfHisDedicateController.dart';
import '../../../../Core/core.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Enter the data of the person to whom the gift is sent, which is used on
/// the Dedications page
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

detailsOfHisDedicateSheetX({
  required DetailsOfHisDedicateController controller,
}) {
  return bottomSheetX(
    title: "Details of his dedicate",
    child: Obx(
      () => Column(
        children: [
          /// Inputs Fields
          Form(
            key: controller.formKey,
            autovalidateMode: controller.autoValidate,
            child: Column(
              children: [
                /// Giver's name
                TextFieldX(
                  controller: controller.donorName,
                  label: "Giver's name",
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validate: ValidateX.name,
                  hint: "your name",
                ).fadeAnimation300,

                /// Gifted to him
                TextFieldX(
                  controller: controller.giftedName,
                  label: "The name of the gifted person",
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  hint: "name of gifted",
                  validate: ValidateX.name,
                ).fadeAnimation400,

                /// Gender
                const LabelInputX("The Mahdi's gender is his").fadeAnimation400,
                Row(
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
                ).fadeAnimation400,

                /// Input Phone Number
                PhoneFieldX(
                  key: Key(controller.countryCode.value.toString()),
                  controller: controller.giftedPhone,
                  onChange: controller.onChangeCountryCode,
                  countryCode: controller.countryCode.value,
                  label: "Mehdi's mobile number",
                ).fadeAnimation400,

                /// Get data from contacts
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InkWell(
                    onTap: controller.onPhoneFromContacts,
                    borderRadius: BorderRadius.circular(StyleX.radius),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 20,
                          color: Get.theme.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        TextX(
                          "Choose from contacts",
                          style: TextStyleX.titleSmall,
                          fontWeight: FontWeight.w600,
                          color: Get.theme.primaryColor,
                        )
                      ],
                    ),
                  ),
                ).fadeAnimation500,
              ],
            ),
          ),

          /// Save Button
          ButtonStateX(
            state: controller.buttonState.value,
            text: "Save",
            onTap: controller.onSave,
          )
        ],
      ),
    ),
  );
}
