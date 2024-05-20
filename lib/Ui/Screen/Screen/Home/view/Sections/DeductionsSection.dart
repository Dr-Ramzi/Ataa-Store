import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Animation/animation.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class DeductionsSectionX extends GetView<HomeController> {
  const DeductionsSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getDeductions(),
      builder: (context, snapshot) {

        /// If the data is still loading, a flash is displayed in the same shape as the item expected to appear
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ScrollCardsHorizontallyX(
              height:StyleX.deductionCardHeight,
              title: "Deductions",
              icon: Icons.credit_card_rounded,
              onShowMore: controller.onDeductionsMore,
              cards: [
                for (int i = 0; i < 3; i++)
                   const ShimmerAnimationX(
                    height: StyleX.deductionCardHeight,
                    width: StyleX.deductionCardWidthSM,
                    margin: EdgeInsetsDirectional.only(end: 14),
                  )
              ],
          );
        }

        /// If there is an error in this section or it is empty, the section does not appear
        if (snapshot.hasError || controller.deductions.isEmpty) {
          return const SizedBox();
        }

        /// When the data has finished loading properly, it is displayed
        return ScrollCardsHorizontallyX(
            height: StyleX.deductionCardHeight,
            title: "Deductions",
            icon: Icons.credit_card_rounded,
            onShowMore: controller.onDeductionsMore,
            cards: [
              ...controller.deductions.map(
                (obj) => CharitableProjectCardX(
                  isSmallCard: true,
                  onTap: controller.onTapDeduction,
                  onDonation: controller.onSubscriptionDeduction,
                  deduction: obj.deduction,
                  obj: obj,
                ).fadeAnimation300,
              ),
            ],
        );
      },
    );
  }
}
