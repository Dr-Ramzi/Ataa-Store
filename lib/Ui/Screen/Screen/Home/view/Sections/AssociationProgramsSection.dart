import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Animation/animation.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class AssociationProgramsSectionX extends GetView<HomeController> {
  const AssociationProgramsSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getOrganizations(),
      builder: (context, snapshot) {

        /// If the data is still loading, a flash is displayed in the same shape as the item expected to appear
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  ScrollCardsHorizontallyX(
              height: StyleX.organizationCardHeight,
              title: "Association Programs",
              icon: Icons.hotel_class_rounded,
              cards: [
                for (int i = 0; i < 3; i++)
                   const ShimmerAnimationX(
                    height: StyleX.organizationCardHeight,
                    width: StyleX.organizationCardWidth,
                    margin: EdgeInsetsDirectional.only(end: 14),
                  )
              ]
          );
        }

        /// If there is an error in this section or it is empty, the section does not appear
        if (snapshot.hasError || controller.organizations.isEmpty) {
          return const SizedBox();
        }

        /// When the data has finished loading properly, it is displayed
        return ScrollCardsHorizontallyX(
            height: StyleX.organizationCardHeight,
            title: "Association Programs",
            icon: Icons.hotel_class_rounded,
            cards: [
              ...controller.organizations.map(
                    (org) => OrganizationCardX(
                  org: org,
                  onTap: controller.onTapOrganization,
                ).fadeAnimation300,
              ),
            ]
        );
      },
    );
  }
}
