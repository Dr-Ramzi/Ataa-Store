import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../GeneralState/error.dart';
import '../controller/Controller.dart';
import 'Sections/appBarWithCover.dart';
import 'Sections/deductionDetails.dart';
import 'Sections/header.dart';
import 'Sections/loading.dart';
import 'Sections/navbar.dart';

class DeductionDetailsView extends GetView<DeductionDetailsController> {
  const DeductionDetailsView({super.key});
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
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// AppBar
              AppBarWithCoverSectionX(),

              /// Donation Details
              Expanded(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        /// Static Section
                        HeaderSectionX(),

                        /// Scroll Section
                        DeductionDetailsSectionX(),
                      ],
                    ),

                    /// Pay Buttons
                    NavBarSectionX(),
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
