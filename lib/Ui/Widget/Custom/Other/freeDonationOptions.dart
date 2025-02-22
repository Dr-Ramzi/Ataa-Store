part of "../../widget.dart";

class FreeDonationOptionsX extends StatelessWidget {
  const FreeDonationOptionsX({
    super.key,
    required this.onSelected,
    this.isMarginTop = true,
    required this.selected,
    this.title = "Donation Amount",
  });
  final Function(int val) onSelected;
  final String title;
  final bool isMarginTop;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelInputX(
          title,
          marginTop: isMarginTop ? 20 : 0,
        ),
        Row(
          children: [
            Flexible(
              child: selected == 20
                  ? ButtonX(
                      onTap: () => onSelected(20),
                      text: "20 ${"SAR".tr}",
                    )
                  : ButtonX.gray(
                      onTap: () => onSelected(20),
                      text: "20 ${"SAR".tr}",
                      colorText: Theme.of(context).iconTheme.color,
                    ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: selected == 50
                  ? ButtonX(
                      onTap: () => onSelected(50),
                      text: "50 ${"SAR".tr}",
                    )
                  : ButtonX.gray(
                      onTap: () => onSelected(50),
                      text: "50 ${"SAR".tr}",
                      colorText: Theme.of(context).iconTheme.color,
                    ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: selected == 100
                  ? ButtonX(
                      onTap: () => onSelected(100),
                      text: "100 ${"SAR".tr}",
                    )
                  : ButtonX.gray(
                      onTap: () => onSelected(100),
                      text: "100 ${"SAR".tr}",
                      colorText: Theme.of(context).iconTheme.color,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
