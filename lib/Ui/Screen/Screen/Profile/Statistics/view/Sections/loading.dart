import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Config/config.dart';

class LoadingSectionX extends StatelessWidget {
  const LoadingSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleX.hPaddingApp,
        vertical: StyleX.vPaddingApp,
      ),

      /// Cards
      child: Column(
        children: [
          for (int i = 0; i < 6; i++)
            const ShimmerAnimationX(
              height: 120,
              margin: EdgeInsets.only(bottom: 16),
            )
        ],
      ),
    );
  }
}
