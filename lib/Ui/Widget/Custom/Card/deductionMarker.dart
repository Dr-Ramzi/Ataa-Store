part of "../../widget.dart";

class DeductionMarkerCardX extends StatelessWidget {
  const DeductionMarkerCardX({super.key, required this.deduction});
  final String deduction;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: context.isDarkMode?ColorX.primary.shade100:ColorX.primary.shade50,
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 5,
      ),
      child: Row(
        children: [
          Icon(
            Icons.date_range_rounded,
            size: 20,
            color: ColorX.primary,
          ),
          const SizedBox(width: 4),
          TextX(
            deduction,
            color: ColorX.primary,
            style: TextStyleX.supTitleLarge,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
