import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../Config/config.dart';
import '../../../../../../../../UI/Widget/widget.dart';

class HeaderSectionX extends StatelessWidget {
  const HeaderSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: StyleX.hPaddingApp,
        left: StyleX.hPaddingApp,
        top: StyleX.vPaddingApp,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          TextX(
            "Donation campaigns",
            style: TextStyleX.headerSmall,
            color: Theme.of(context).primaryColor,
          ).fadeAnimation200,
          const SizedBox(height: 6),

          /// Description
          TextX(
            "All donation campaigns created by you",
            style: TextStyleX.supTitleLarge,
            maxLines: 4,
          ).fadeAnimation200,
        ],
      ),
    );
  }
}
