import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/cupertino.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Type of gift Title
          const ShimmerAnimationX(height: 30, width: 120),
          const SizedBox(height: 10),

          /// Type of gifts
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  const ShimmerAnimationX(
                    width: 110,
                    height: 140,
                    margin: EdgeInsetsDirectional.only(end: 8),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          /// Gift Card Title
          const ShimmerAnimationX(height: 30, width: 100),
          const SizedBox(height: 10),

          /// Gift Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  const ShimmerAnimationX(
                    height: 240,
                    width: 150,
                    margin: EdgeInsetsDirectional.only(end: 8),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          /// Color Title
          const ShimmerAnimationX(height: 30, width: 170),
          const SizedBox(height: 10),
            /// Colors
            Row(
              children: [
                for (int i = 0; i < 7; i++)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const ShimmerAnimationX(
                      height: 43,
                      width: 43,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 20),

          /// Donation Field Title
          const ShimmerAnimationX(height: 30, width: 180),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  const ShimmerAnimationX(
                    height: 120,
                    width: 160,
                    margin: EdgeInsetsDirectional.only(end: 8),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
