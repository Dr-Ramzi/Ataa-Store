import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../GeneralState/empty.dart';
import '../../../../../../GeneralState/error.dart';
import '../../../../../../Widget/widget.dart';
import 'Sections/loading.dart';
import '../controller/Controller.dart';

class MyGuaranteesView extends GetView<MyGuaranteesController> {
  const MyGuaranteesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "My Guarantees",
        actions: [BasketIconButtonsX()],
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

            /// Empty State
            if (controller.guarantees.isEmpty) {
              return const EmptyView(
                message: "There are no current guarantees",
              );
            }

            /// Main Content
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleX.hPaddingApp,
                vertical: StyleX.vPaddingApp,
              ),
              itemCount: controller.guarantees.length,
              itemBuilder: (context, index) => MyGuaranteeCardX(
                guarantee: controller.guarantees[index],
              ).fadeAnimationX(60 * (index + 1)),
            );
          },
        ),
      ),
    );
  }
}
