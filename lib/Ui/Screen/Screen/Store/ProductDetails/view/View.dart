import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/imagesBar.dart';
import 'Sections/loading.dart';
import 'Sections/navbar.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBarX(
        title: "Product Details",
        actions: [BasketIconButtonsX()],
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

          /// Main Content
          return Scaffold(
            body: Obx(
              () => AbsorbPointer(
                absorbing: controller.isLoading.value,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: StyleX.vPaddingApp,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Cover Image
                      Obx(
                        () => ContainerX(
                          isBorder: true,
                          padding: EdgeInsets.zero,
                          radius: StyleX.radiusMd,
                          margin: const EdgeInsets.symmetric(
                            horizontal: StyleX.hPaddingApp,
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(StyleX.radiusMd),
                            child: ImageNetworkX(
                              imageUrl: controller.product.imageURL[
                                  controller.imageSelectedIndex.value],
                              height: 200,
                              width: double.maxFinite,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ).fadeAnimation200,
                      ),
                      const SizedBox(height: 12),

                      /// Product images
                      /// Show images bar if has more 1
                      if (controller.product.imageURL.length > 1)
                        const ImagesBarSection().fadeAnimation300,
                      const SizedBox(height: 16),

                      /// Product Details
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: StyleX.hPaddingApp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// Product Name
                                Expanded(
                                  child: TextX(
                                    controller.product.name,
                                    style: TextStyleX.titleLarge,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 20),

                                /// Rating rate
                                ContainerX(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  color: ColorX.primary.shade50,
                                  child: Row(
                                    children: [
                                      TextX(
                                        controller.product.rating
                                            .toStringAsFixed(1),
                                        style: TextStyleX.supTitleLarge,
                                        color: ColorX.primary,
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(
                                        Icons.access_time_filled_rounded,
                                        color: ColorX.primary,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).fadeAnimation300,
                            const SizedBox(height: 10),

                            /// More Details
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                /// Price
                                TextX(
                                  "${controller.product.price} ${"SAR".tr}",
                                  fontWeight: FontWeight.w700,
                                  style: TextStyleX.titleLarge,
                                  color: Theme.of(context).primaryColor,
                                ),

                                /// Rating
                                RatingBar.builder(
                                  initialRating: controller.product.rating,
                                  allowHalfRating: true,
                                  itemSize: 24,
                                  unratedColor: ColorX.grey.shade200,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (_) {},
                                  ignoreGestures: true,
                                ),
                              ],
                            ).fadeAnimation400,
                          ],
                        ),
                      ),

                      /// Available colors
                      if (controller.product.colors.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 14),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: StyleX.hPaddingApp,
                              ),
                              child: LabelInputX("Available colors"),
                            ),
                            const SizedBox(height: 6),
                            ColorBarSelectorX(
                              key: Key(controller.product.id),
                              colors: controller.product.colors,
                              colorSelectedIndex:
                                  controller.colorSelectedIndex.value,
                              onChangeColor: controller.onChangeColor,
                            ),
                          ],
                        ).fadeAnimation400,

                      /// Available Sizes
                      if (controller.product.sizes.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: StyleX.hPaddingApp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const LabelInputX("Sizes"),
                              DropdownX(
                                color: context.isDarkMode?null:Theme.of(context).cardColor,
                                disable: controller.product.sizes.length == 1,
                                value: controller.sizeSelected,
                                list: controller.product.sizes,
                                onChanged: controller.onChangeSize,
                                hint: "-- Choose --",
                              )
                            ],
                          ),
                        ).fadeAnimation400,

                      /// Product information
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: StyleX.hPaddingApp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            TextX(
                              "Product information",
                              style: TextStyleX.titleLarge,
                            ),
                            const SizedBox(height: 6),
                            TextX(
                              controller.product.description,
                              style: TextStyleX.titleSmall,
                            ),
                          ],
                        ),
                      ).fadeAnimation500,
                    ],
                  ),
                ),
              ),
            ),

            /// Buttons
            bottomNavigationBar: const NavBarSectionX().fadeAnimation500,
          );
        },
      ),
    );
  }
}
