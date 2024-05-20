part of "../../widget.dart";
class FreeDonationOptionsX extends StatelessWidget {
  const FreeDonationOptionsX({super.key, required this.onSelected,this.isMarginTop=true});
   final Function(int val) onSelected;
   final bool isMarginTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelInputX(
        "Donation Amount",
        marginTop: isMarginTop?20:0,
      ),
      Row(
        children: [
          Flexible(
              child: ButtonX.gray(
                  onTap: () =>onSelected(20),
                  text: "20 ${"SAR".tr}")),
          const SizedBox(width: 10),
          Flexible(
            child: ButtonX.gray(
              onTap: () => onSelected(50),
              text: "50 ${"SAR".tr}",
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: ButtonX.gray(
              onTap: () => onSelected(100),
              text: "100 ${"SAR".tr}",
            ),
          ),
        ],
      ),
    ],);
  }
}
