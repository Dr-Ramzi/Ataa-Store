part of '../../../widget.dart';

class BasketGiftingCardX extends StatelessWidget {
  const BasketGiftingCardX({
    super.key,
    required this.gifting,
    this.priceController,
    required this.onDelete,
    required this.onChangedPrice,
    required this.giftingType,
  });
  final GiftingX gifting;
  final GiftCategoryX giftingType;
  final TextEditingController? priceController;
  final Function(GiftingX gifting) onDelete;
  final Function(GiftingX gifting, String price)
  onChangedPrice;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      isBorder: true,
      child: Row(
        children: [
          ImageNetworkX(
            imageUrl: giftingType.imageUrl,
            height: 55,
            width: 55,
            radius: StyleX.radiusSm,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX(
                  giftingType.name,
                  style: TextStyleX.titleSmall,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: TextFieldX(
                    controller: priceController!,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    hint: "0",
                    validate: ValidateX.money,
                    onChanged: (val) async => await onChangedPrice(
                      gifting, val,
                    ),
                    suffixWidget: TextX(
                      "SAR",
                      style: TextStyleX.titleSmall,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () async => onDelete(gifting),
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
