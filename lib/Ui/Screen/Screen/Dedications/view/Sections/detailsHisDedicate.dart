import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class DetailsHisDedicateSectionX extends GetView<DedicationsController> {
  const DetailsHisDedicateSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          TextX(
            "Details of his dedicate",
            style: TextStyleX.titleLarge,
          ).fadeAnimation600,
          const SizedBox(height: 8),

          /// Text Button
          InkWell(
            onTap: controller.onTapDetailsDedicate,
            borderRadius: BorderRadius.circular(StyleX.radius),
            child: Row(
              children: [
                Icon(
                  Icons.person_add_alt_rounded,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 8),
                TextX(
                  "Enter the dedicates information",
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ).fadeAnimation600,
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
