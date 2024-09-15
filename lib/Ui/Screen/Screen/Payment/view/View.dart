import 'package:ataa/Config/config.dart';
import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/paymentByBank.dart';
import 'Sections/paymentByCard.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CartIconButtonsX()],
      ),
      // body: FutureBuilderX(
      //   future: controller.getData,
      //   child: (data) => const SingleChildScrollView(
      //      padding: EdgeInsets.symmetric(vertical: StyleX.vPaddingApp,horizontal: StyleX.hPaddingApp,),
      //     child: ContainerX(
      //       child: Column(
      //         children: [
      //           /// Pay with Apple
      //           PaymentByAppleAndGoogleButtonX(
      //             isApple: true,
      //             onTap: controller.onDonatingByApple,
      //             state: controller.appleButtonState.value,
      //           ).fadeAnimation200,
      //
      //           /// Pay with Google
      //           PaymentByAppleAndGoogleButtonX(
      //             isApple: false,
      //             onTap: controller.onDonatingByGoogle,
      //             state: controller.googleButtonState.value,
      //           ).fadeAnimation200,
      //
      //           /// The word "OR" is an element
      //             Row(
      //               children: [
      //                 Flexible(child: Divider()),
      //                 Padding(
      //                   padding: EdgeInsets.symmetric(horizontal: 25),
      //                   child: TextX(
      //                     "OR",
      //                     color: ColorX.grey.shade400,
      //                   ),
      //                 ),
      //                 Flexible(child: Divider()),
      //               ],
      //             ),
      //
      //           TabSegmentX(
      //             controller: controller.loginVia,
      //             tabs: {
      //               1: 'Via Mobile'.tr,
      //               2: 'Via Email'.tr,
      //             },
      //           ).fadeAnimation400.marginOnly(bottom: 20),
      //
      //           if (controller.isViaCard.value)
      //             PaymentByCardSectionX(),
      //           if (!controller.isViaCard.value)
      //             PaymentByBankSectionX()
      //
      //           /// Pay with App
      //           ButtonStateX(
      //             onTap: controller.onDonatingByApp,
      //             state: controller.buttonState.value,
      //             text: 'Payment by payment card or bank transfer',
      //           ).fadeAnimation500,
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
