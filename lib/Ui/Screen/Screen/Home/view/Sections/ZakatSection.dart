import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Animation/animation.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class ZakatSectionX extends GetView<HomeController> {
  const ZakatSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getZakat(),
      builder: (context, snapshot) {

        /// If the data is still loading, a flash is displayed in the same shape as the item expected to appear
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ScrollCardsHorizontallyX(
            height: StyleX.charitableProjectCardHeight,
            title: "Zakat",
            icon: Icons.verified_rounded,
            onShowMore: controller.onZakatMore,
            cards: [
              for (int i = 0; i < 3; i++)
                const ShimmerAnimationX(
                  height: StyleX.charitableProjectCardHeight,
                  width: StyleX.charitableProjectCardWidthSM,
                  margin: EdgeInsetsDirectional.only(end: 14),
                )
            ],
          );
        }

        /// If there is an error in this section or it is empty, the section does not appear
        if (snapshot.hasError || controller.zakat.isEmpty) {
          return const SizedBox();
        }

        /// When the data has finished loading properly, it is displayed
        return ScrollCardsHorizontallyX(
          height: StyleX.charitableProjectCardHeight,
          title: "Zakat",
          icon: Icons.verified_rounded,
          onShowMore: controller.onZakatMore,
          cards: [
            ...controller.zakat.map(
              (obj) => CharitableProjectCardX(
                isSmallCard: true,
                onTap: controller.onTapDonation,
                onDonation: controller.onPayDonation,
                onAddToCart: controller.onDonationAddToCart,
                isZakat: true,
                stockValue: obj.stockValue,
                totalDonations: obj.totalDonations,
                obj: obj,
              ).fadeAnimation300,
            ),
          ],
        );
      },
    );
  }
}
