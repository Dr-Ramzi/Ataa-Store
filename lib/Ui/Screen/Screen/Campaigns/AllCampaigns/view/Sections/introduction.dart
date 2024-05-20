import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';

class IntroductionSectionX extends StatelessWidget {
  const IntroductionSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: StyleX.hPaddingApp,
        left: StyleX.hPaddingApp,
        top: StyleX.vPaddingApp,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextX(
            "User Campaigns",
            style: TextStyleX.headerSmall,
            color: Theme.of(context).primaryColor,
          ).fadeAnimation200,
          const SizedBox(height: 6),
          TextX(
            "Create your own campaign to support one of our projects, and share it with others to contribute to the advocacy.",
            style: TextStyleX.supTitleLarge,
            maxLines: 4,
          ).fadeAnimation200,
        ],
      ),
    );
  }
}
