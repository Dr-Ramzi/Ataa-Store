import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../GeneralState/error.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/buttons.dart';
import 'Sections/cardsBar.dart';
import 'Sections/colorsBar.dart';
import 'Sections/detailsHisDedicate.dart';
import 'Sections/donationData.dart';
import 'Sections/loading.dart';
import 'Sections/orgBar.dart';
import 'Sections/typesBar.dart';

class DedicationsView extends GetView<DedicationsController> {
  const DedicationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Dedications",
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
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: StyleX.vPaddingApp),
              child: Obx(
                () => AbsorbPointer(
                  absorbing: controller.isLoading.value,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TypesBarSectionX(),
                      CardsBarSectionX(),
                      ColorsBarSectionX(),
                      OrgBarSectionX(),
                      DetailsHisDedicateSectionX(),
                      DonationDataSectionX(),
                      ButtonsSectionX(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
