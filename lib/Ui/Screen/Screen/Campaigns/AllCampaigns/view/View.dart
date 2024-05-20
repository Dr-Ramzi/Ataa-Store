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
    return  Scaffold(
      appBar: AppBarX(title: "User Campaigns",actions: [BasketIconButtonsX()],),
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
            return Column(
              children: [
                const IntroductionSectionX(),
                ButtonX(
                  marginHorizontal: StyleX.hPaddingApp,
                    text: "Create your own campaign",
                    iconData: Icons.campaign_rounded,
                    onTap: controller.createCampaign,
                ).fadeAnimation200,
                SearchBarX(
                  search: controller.search,
                  onTapFilter: controller.onFilter,
                  onSearching: controller.onSearching,
                ).fadeAnimation300,
                Expanded(
                  child: Obx(
                        () {
                      /// if Empty Donation on Search
                      if (controller.campaignsResult.isEmpty) {
                        return const EmptyView(
                          message:
                          "There are no search results.\nTry searching for something else",
                        );
                      } else {
                        /// Donation Result
                        return ListView.builder(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 30,
                            left: StyleX.hPaddingApp,
                            right: StyleX.hPaddingApp,
                          ),
                          itemCount: controller.campaignsResult.length,
                          itemBuilder: (context, index) =>
                          CampaignCardX(
                            campaign: controller.campaignsResult[index],
                            onAddToCart: controller.onAddToCart,
                            onTap: controller.onTapCampaign,
                            onDonation: controller.onCampaignDonation,
                          ).fadeAnimation400,
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
