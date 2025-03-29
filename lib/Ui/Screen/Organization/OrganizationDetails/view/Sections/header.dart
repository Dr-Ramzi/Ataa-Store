import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class HeaderSectionX extends GetView<OrganizationDetailsController> {
  const HeaderSectionX({this.isMargin = true, super.key});
  final bool isMargin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMargin?const EdgeInsets.only(
        right: StyleX.hPaddingApp,
        left: StyleX.hPaddingApp,
        top: StyleX.vPaddingApp,
      ):EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          TextX(
            controller.org.name,
            style: TextStyleX.headerSmall,
            color: Theme.of(context).primaryColor,
          ).fadeAnimation200,
          const SizedBox(height: 6),

          /// Description
          HtmlWidget(Get.isDarkMode
              ? controller.org.description.replaceAllMapped(
              RegExp(r'color:\s*(rgb\(0,\s*0,\s*0\)|#000000|black|rgb\(255,\s*255,\s*255\)|#ffffff|white)', caseSensitive: false),
                  (match) {
                const colorMap = {
                  'rgb(0, 0, 0)': 'rgb(255, 255, 255)',
                  '#000000': '#ffffff',
                  'black': 'white',
                  'rgb(255, 255, 255)': 'rgb(0, 0, 0)',
                  '#ffffff': '#000000',
                  'white': 'black',
                };
                return 'color: ${colorMap[match.group(1)?.toLowerCase()] ?? match.group(1)}';
              }):
            controller.org.description,
            textStyle: TextStyleX.supTitleLarge,
          ).fadeAnimation200,
        ],
      ),
    );
  }
}
