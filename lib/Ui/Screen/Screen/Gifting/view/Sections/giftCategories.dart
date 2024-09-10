import 'package:ataa/UI/Animation/animation.dart';
import 'package:ataa/Ui/Widget/Basic/Other/scrollRefreshLoadMore.dart';
import 'package:ataa/Ui/Widget/Custom/Card/giftCategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class GiftCategoriesSectionX extends StatelessWidget {
  const GiftCategoriesSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GiftingController>(
      builder: (controller) => ScrollRefreshLoadMoreX(
        fetchData: controller.getGiftCategories,
        firstFixedData: controller.giftCategories,
        initPage: 2,
        isShowFixedDataAsInitLoading: true,
        scrollDirection: Axis.horizontal,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp,
        ),
        spaceBetweenHeaderAndContent: 10,
        header: Row(
          children: [
            const TextX(
              "Type of gift",
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
            ).fadeAnimation200,
          ],
        ),
        itemBuilder: (data, index) => GiftCategoryCardX(
          giftCategory: data,
          onTap: () => controller.onChangeType(index),
          isSelected: controller.typeSelectedIndex.value == index,
        ).fadeAnimation200,
      ),
    );
  }
}
