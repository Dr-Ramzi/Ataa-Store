part of "../../widget.dart";

class HomeAppBarLeadingX extends StatelessWidget {
  const HomeAppBarLeadingX({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextX(
            "${"Welcome".tr} 👋",
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          TextX(
            "Contribute to spreading goodness",
            style: TextStyleX.supTitleLarge,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
