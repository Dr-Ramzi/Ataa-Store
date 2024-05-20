import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../../Config/config.dart';
import '../../../../Core/core.dart';
import '../../../../Data/data.dart';
import '../../../../UI/Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Review campaign data and confirm its creation
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

confirmCampaignCreationSheetX({
  required CampaignX campaign,
  required String orgName,
  required String projectName,
}) async {
  return await bottomSheetX(
    title: "Confirm campaign creation",
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Warning message
        ContainerX(
          color: Get.theme.colorScheme.onError,
          child: Row(
            children: [
              Icon(
                Icons.info_rounded,
                color: Get.theme.colorScheme.error,
                size: 28,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextX(
                  "Please ensure that the data is correct as it cannot be modified later.",
                  color: Get.theme.colorScheme.error,
                  style: TextStyleX.titleSmall,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ).fadeAnimation200,
        const SizedBox(height: 16),

        /// Title
        const TextX(
          "Your campaign title",
          fontWeight: FontWeight.w600,
        ).fadeAnimation200,
        const SizedBox(height: 8),
        TextX(
          campaign.title,
          style: TextStyleX.supTitleLarge,
        ).fadeAnimation200,

        /// Line
        Divider(color: Get.theme.dividerColor).fadeAnimation200,
        const SizedBox(height: 4),

        /// The Program
        const TextX(
          "The Program",
          fontWeight: FontWeight.w600,
        ).fadeAnimation200,
        const SizedBox(height: 8),
        TextX(
          orgName,
          style: TextStyleX.supTitleLarge,
        ).fadeAnimation200,

        /// Line
        Divider(color: Get.theme.dividerColor).fadeAnimation200,
        const SizedBox(height: 4),

        /// The Program
        const TextX(
          "The Program",
          fontWeight: FontWeight.w600,
        ).fadeAnimation300,
        const SizedBox(height: 8),
        TextX(
          projectName,
          style: TextStyleX.supTitleLarge,
        ).fadeAnimation300,

        /// Line
        Divider(color: Get.theme.dividerColor).fadeAnimation300,
        const SizedBox(height: 4),

        /// Campaign end date
        const TextX(
          "Campaign end date",
          fontWeight: FontWeight.w600,
        ).fadeAnimation300,
        const SizedBox(height: 8),
        TextX(
          DateFormat.yMMMMEEEEd().format(campaign.endDate),
          style: TextStyleX.supTitleLarge,
        ).fadeAnimation300,

        /// Line
        Divider(color: Get.theme.dividerColor).fadeAnimation300,
        const SizedBox(height: 4),

        /// Donation method
        const TextX(
          "Donation method",
          fontWeight: FontWeight.w600,
        ).fadeAnimation300,
        const SizedBox(height: 8),
        TextX(
          campaign.targetAmount != null ? "Open amount" : "Shares",
          style: TextStyleX.supTitleLarge,
        ).fadeAnimation300,

        /// Line
        Divider(color: Get.theme.dividerColor).fadeAnimation300,
        const SizedBox(height: 4),

        /// Target amount
        const TextX(
          "Target amount",
          fontWeight: FontWeight.w600,
        ).fadeAnimation400,
        const SizedBox(height: 8),
        TextX(
          FunctionX.formatLargeNumber(campaign.getTargetAmount),
          style: TextStyleX.supTitleLarge,
        ).fadeAnimation400,
        const SizedBox(height: 16),

        /// Buttons
        Row(
          children: [
            Flexible(
              child: ButtonX(
                text: "Create",
                onTap: () => Get.back(
                  result: true,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: ButtonX.gray(
                text: "Edit",
                iconData: Iconsax.edit,
                onTap: Get.back,
              ),
            ),
          ],
        ).fadeAnimation400
      ],
    ),
  );
}
