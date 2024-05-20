import 'package:flutter/material.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Animation/animation.dart';
import '../../../../../../Widget/widget.dart';

class LoadingSectionX extends StatelessWidget {
  const LoadingSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleX.hPaddingApp,
        vertical: StyleX.vPaddingApp,
      ),

      /// Card
      child: ContainerX(
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            /// Program
            ShimmerAnimationShapeX.labelInput(),
            ShimmerAnimationShapeX.filedInput(),
            const SizedBox(height: 10),

            /// Project
            ShimmerAnimationShapeX.labelInput(),
            ShimmerAnimationShapeX.filedInput(),
            const SizedBox(height: 10),

            /// Title
            ShimmerAnimationShapeX.labelInput(),
            ShimmerAnimationShapeX.filedInput(),
            const SizedBox(height: 10),

            /// Date
            ShimmerAnimationShapeX.labelInput(),
            ShimmerAnimationShapeX.filedInput(),
            const SizedBox(height: 10),

            /// Donation method
            ShimmerAnimationShapeX.labelInput(),
            Row(
              children: [
                Flexible(child: ShimmerAnimationShapeX.filedInput()),
                const SizedBox(width: 8),
                Flexible(child: ShimmerAnimationShapeX.filedInput()),
              ],
            ),
            const SizedBox(height: 10),

            /// Target amount
            ShimmerAnimationShapeX.labelInput(),
            ShimmerAnimationShapeX.filedInput(),
            const SizedBox(height: 10),

            /// Agree to the terms
            const ShimmerAnimationX(height: 70),
            const SizedBox(height: 10),

            /// Button
            ShimmerAnimationShapeX.button(),
          ],
        ),
      ),
    );
  }
}
