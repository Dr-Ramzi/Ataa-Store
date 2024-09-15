import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/buttons.dart';
import 'Sections/cardBar.dart';
import 'Sections/colorsBar.dart';
import 'Sections/dataForGift.dart';
import 'Sections/donationData.dart';
import 'Sections/gender.dart';
import 'Sections/loading.dart';
import 'Sections/giftCategories.dart';
import 'Sections/orgBar.dart';

class GiftingView extends GetView<GiftingController> {
  const GiftingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Gifting",
        actions: [CartIconButtonsX()],
      ),
      body: SafeArea(
        child: FutureBuilderX(
          future: controller.getData,
          loading: const LoadingSectionX(),
          child: (data) => Obx(
            () => Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: StyleX.vPaddingApp,
                    ),
                    child: AbsorbPointer(
                      absorbing: controller.isLoading.value || controller.isLoadingForGetGiftCategoryDetails.value,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GiftCategoriesSectionX(),
                          GenderSectionX(),
                          CardBarSectionX(),
                          ColorsBarSectionX(),
                          OrgBarSectionX(),
                          DataForGiftSectionX(),
                          DonationDataSectionX(),
                          ButtonsSectionX(),
                        ],
                      ),
                    ),
                  ),
                ),

                if(controller.isLoadingForGetGiftCategoryDetails.isTrue)
                const Positioned.fill(
                  child: BlurX(
                    blur: 2,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
