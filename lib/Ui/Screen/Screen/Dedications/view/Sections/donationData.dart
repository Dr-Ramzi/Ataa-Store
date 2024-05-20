import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../../../../../Core/core.dart';
import '../../controller/Controller.dart';

class DonationDataSectionX extends GetView<DedicationsController> {
  const DonationDataSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            TextX(
              "Donation Data",
              style: TextStyleX.titleLarge,
            ).fadeAnimation700,
            const SizedBox(height: 8),

            /// Donation Amount Field
            ContainerX(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FreeDonationOptionsX(
                    isMarginTop: false,
                    onSelected: controller.onChangeDonationAmount,
                  ),
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
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  )
                ],
              ),
            ).fadeAnimation700,

            /// Switches Options
            const SizedBox(height: 10),
            SwitchX(
              label: "Show the amount on the gift card",
              isChangeStateInternally: false,
              value: controller.isShowAmount.value,
              onChange: controller.onChangeShowAmount,
              margin: EdgeInsets.zero,
            ).fadeAnimation800,
            SwitchX(
              label: "Send a copy to my mobile phone",
              isChangeStateInternally: false,
              value: controller.isSendToMe.value,
              onChange: controller.onChangeSendToMe,
              margin: EdgeInsets.zero,
            ).fadeAnimation800,
            SwitchX(
              label: "Send later",
              isChangeStateInternally: false,
              value: controller.isSendLater.value,
              onChange: controller.onChangeSendLater,
              margin: EdgeInsets.zero,
            ).fadeAnimation800,

            /// Sending Date
            if (controller.isSendLater.value)
              TextFieldDateX(
                label: "Sending Date",
                controller: controller.date,
                icon: Icons.calendar_month_rounded,
                hint: "-- Select date --",
                color: context.isDarkMode?null:Theme.of(context).cardColor,
                validate: ValidateX.date,
                onChange: controller.onChangeDate,
                initialDate: controller.sendLaterDate.value,
                firstDate: DateTime.now().add(const Duration(days: 1)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              ).paddingOnly(top: 10).fadeAnimation200,

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
