part of '../../../widget.dart';

class BasketProductCardX extends StatelessWidget {
  const BasketProductCardX({
    super.key,
    required this.product,
    required this.onDelete,
    required this.productItem,
    required this.onChangedNum,
  });
  final OrderProductX productItem;
  final ProductX product;
  final Function(OrderProductX basketItem) onDelete;
  final Function(OrderProductX basketItem, int newNum) onChangedNum;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      isBorder: true,
      child: Row(
        children: [
          ImageNetworkX(
            imageUrl: product.imageURL.first,
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
                  product.name,
                  style: TextStyleX.titleSmall,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Row(
                    children: [
                      Flexible(
                        child: NumberFieldX(
                          value: productItem.numProduct,
                          min: 1,
                          max: product.numOfStore.toDouble(),
                          onChanged: (val) async => await onChangedNum(
                            productItem,
                            val.toInt(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextX(
                        "${FunctionX.formatLargeNumber(product.price * productItem.numProduct)} ${"SAR".tr}",
                        style: TextStyleX.supTitleLarge,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20
          ),
          IconButton(
            onPressed: () async => onDelete(productItem),
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
