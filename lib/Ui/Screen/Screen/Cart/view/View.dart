import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/empty.dart';
import 'Sections/loading.dart';
import 'Sections/mainContent.dart';
import 'Sections/totalPrices.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// for don't move navbar when open keyboard
      resizeToAvoidBottomInset: false,
      appBar: const AppBarX(
        title: "Cart",
      ),
      body: FutureBuilderX(
        future: controller.getData,
        loading: const LoadingSectionX(),
        child: (data) {
          return Obx(
            () {
              if (controller.cartGeneral.countItem.value <= 0) {
                /// Empty State
                return const EmptySectionX();
              } else {
                /// Main Content
                return const Scaffold(
                    /// for don't move navbar when open keyboard
                    resizeToAvoidBottomInset: false,
                    body: MainContentSectionX(),
                    bottomNavigationBar: TotalPricesSectionX(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
