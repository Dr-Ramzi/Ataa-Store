part of '../../../widget.dart';

class BasketGuaranteeCardX extends StatelessWidget {
  const BasketGuaranteeCardX({
    super.key,
    required this.guarantee,
    required this.onDelete,
  });
  final GuaranteeX guarantee;
  final Function(GuaranteeX basketItem) onDelete;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      isBorder: true,
      child: Row(
        children: [
          ContainerX(
            color: Theme.of(context).colorScheme.onPrimary,
            radius: StyleX.radiusSm,
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 55,
            width: 55,
            child: Center(
              child: Icon(
                Icons.person_rounded,
                size: 30,
                color: ColorX.primary,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (guarantee.muslimNum != null)
                  TextX(
                    "${"Muslim".tr} ${guarantee.muslimNum!}",
                    style: TextStyleX.titleSmall,
                    fontWeight: FontWeight.w700,
                  ),
                if (guarantee.muslimNum == null)
                  TextX(
                    "Prayers for Islam",
                    style: TextStyleX.titleSmall,
                    fontWeight: FontWeight.w700,
                  ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: TextX(
                    "${FunctionX.formatLargeNumber(guarantee.donationAmount)} ${"SAR".tr}",
                    style: TextStyleX.titleSmall,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () async => onDelete(guarantee),
            icon: Icon(
              Icons.delete_rounded,
              color: ColorX.danger.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
