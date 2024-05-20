import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class HeaderSectionX extends GetView<AllGuaranteesController> {
  const HeaderSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: StyleX.hPaddingApp,
        left: StyleX.hPaddingApp,
        top: StyleX.vPaddingApp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          TextX(
            controller.getTitle(),
            style: TextStyleX.headerSmall,
            color: Theme.of(context).primaryColor,
          ).fadeAnimation200,
          const SizedBox(height: 6),

          /// Subtitle
          TextX(
            controller.getDescription(),
            style: TextStyleX.supTitleLarge,
            maxLines: 4,
          ).fadeAnimation200,
        ],
      ),
    );
  }
}
