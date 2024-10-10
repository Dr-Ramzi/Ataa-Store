import 'package:ataa/Config/config.dart';
import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Section/PreSavedPaymentCards/view/View.dart';
import '../../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class DeductionPaymentView extends GetView<DeductionPaymentController> {
  const DeductionPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(
        title: 'Complete the deduction process',
      ),
      body: SafeArea(
        child: FutureBuilderX(
          future: controller.getData,
          child: (data) => Obx(
            () => SingleChildScrollView(
              controller: controller.scrollController,
              padding: const EdgeInsets.symmetric(
                vertical: StyleX.vPaddingApp,
                horizontal: StyleX.hPaddingApp,
              ),
              child: Column(
                children: [
                  if(controller.error.value!=null)
                  MessageCardX(
                    isError: true,
                    message: controller.error.value?.message,
                  ).fadeAnimation200.marginOnly(bottom: 14),
                  ContainerX(
                    child: Column(
                      children: [
                        PreSavedPaymentCardsSectionX(
                            controller: controller.preSavedPaymentCardsController),
                        ButtonStateX(
                          disabled: !controller
                              .preSavedPaymentCardsController.isValidate.value,
                          onTap: controller.onPay,
                          text: 'Confirm the deduction process',
                          state: controller.buttonState.value,
                        ).fadeAnimation400
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
