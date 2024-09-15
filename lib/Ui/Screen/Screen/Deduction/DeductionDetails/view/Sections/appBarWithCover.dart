import 'package:ataa/UI/Animation/animation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class AppBarWithCoverSectionX extends GetView<DeductionDetailsController> {
  const AppBarWithCoverSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Cover Image & Video
        SizedBox(
          height: 300,
          width: double.maxFinite,
          child: PageView.builder(
            controller: controller.imagesController,
            itemCount: controller.getNumCover(),
            itemBuilder: (_, index) {
              if ((controller.getNumCover() == 1 &&
                      index == 0 &&
                      controller.deduction.imageUrl.isNotEmpty) ||
                  (controller.getNumCover() == 2 && index == 0)) {
                return Container(
                  color: Theme.of(context).cardColor,
                  width: double.maxFinite,
                  height: 300,
                  child: ImageNetworkX(
                    imageUrl: controller.deduction.imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              } else if (!controller.hasErrorVideo.value ||
                  (controller.getNumCover() == 1 &&
                      index == 0 &&
                      controller.deduction.videoUrl.isNotEmpty) ||
                  (controller.getNumCover() == 2 && index == 1)) {
                return Obx(
                  () {
                    if (controller.isInitChewieController.isFalse ||
                        !controller
                            .videoPlayerController.value.value.isInitialized) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                        color: Colors.black,
                        child: Chewie(
                          controller: controller.chewieController,
                        ),
                      );
                    }
                  },
                );
              } else {
                return SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: SvgPicture.asset(
                      context.isDarkMode ? ImageX.logoWhite : ImageX.logo,
                    ),
                  ),
                );
              }
            },
          ),
        ).fadeAnimation200,

        /// AppBar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBarTransparent(
            title: "Deduction Details",
            actions: [
              CartIconButtonsX(
                isAnimation: false,
              )
            ],
          ),
        ),

        /// Image & Video Pointer
        if (controller.getNumCover() != 1)
          Positioned(
            bottom: 38,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: controller.imagesController,
                  count: controller.getNumCover(),
                  effect: const ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white70,
                    expansionFactor: 4,
                  ),
                ).fadeAnimation200,
              ],
            ),
          ),

        /// for create Rounded Background Design
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 22,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadiusDirectional.vertical(
                top: Radius.circular(
                  StyleX.radiusMd,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
