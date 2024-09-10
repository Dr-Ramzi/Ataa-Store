import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../../../../../Core/core.dart';
import '../../controller/Controller.dart';

class DonationDataSectionX extends GetView<GiftingController> {
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
            const TextX(
              "Donation Data",
              fontWeight: FontWeight.w700,
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
                    selected: controller.freeDonationSelected.value,
                  ),
                  Form(
                    key: controller.formKey,
                    autovalidateMode: controller.autoValidate,
                    child: TextFieldX(
                      controller: controller.donationAmount,
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
                  )
                ],
              ),
            ).fadeAnimation700,

            /// Switches Options
            const SizedBox(height: 10),
            SwitchX(
              label: "Show the amount on the gift card",
              value: controller.isShowAmount.value,
              onChange: controller.onChangeShowAmount,
              margin: EdgeInsets.zero,
            ).fadeAnimation800,
            SwitchX(
              label: "Send a copy to my mobile phone",
              value: controller.isSendToMe.value,
              onChange: controller.onChangeSendToMe,
              margin: EdgeInsets.zero,
            ).fadeAnimation800,
            SwitchX(
              label: "Send later",
              value: controller.isSendLater.value,
              onChange: controller.onChangeSendLater,
              margin: EdgeInsets.zero,
            ).fadeAnimation800,

            /// Sending Date
            if (controller.isSendLater.value)
              TextFieldDateX(
                label: "Date and time of dispatch",
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
