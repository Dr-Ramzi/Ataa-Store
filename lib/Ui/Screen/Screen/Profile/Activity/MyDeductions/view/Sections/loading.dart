import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../Config/config.dart';

class LoadingSectionX extends StatelessWidget {
  const LoadingSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            right: StyleX.hPaddingApp,
            left: StyleX.hPaddingApp,
            top: StyleX.vPaddingApp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              ShimmerAnimationX(height: 35, width: 140),
              SizedBox(height: 10),

              /// Description
              ShimmerAnimationX(height: 60),
              SizedBox(height: 10),
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
                  const ShimmerAnimationX(
                    height: 170,
                    margin: EdgeInsets.only(bottom: 10),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
