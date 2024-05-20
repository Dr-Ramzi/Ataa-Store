import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Controller.dart';
import 'Sections/AdsSection.dart';
import 'Sections/AssociationProgramsSection.dart';
import 'Sections/DeductionsSection.dart';
import 'Sections/DonationsSection.dart';
import 'Sections/ProductsSection.dart';
import 'Sections/ZakatSection.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                /// this padding for height quick donation in nav bar
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AdsSectionX(),
                    DonationsSectionX(),
                    AssociationProgramsSectionX(),
                    DeductionsSectionX(),
                    ZakatSectionX(),
                    ProductsSectionX(),
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
