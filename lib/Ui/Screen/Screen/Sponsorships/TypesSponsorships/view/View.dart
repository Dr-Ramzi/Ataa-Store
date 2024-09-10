import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class TypesSponsorshipsView extends GetView<TypesSponsorshipsController> {
  const TypesSponsorshipsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Sponsorships",
        actions: [BasketIconButtonsX()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp,
          vertical: StyleX.vPaddingApp,
        ),

        /// Options Cards
        child: Column(
          children: [
            OptionWithIconCardX(
              title: "Supporting a new Muslim's Islamization",
              subtitle:
                  "Sponsor the expenses of converting a new person to Islam",
              icon: Icons.person_rounded,
              onTap: controller.onTapNewMuslim,
            ).fadeAnimation200,
            OptionWithIconCardX(
              title: "Sponsoring the education of a new Muslim",
              subtitle:
                  "Sponsor the expenses for teaching a new Muslim the fundamentals of his religion",
              icon: Icons.school_rounded,
              onTap: controller.onTapEducationNewMuslim,
            ).fadeAnimation300,
            OptionWithIconCardX(
              title: "Supporting Quranic education",
              subtitle:
                  "Sponsor the expenses for teaching a new Muslim the Quran",
              icon: Icons.auto_stories_rounded,
              onTap: controller.onTapEducationQuran,
            ).fadeAnimation400,
            OptionWithIconCardX(
              title: "Sponsoring preachers",
              subtitle: "Sponsor the expenses of those who call to God",
              icon: Icons.group_rounded,
              onTap: controller.onTapPreachers,
            ).fadeAnimation500,
          ],
        ),
      ),
    );
  }
}
