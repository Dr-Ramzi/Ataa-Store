import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/empty.dart';
import '../../../../../GeneralState/error.dart';
import 'Sections/introduction.dart';
import 'Sections/loading.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class AllCampaignsView extends GetView<AllCampaignsController> {
  const AllCampaignsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "User Campaigns",
        actions: [CartIconButtonsX()],
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
              child: Column(
                children: [
                  /// Info
                  const IntroductionSectionX(),

                  /// Create campaign button
                  ButtonX(
                    marginHorizontal: StyleX.hPaddingApp,
                    text: "Create your own campaign",
                    iconData: IconX.speakerPhone,
                    onTap: controller.createCampaign,
                  ).fadeAnimation200,

                  /// Empty State
                  if (controller.campaigns.isEmpty)
                    const EmptyView(
                      message: "There are no current campaigns",
                    ).marginOnly(top: 6),

                  /// Search Bar
                  if (controller.campaigns.isNotEmpty)
                    SearchBarX(
                      search: controller.search,
                      onTapFilter: controller.onFilter,
                      onSearching: controller.onSearching,
                    ).fadeAnimation300,

                  /// Cards
                  if (controller.campaigns.isNotEmpty)
                    Obx(
                      () {
                        /// if Empty Campaigns on Search
                        if (controller.campaignsResult.isEmpty) {
                          return const EmptyView(
                            message:
                                "There are no search results.\nTry searching for something else",
                          );
                        } else {
                          /// Campaigns Result
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: StyleX.vPaddingApp,
                              left: StyleX.hPaddingApp,
                              right: StyleX.hPaddingApp,
                            ),
                            itemCount: controller.campaignsResult.length,
                            itemBuilder: (context, index) => CampaignCardX(
                              campaign: controller.campaignsResult[index],
                              onAddToCart: controller.onAddToCart,
                              onTap: controller.onTapCampaign,
                              onDonation: controller.onCampaignDonation,
                            ).fadeAnimation400,
                          );
                        }
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
