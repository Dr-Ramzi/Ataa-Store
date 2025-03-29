import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../GeneralState/error.dart';
import '../controller/Controller.dart';
import 'Sections/appBarWithCover.dart';
import 'Sections/donationDetails.dart';
import 'Sections/header.dart';
import 'Sections/loading.dart';
import 'Sections/navbar.dart';

class DonationDetailsView extends GetView<DonationDetailsController> {
  const DonationDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          /// Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingSectionX();
          }

          /// Error State
          if (snapshot.hasError) {
            return ErrorView(
              error: snapshot.error.toString(),
            );
          }

          /// Main Content
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// AppBar
              const AppBarWithCoverSectionX(),

              /// Donation Details
              Expanded(
                child: Stack(
                  children: [
                    const Column(
                      children: [
                        /// Static Section
                        HeaderSectionX(),

                        /// Scroll Section
                        DonationDetailsSectionX(),
                      ],
                    ),

                    /// Pay Buttons
                    if(!controller.donation.donationBasic.isDone)
                    const NavBarSectionX(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
