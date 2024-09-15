import 'package:ataa/Data/data.dart';
import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class DynamicPageView extends GetView<DynamicPageController> {
  const DynamicPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: controller.page.title,
        actions: [CartIconButtonsX()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp,
          vertical: StyleX.vPaddingApp,
        ),
        child: ContainerX(
          padding: const EdgeInsets.all(16),
          child: HtmlWidget(
            buildAsync: true,
            controller.page.contentHTML,
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
    );
  }
}
