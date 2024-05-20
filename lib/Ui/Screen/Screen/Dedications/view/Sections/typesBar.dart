import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class TypesBarSectionX extends GetView<DedicationsController> {
  const TypesBarSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        TextX(
          "Type of gift",
          style: TextStyleX.titleLarge,
        ).paddingSymmetric(horizontal: StyleX.hPaddingApp).fadeAnimation200,
        const SizedBox(height: 8),

        /// Gift Types Options
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
          ),
          child: Obx(
            () => Row(
              children: [
                for (int index = 0; index < controller.types.length; index++)
                  GestureDetector(
                    onTap: () => controller.onChangeType(index),
                    child: ContainerX(
                      margin: const EdgeInsetsDirectional.only(end: 8),
                      width: 125,
                      height: 145,
                      padding: const EdgeInsets.all(10),
                      borderColor: controller.typeSelectedIndex.value == index
                          ? Theme.of(context).primaryColor
                          : null,
                      borderWidth: 2,
                      color: controller.typeSelectedIndex.value == index
                          ? context.isDarkMode?ColorX.primary.shade900.withOpacity(0.3):Theme.of(context).colorScheme.onPrimary
                          : null,
                      isBorder: true,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(StyleX.radius),
                            child: ImageNetworkX(
                              height: 90,
                              width: 100,
                              imageUrl: controller.types[index].imageURL,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Flexible(
                            child: TextX(
                              controller.types[index].name,
                              style: TextStyleX.supTitleLarge,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ).fadeAnimation200,
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
