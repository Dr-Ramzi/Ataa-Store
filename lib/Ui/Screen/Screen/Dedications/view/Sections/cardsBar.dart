import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class CardsBarSectionX extends GetView<DedicationsController> {
  const CardsBarSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        TextX(
          "Gift Card",
          style: TextStyleX.titleLarge,
        ).paddingSymmetric(horizontal: StyleX.hPaddingApp).fadeAnimation300,
        const SizedBox(height: 8),

        /// Gift Cards Options
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
          ),
          child: Obx(
            () => Row(
              children: [
                for (int index = 0; index < controller.cards.length; index++)
                  GestureDetector(
                    onTap: () => controller.onChangeCard(index),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: ContainerX(
                        padding: const EdgeInsets.all(2),
                        color: controller.cardSelectedIndex.value == index
                            ? Theme.of(context).colorScheme.onPrimary
                            : null,
                        borderColor: controller.cardSelectedIndex.value == index
                            ? Theme.of(context).primaryColor
                            : null,
                        borderWidth: 4,
                        isBorder: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(StyleX.radius),
                          child: ImageNetworkX(
                            width: 150,
                            height: 230,
                            fit: BoxFit.contain,
                            imageUrl: controller.cards[index].imageURL,
                          ),
                        ),
                      ),
                    ).fadeAnimation300,
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
