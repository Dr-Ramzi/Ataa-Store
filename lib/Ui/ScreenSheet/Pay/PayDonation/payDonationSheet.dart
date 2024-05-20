import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Config/config.dart';
import '../../../../Core/Controller/Pay/payDonationController.dart';
import '../../../../Core/core.dart';
import '../../../../Data/data.dart';
import '../../../Widget/widget.dart';
import '../../PartOfSheet/DonateOnBehalfOfFamily/donateOnBehalfOfFamily.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Paying a donation to one of the donation projects
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

payDonationSheet(
  DonationX donation, {
  bool onlyAddToCart = false,

  /// Donation drives are treated exactly like donation projects
  CampaignX? campaign,
}) {
  //============================================================================
  // Injection of required controls

  final PayDonationControllerX controller = Get.put(
    PayDonationControllerX(),
    tag: donation.id,
  );
  controller.init(donation, campaign, isSheet: true);

  //============================================================================
  // Content

  return bottomSheetX(
    title: "Donate to the project",
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
                /// Free Donation Options [ 20 , 50 , 100 ] SAR
                if (donation.stockValue == null && donation.packages.isEmpty ||
                    (campaign != null && campaign.targetAmount != null))
                  FreeDonationOptionsX(
                    isMarginTop: false,
                    onSelected: controller.onChangeDonationAmount,
                  ).fadeAnimation200,

                /// Show donation label
                if (donation.packages.isNotEmpty && campaign == null)
                  const LabelInputX("Donation amount").fadeAnimation200,

                /// Choose the best packages available
                if (donation.packages.isNotEmpty && campaign == null)
                  Obx(
                    () => SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          ...donation.packages.map(
                            (val) => Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  end: 5.0,
                                ),
                                child: RadioButtonX(
                                  groupValue: controller.packageSelected.value,
                                  value: val,
                                  onChanged: controller.onChangePackage,
                                  label: val,
                                  isCardOnly: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).fadeAnimation200,

                /// this just for show label of share or not
                if (donation.stockValue != null &&
                    (donation.packages.isEmpty ||
                        (campaign != null && campaign.stockValue != null)))
                  const LabelInputX("Number of Shares").fadeAnimation200,

                /// Enter the number of shares
                if (donation.stockValue != null ||
                    (campaign != null && campaign.stockValue != null))
                  NumberFieldX(
                    min: 1,
                    onChanged: controller.onChangeStockValue,
                    value: controller.numOfStock,
                  ).fadeAnimation200,

                /// Enter and display the donation amount
                Form(
                  key: controller.formKey,
                  autovalidateMode: controller.autoValidate,
                  child: TextFieldX(
                    controller: controller.donationAmount,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    hint: "0",
                    onlyRead: donation.stockValue != null,
                    validate: ValidateX.money,
                    suffixWidget: TextX(
                      "SAR",
                      style: TextStyleX.titleSmall,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                ).fadeAnimation300,

                /// View the donation section for family and friends
                DonateOnBehalfOfFamilyPartOfSheetX(
                  controller: controller.donateOnBehalfOfFamily,
                ),

                /// Add to Cart Button
                if (onlyAddToCart)
                  Obx(
                    () => AddToCartButtonX(
                      onAddToCart: controller.onDonationAddToCart,
                      addToCartButtonState:
                          controller.addToCartButtonState.value,
                    ),
                  ).fadeAnimation500,

                /// Pay Donation & Add to Cart Buttons
                if (!onlyAddToCart)
                  Obx(
                    () => AddToCartAndDonationButtonsX(
                      onDonation: controller.onPayDonation,
                      onAddToCart: controller.onDonationAddToCart,
                      payDonationButtonState:
                          controller.payDonationButtonState.value,
                      addToCartButtonState:
                          controller.addToCartButtonState.value,
                    ),
                  ).fadeAnimation500,
              ],
            ),
          );
        }
      },
    ),
  );
}
