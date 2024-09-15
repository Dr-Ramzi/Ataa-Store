import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../ScreenSheet/Selection/Donation/donationSelectionSheet.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/loading.dart';

class CreateCampaignView extends GetView<CreateCampaignController> {
  const CreateCampaignView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Create a campaign",
        actions: [CartIconButtonsX()],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            /// Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingSectionX();
            }

            /// Error State
            if (snapshot.hasError) {
              return ErrorView(
                error: snapshot.error.toString(),
              );
            }

            /// Main Content
            return Obx(
              () => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: StyleX.hPaddingApp,
                  vertical: StyleX.vPaddingApp,
                ),
                child: AbsorbPointer(
                  absorbing: controller.isLoading.value,

                  /// Card
                  child: ContainerX(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        /// Program
                        DropdownX(
                          title: "The Program",
                          hint: "-- Choose donation project --",
                          value: controller.orgSelected.value,
                          list: controller.organizations,
                          valuesShow: controller.valuesShowOrg,
                          onChanged: controller.onChangeOrg,
                        ).fadeAnimation200,
                        const SizedBox(height: 10),

                        /// Project
                        const LabelInputX("Project").fadeAnimation200,
                        MultipleSelectionCardX(
                          asInputField: true,
                          title: "-- Choose project --",
                          onTap: () => donationSelectionSheetX(
                            controller:
                                controller.donationOpportunityController,
                          ),
                          selected: controller.donationOpportunityController
                              .donationSelected.value?.name,
                        ).fadeAnimation200,
                        const SizedBox(height: 10),
                        Form(
                          key: controller.formKey,
                          autovalidateMode: controller.autoValidate,
                          child: Column(
                            children: [
                              /// Campaign Title
                              TextFieldX(
                                label: "Your campaign title",
                                controller: controller.title,
                                hint: "title",
                                validate: ValidateX.title,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.name,
                              ).fadeAnimation300,
                              const SizedBox(height: 10),

                              /// Campaign Date
                              TextFieldDateX(
                                label: "Campaign end date",
                                controller: controller.date,
                                icon: IconX.date,
                                hint: "-- Select date --",
                                validate: ValidateX.date,
                                onChange: controller.onChangeDate,
                                initialDate: controller.endDate.value,
                                firstDate:
                                    DateTime.now().add(const Duration(days: 1)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              ).fadeAnimation300,

                              /// Donation method
                              const LabelInputX("Donation method")
                                  .fadeAnimation300,
                              Row(
                                children: [
                                  Flexible(
                                    child: RadioButtonX(
                                      label: "Open amount",
                                      groupValue:
                                          controller.isOpenDonation.value,
                                      value: true,
                                      onChanged:
                                          controller.onChangeDonationMethod,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: RadioButtonX(
                                      label: "Shares",
                                      groupValue:
                                          controller.isOpenDonation.value,
                                      value: false,
                                      onChanged:
                                          controller.onChangeDonationMethod,
                                    ),
                                  ),
                                ],
                              ).fadeAnimation400,
                              const SizedBox(
                                height: 10,
                              ),

                              /// Target amount
                              if (controller.isOpenDonation.value)
                                TextFieldX(
                                  label: "Target amount",
                                  controller: controller.targetAmount,
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  hint: "0",
                                  validate: ValidateX.money,
                                  suffixWidget: TextX(
                                    "SAR",
                                    style: TextStyleX.titleSmall,
                                    color: Get.theme.colorScheme.secondary,
                                  ),
                                ).fadeAnimation500,

                              /// Share value & number
                              if (!controller.isOpenDonation.value)
                                Row(
                                  children: [
                                    Flexible(
                                      child: TextFieldX(
                                        label: "Share value",
                                        controller: controller.shareValue,
                                        textInputType: TextInputType.number,
                                        textInputAction: TextInputAction.done,

                                        hint: "0",
                                        validate: ValidateX.money,
                                        suffixWidget: TextX(
                                          "SAR",
                                          style: TextStyleX.titleSmall,
                                          color:
                                              Get.theme.colorScheme.secondary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: NumberFieldX(
                                        label: "Number of Shares",
                                        onChanged: controller.onChangeNumShares,
                                        value: controller.numShares.value,
                                        min: 1,
                                        max: 1000,
                                      ),
                                    ),
                                  ],
                                ).fadeAnimation500,
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        /// Agree to the terms
                        SwitchX(
                          value: controller.isAgreed.value,
                          onChange: controller.onChangeAgreed,
                          isSmallTitle: true,
                          isFittedTitle: false,
                          label:
                              "I agree that the donations that will be collected will be spent on the campaign by the Ataa platform",
                        ).fadeAnimation500,
                        const SizedBox(
                          height: 10,
                        ),

                        /// Button
                        ButtonStateX(
                          state: controller.buttonState.value,
                          text: "Next",
                          onTap: controller.onCreate,
                        ).fadeAnimation600
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
