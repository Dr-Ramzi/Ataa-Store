import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/campaigns.dart';
import 'Sections/deductions.dart';
import 'Sections/donations.dart';
import 'Sections/guarantees.dart';
import 'Sections/loading.dart';
import 'Sections/orders.dart';
import 'Sections/sharingLinks.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Statistics",
        actions: [BasketIconButtonsX()],
      ),
      body: SafeArea(
        child: FutureBuilder(
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
            return const SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: StyleX.hPaddingApp,
                vertical: StyleX.vPaddingApp,
              ),
              child: Column(
                children: [
                  DonationsSectionX(),
                  CampaignsSectionX(),
                  OrdersSectionX(),
                  DeductionsSectionX(),
                  GuaranteesSectionX(),
                  SharingLinksSectionX(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
