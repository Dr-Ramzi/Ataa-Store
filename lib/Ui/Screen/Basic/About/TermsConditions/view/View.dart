import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../Widget/Basic/Utils/future_builder.dart';
import '../controller/Controller.dart';

class TermsConditionsView extends GetView<TermsConditionsController> {
  const TermsConditionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Terms and Conditions'),
      body: SafeArea(
        child: FutureBuilderX(
          future: controller.getData,
          loading: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ContainerX(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  for (int i = 0; i < 20; i++)
                    const ShimmerAnimationX(
                      height: 34,
                      margin: EdgeInsets.only(bottom: 10),
                    )
                ],
              ),
            ),
          ),
          child: (_)=> SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ContainerX(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: HtmlWidget(Get.isDarkMode
                  ? controller.termsConditions.contentHTML.replaceAllMapped(
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
                controller.termsConditions.contentHTML,
                customWidgetBuilder: (element) {
                  if(element.localName == 'img'){
                    return ImageNetworkX(imageUrl: element.attributes[NameX.src].toString(),width: double.maxFinite);
                  }
                  return null;
                },
                textStyle: TextStyleX.titleMedium,
              ).fadeAnimation200,
            ),
          ),
        ),
      ),
    );
  }
}
