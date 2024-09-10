import 'package:flutter/material.dart';
import '../../../../../../../../Config/config.dart';
import '../../../../../../../Animation/animation.dart';

class LoadingSectionX extends StatelessWidget {
  const LoadingSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              bottom: 16,
              right: StyleX.hPaddingApp,
              left: StyleX.hPaddingApp,
              top: StyleX.vPaddingApp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              const ShimmerAnimationX(height: 30, width: 200),
              const SizedBox(height: 16),

              /// Description
              const ShimmerAnimationX(height: 25),
              const SizedBox(height: 16),

              /// Create Button
              ShimmerAnimationShapeX.button(),
            ],
          ),
        ),

        /// Cards
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 30,
              left: StyleX.hPaddingApp,
              right: StyleX.hPaddingApp,
            ),
            child: Column(
              children: [
                for (int i = 0; i < 5; i++)
                  ShimmerAnimationShapeX.donationCard()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
