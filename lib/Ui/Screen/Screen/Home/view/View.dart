import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Section/Partners/view/View.dart';
import '../../../../Section/StatisticsAndFigures/view/View.dart';
import '../../../../Section/Testimonials/view/View.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/AdsSection.dart';
import 'Sections/AssociationProgramsSection.dart';
import 'Sections/DeductionsSection.dart';
import 'Sections/DonationsSection.dart';
import 'Sections/ZakatSection.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        /// This for app bar home design
        Positioned.fill(
          top: -27,
          child: SingleChildScrollView(
            controller: controller.scrollController,
            /// this padding for height quick donation in nav bar
            padding: const EdgeInsets.only(bottom: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AdsSectionX(),
                ...controller.getActiveSections(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
