import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../GeneralState/empty.dart';
import '../../../../../../GeneralState/error.dart';
import '../../../../../../Widget/widget.dart';
import 'Sections/loading.dart';
import '../controller/Controller.dart';
import 'Sections/header.dart';

class MyDeductionsView extends GetView<MyDeductionsController> {
  const MyDeductionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "My Deductions",
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
            return Padding(
              padding: const EdgeInsets.only(
                left: StyleX.hPaddingApp,
                right: StyleX.hPaddingApp,
                top: StyleX.vPaddingApp,
              ),
              child: Column(
                children: [
                  /// Title & Description
                  const HeaderSectionX(),
                  const SizedBox(height: 10),

                  /// Content
                  Obx(
                    () {
                      /// Empty State
                      if (controller.deductions.isEmpty) {
                        return const Expanded(
                          child: EmptyView(
                            isMargin: false,
                            message: "There are no deductions",
                          ),
                        );
                      } else {
                        /// Cards
                        return Expanded(
                          child: AbsorbPointer(
                            absorbing: controller.isLoading.value,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: StyleX.vPaddingApp,
                              ),
                              itemCount: controller.deductions.length,
                              itemBuilder: (context, index) => MyDeductionCardX(
                                myDeduction: controller.deductions[index],
                                buttonState: controller.buttonsState[index],
                                onUnsubscribe: () async {
                                  /// Bottom sheet to confirm cancellation of subscription to deduction
                                  await bottomSheetDangerousX(
                                    icon: Icons.warning_rounded,
                                    onOk: () async =>
                                        await controller.onUnsubscribe(index),
                                    okText: "Unsubscribe",
                                    title: "Cancel participation in deduction",
                                    message:
                                        "You are about to opt out of the deduction. Are you sure you want to cancel?",
                                  );
                                },
                              ).fadeAnimationX(100 * (index + 3)),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
