import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class AppBarWithCoverSectionX extends GetView<CampaignDetailsController> {
  const AppBarWithCoverSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Cover Images
        SizedBox(
          height: 300,
          width: double.maxFinite,
          child: PageView.builder(
            controller: controller.imagesController,
            itemCount: controller.campaign.imageURL.length,
            itemBuilder: (_, index) {
              return Container(
                color: Theme.of(context).cardColor,
                width: double.maxFinite,
                height: 300,
                child: ImageNetworkX(
                  imageUrl: controller.campaign.imageURL[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ).fadeAnimation200,

        /// AppBar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBarTransparent(
            title: "Campaign Details",
            actions: [
              CartIconButtonsX(
                isAnimation: false,
              )
            ],
          ),
        ),

        /// Images Pointer
        Positioned(
          bottom: 38,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: controller.imagesController,
                count: controller.campaign.imageURL.length,
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
