import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../GeneralState/empty.dart';
import '../../../../../../GeneralState/error.dart';
import '../../../../../../Widget/widget.dart';
import 'Sections/loading.dart';
import '../controller/Controller.dart';

class SharingLinksView extends GetView<SharingLinksController> {
  const SharingLinksView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Sharing links",
        actions: [CartIconButtonsX()],
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
            );
          }

          /// Empty State
          if (controller.shareLinks.isEmpty) {
            return EmptyView(
              message: "You don't have sharing links yet",
              onTap: controller.onAddShareLink,
              buttonText: "Create a share link",
            );
          }

          /// Main Content
          return Obx(
            () => AbsorbPointer(
              absorbing: controller.isLoading.value,
              child: Scaffold(
                body: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: StyleX.hPaddingApp,
                    vertical: StyleX.vPaddingApp,
                  ),

                  /// Cards
                  itemCount: controller.shareLinks.length,
                  itemBuilder: (context, index) => ShareLinkCardX(
                    shareLink: controller.shareLinks[index],
                  ).fadeAnimationX(60 * (index + 1)),
                ),

                /// Create a new share link button
                floatingActionButton: FloatingActionButtonX(
                  onTap: controller.onAddShareLink,
                  icon: Icons.add,
                ).fadeAnimation300,
              ),
            ),
          );
        },
      ),
    );
  }
}
