import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class DynamicOptionsSectionX extends GetView<MoreSectionsController> {
  const DynamicOptionsSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ScrollRefreshLoadMoreX(
            padding: const EdgeInsets.only(
              right: StyleX.hPaddingApp,
              left: StyleX.hPaddingApp,
              top: StyleX.vPaddingApp,
              bottom: StyleX.vPaddingApp+33,
            ),
            emptyMessage: 'There are no more pages currently.',
            fetchData: controller.getData,
            itemBuilder: (page, index) {
              return MoreCardX(
                  title: page.title,
                  onTap: ()=> controller.onDynamicPage(page),
              ).fadeAnimation200;
            },
          ),
        ),
      ],
    );
  }
}