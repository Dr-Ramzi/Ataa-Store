import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../GeneralState/empty.dart';
import '../../../../../../GeneralState/error.dart';
import '../../../../../../Widget/widget.dart';
import 'Sections/header.dart';
import 'Sections/loading.dart';
import '../controller/Controller.dart';

class MyCampaignsView extends GetView<MyCampaignsController> {
  const MyCampaignsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Donation campaigns",
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title & Description
                const HeaderSectionX(),

                /// Empty State
                if (controller.campaigns.isEmpty)
                  const EmptyView(
                    message: "You haven't created any campaign yet",
                  ).paddingOnly(top: 30),

                /// Create Button
                ButtonX(
                  marginHorizontal: StyleX.hPaddingApp,
                  text: "Create a new campaign",
                  onTap: controller.createCampaign,
                ).fadeAnimation200,
                const SizedBox(height: 8),

                /// My Campaigns
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      left: StyleX.hPaddingApp,
                      right: StyleX.hPaddingApp,
                    ),
                    itemCount: controller.campaigns.length,
                    itemBuilder: (context, index) => CampaignCardX(
                      isPreview: true,
                      campaign: controller.campaigns[index],
                      onTap: controller.onTapCampaign,
                    ).fadeAnimation400,
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
