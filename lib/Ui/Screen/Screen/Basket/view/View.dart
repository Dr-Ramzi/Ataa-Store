import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Animation/animation.dart';
import '../../../../GeneralState/error.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/empty.dart';
import 'Sections/loading.dart';
import 'Sections/mainContent.dart';
import 'Sections/totalPrices.dart';

class BasketView extends GetView<BasketController> {
  const BasketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(
        title: "Giving Basket",
      ),
      body: FutureBuilder(
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
            ).fadeAnimation200;
          }
          return Obx(
            () {
              if (controller.basketGeneral.numItemsBadge.value <= 0) {
                /// Empty State
                return const EmptySectionX();
              } else {
                /// Main Content
                return AbsorbPointer(
                  absorbing: controller.isLoading.value,
                  child: const Scaffold(
                      body: MainContentSectionX(),
                      bottomNavigationBar: TotalPricesSectionX(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
