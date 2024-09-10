import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class OrgBarSectionX extends GetView<GiftingController> {
  const OrgBarSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        const TextX(
          "Choose the donation field",
          fontWeight: FontWeight.w700,
        ).paddingSymmetric(horizontal: StyleX.hPaddingApp).fadeAnimation500,
        const SizedBox(height: 8),

        /// Organization Options
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
          ),
          child: GetBuilder<GiftingController>(builder:
            (controller) => Row(
              children: [
                for (int index = 0;
                    index < controller.organizations.length;
                    index++)
                  GestureDetector(
                    onTap: () => controller.onChangeOrg(index),
                    child: ContainerX(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsetsDirectional.only(end: 8),
                      borderColor: controller.orgSelectedIndex.value == index
                          ? Theme.of(context).primaryColor
                          : null,
                      borderWidth: 2,
                      isBorder: true,
                      height: 125,
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageNetworkX(
                            imageUrl: controller.organizations[index].imageUrl,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 14),
                          FittedBox(
                            child: TextX(
                              controller.organizations[index].name,
                              maxLines: 2,
                              style: TextStyleX.titleSmall,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ).fadeAnimation500,
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
