import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Section/Partners/view/View.dart';
import '../../../../../Section/StatisticsAndFigures/view/View.dart';
import '../../../../../Section/Testimonials/view/View.dart';
import '../../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: 'About Us',
        actions: [CartIconButtonsX()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          padding: const EdgeInsets.symmetric(
            vertical: StyleX.vPaddingApp,
          ),
          child: Column(
            children: [
              ContainerX(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  children: [
                    /// Logo
                    const LogoX(height: 50.0).marginSymmetric(vertical: 40),

                    /// Content
                    FutureBuilderX(
                      future: controller.getData,
                      loading: SingleChildScrollView(
                        child: Column(
                          children: [
                            /// Text
                            for (int i = 0; i < 3; i++)
                              ShimmerAnimationX(
                                height: 34,
                                margin: EdgeInsets.only(bottom: i < 3 ? 10 : 0),
                              )
                          ],
                        ),
                      ),
                      child: (_) => HtmlWidget(Get.isDarkMode
                          ? controller.about.contentHTML.replaceAllMapped(
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
                          }): controller.about.contentHTML,
                        customWidgetBuilder: (element) {
                          if (element.localName == 'img') {
                            return ImageNetworkX(
                                imageUrl:
                                    element.attributes[NameX.src].toString(),
                                width: double.maxFinite);
                          }
                          return null;
                        },
                        textStyle: TextStyleX.titleMedium,
                      ).fadeAnimation200,
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: StyleX.hPaddingApp),
              const SizedBox(height: 26),
              StatisticsAndFiguresSectionX(
                padding: const EdgeInsets.only(bottom: 14),
                parentScrollController: controller.scrollController,
                header: TextX(
                  'Statistics and Figures',
                  color: Get.theme.primaryColor,
                  style: TextStyleX.titleLarge,
                  textAlign: TextAlign.center,
                ).paddingOnly(bottom: 6),
              ).paddingSymmetric(horizontal: StyleX.hPaddingApp),
              TestimonialsSectionX(
                padding: const EdgeInsets.only(bottom: 26,
                right: StyleX.hPaddingApp,
                  left: StyleX.hPaddingApp,
                ),
                header: TextX(
                  'Testimonials',
                  color: Get.theme.primaryColor,
                  style: TextStyleX.titleLarge,
                  textAlign: TextAlign.center,
                ).paddingOnly(bottom: 6),
              ),
              PartnersSectionX(
                padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
                header: TextX(
                  'Our Partners',
                  color: Get.theme.primaryColor,
                  style: TextStyleX.titleLarge,
                  textAlign: TextAlign.center,
                ).paddingOnly(bottom: 6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
