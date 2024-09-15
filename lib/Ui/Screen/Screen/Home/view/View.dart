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
    return Scaffold(
      /// This is a stack to implement the design of the page's AppBar
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            /// This for app bar home design
            Positioned.fill(
              top: -27,
              child: SingleChildScrollView(
                controller: controller.scrollController,
                /// this padding for height quick donation in nav bar
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AdsSectionX(),
                    const DonationsSectionX(),
                    const AssociationProgramsSectionX(),
                    const DeductionsSectionX(),
                    const ZakatSectionX(),
                    /// TODO: Show >>> Store on home
                    // ProductsSectionX(),
                    TestimonialsSectionX(
                      padding: const EdgeInsets.only(
                        left: StyleX.hPaddingApp,
                        right: StyleX.hPaddingApp,
                        bottom: 20,
                      ),
                      header: const SectionTitleX(
                        title: "Testimonials",
                        icon: IconX.testimonials,
                      ),
                    ),
                    StatisticsAndFiguresSectionX(
                      padding: const EdgeInsets.only(
                        left: StyleX.hPaddingApp,
                        right: StyleX.hPaddingApp,
                        bottom: 8,
                      ),
                      parentScrollController: controller.scrollController,
                      header: const SectionTitleX(
                        title: "Statistics and Figures",
                        icon: IconX.statisticsAndFigures,
                        iconSize: 18,
                      ),
                    ),
                    PartnersSectionX(
                      padding: const EdgeInsets.only(
                        left: StyleX.hPaddingApp,
                        right: StyleX.hPaddingApp,
                      ),
                      header: const SectionTitleX(
                        title: "Our Partners",
                        icon: IconX.sparkles,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
