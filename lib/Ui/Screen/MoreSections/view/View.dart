import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Controller.dart';
import 'sections/dynamic_options.dart';
import 'sections/static_options.dart';

class MoreSectionsView extends GetView<MoreSectionsController> {
  const MoreSectionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(() {
        if(controller.root.isMoreDynamicPage.isFalse) {
          return const StaticOptionsSectionX();
        } else {
          return const DynamicOptionsSectionX();
        }
      },),
    );
  }
}