import 'package:ataa/UI/Animation/animation.dart';
import 'package:ataa/Ui/Widget/Custom/Card/giftCardForGifting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../GeneralState/error.dart';
import '../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/buttons.dart';
import 'Sections/cardsBar.dart';
import 'Sections/colorsBar.dart';
import 'Sections/detailsHisDedicate.dart';
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
        actions: [BasketIconButtonsX()],
      ),
      body: SafeArea(
        child: FutureBuilderX(
          future: controller.getData,
          loading: const LoadingSectionX(),
          child: (data) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: StyleX.vPaddingApp),
            child: Obx(
              () => AbsorbPointer(
                absorbing: controller.isLoading.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: double.infinity),
                    // const GiftCategoriesSectionX(),
                    // GenderSectionX(),
                    // const CardsBarSectionX(),
                    SizedBox(
                        width: 310,
                        child: Center(child: GiftCardForGiftingX())),
                    // const ColorsBarSectionX(),
                    // OrgBarSectionX(),
                    // const DetailsHisDedicateSectionX(),
                    // const DonationDataSectionX(),
                    // const ButtonsSectionX(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
