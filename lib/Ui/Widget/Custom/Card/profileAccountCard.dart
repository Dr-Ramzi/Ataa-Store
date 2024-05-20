part of '../../widget.dart';

class ProfileAccountCardX extends StatelessWidget {
  const ProfileAccountCardX({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -25,
          right: 0,
          left: 0,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: ColorX.primary,
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(StyleX.radiusAppBar),
              ),
            ),
          ),
        ),
        ContainerX(
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
          child: Column(children: children),
        ).fadeAnimation200,
      ],
    );
  }
}
