part of '../../../widget.dart';

class CartDonationCardX extends StatelessWidget {
  const CartDonationCardX({
    super.key,
    required this.donation,
    this.priceController,
    required this.onDelete,
    required this.basketItem,
    required this.onChangedPrice,
    required this.onChangedNumStock,
    required this.onChangedPackage,
  });
  final DonationRecordX basketItem;
  final DonationX donation;
  final TextEditingController? priceController;
  final Function(DonationRecordX basketItem) onDelete;
  final Function(DonationRecordX basketItem, String price)
  onChangedPrice;
  final Function(DonationRecordX basketItem, int newNumStock)
      onChangedNumStock;
  final Function(DonationRecordX basketItem, String newPackage)
      onChangedPackage;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      isBorder: true,
      child: Column(
        children: [
          Row(
            children: [
              ImageNetworkX(
                imageUrl: donation.imageURL,
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
                      donation.name,
                      style: TextStyleX.titleSmall,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 250),
                      child: Column(
                        children: [
                          if (basketItem.numStock != null)
                            Row(
                              children: [
                                Flexible(
                                  child:
                                  NumberFieldX(
                                    value: basketItem.numStock!,
                                    min: 1,
                                    onChanged: (val) async => await onChangedNumStock(
                                      basketItem, val.toInt(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                TextX(
                                  "${FunctionX.formatLargeNumber((donation.donationShares.price)*(basketItem.numStock??0))} ${"SAR".tr}",
                                  style: TextStyleX.supTitleLarge,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          if (basketItem.donationAmount != null)
                            TextFieldX(
                              controller: priceController!,
                              textInputType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              hint: "0",
                              validate: ValidateX.money,
                              onChanged: (val) async => await onChangedPrice(
                                  basketItem, val,
                              ),
                              suffixWidget: TextX(
                                "SAR",
                                style: TextStyleX.titleSmall,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () async => onDelete(basketItem),
                icon: Icon(
                  Icons.delete_rounded,
                  color: ColorX.danger.shade400,
                ),
              ),
            ],
          ),
          if (basketItem.package != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                   TextX("Package type",style: TextStyleX.titleSmall,fontWeight: FontWeight.w500,),
                  const SizedBox(width: 16),
                  Flexible(
                    child: DropdownX(
                      value: basketItem.package,
                      list: donation.openPackages,
                      onChanged: (dynamic val) async =>
                      await onChangedPackage(
                        basketItem,
                        val,
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
