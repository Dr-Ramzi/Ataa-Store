import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Config/config.dart';
import '../../../../Core/Controller/Other/previewDedicateController.dart';
import '../../../GeneralState/error.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Preview the dedication before paying
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

previewDedicateSheetX({required PreviewDedicateControllerX controller}) {
  return bottomSheetX(
    title: "Preview the dedication",
    child: FutureBuilder(
      future: controller.getDate(),
      builder: (context, snapshot) {
        /// Loading State
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 300,
            child: Center(
              child: const CircularProgressIndicator().fadeAnimation200,
            ),
          );
        }

        /// Error State
        if (snapshot.hasError) {
          return ErrorView(
            error: snapshot.error.toString(),
          );
        }

        /// Main Content
        return Obx(
          () => Column(
            children: [
              /// Display type tabs
              TabSegmentX(
                controller: controller.previewVia,
                tabs: {
                  1: 'Gift Card'.tr,
                  2: 'Text Message'.tr,
                },
              ).fadeAnimation200,
              const SizedBox(height: 10),

              /// Show the dedication image
              if (controller.isImage.value)
                ContainerX(
                  maxHeight: 500,
                  minHeight: 400,
                  isBorder: true,
                  borderWidth: 4,
                  padding: EdgeInsets.zero,
                  child: ImageNetworkX(
                    fit: BoxFit.contain,
                    imageUrl: controller.imageUrl,
                  ),
                ).fadeAnimation300,

              /// Show the dedication message
              if (!controller.isImage.value)
                ContainerX(
                  color: Get.theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// message
                      TextX(
                        controller.message,
                        color: ColorX.primary,
                      ),
                      const SizedBox(height: 10),

                      /// Dedication Url
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: [
                            Flexible(
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.circular(StyleX.radius),
                                onTap: controller.onTapUrl,
                                child: TextX(
                                  controller.url,
                                  color: ColorX.url,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).fadeAnimation300,
              const SizedBox(height: 10),

              /// Close Button
              ButtonX.gray(text: "Close", onTap: Get.back)
            ],
          ),
        );
      },
    ),
  );
}
