part of '../../../widget.dart';

class CartDonationCardX extends StatefulWidget {
  const CartDonationCardX({
    super.key,
    required this.onDelete,
    required this.cartItem,
    required this.onUpdate,
  });
  final CartItemX cartItem;
  final Function(CartItemX item) onDelete;
  final Function(
    CartItemX item, {
    String? price,
    int? quantity,
    int? sharesQuantity,
    String? donationSharesPackageId,
    String? donationOpenPackageId,
    String? donationDeductionPackageId,
  }) onUpdate;

  @override
  State<CartDonationCardX> createState() => _CartDonationCardXState();
}

class _CartDonationCardXState extends State<CartDonationCardX> {
  bool isLoadingUpdate = false;
  bool isLoadingDelete = false;
  late DonationOrderX donationOrder;
  late CartItemX cartItem;
  TextEditingController priceController = TextEditingController();
  late int sharesQuantity;
  String? donationSharesPackageId;
  String? donationOpenPackageId;
  String? donationDeductionPackageId;
  Timer? _debounceTimer;
  final Duration _debounceTimerDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    cartItem = widget.cartItem;
    donationOrder = cartItem.order as DonationOrderX;
    priceController.text = cartItem.price.toString();
    sharesQuantity = donationOrder.donationData.sharesQuantity ?? 1;
    donationSharesPackageId =
        donationOrder.donationData.donationSharesPackageId;
    donationOpenPackageId = donationOrder.donationData.donationOpenPackageId;
    donationDeductionPackageId =
        donationOrder.donationData.donationDeductionPackageId;
  }

  @override
  void didUpdateWidget(covariant CartDonationCardX oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cartItem != widget.cartItem) {
      setState(() {
        cartItem = widget.cartItem;
        donationOrder = cartItem.order as DonationOrderX;
        priceController =
            TextEditingController(text: cartItem.price.toString());
        sharesQuantity = donationOrder.donationData.sharesQuantity ?? 1;
        donationSharesPackageId =
            donationOrder.donationData.donationSharesPackageId;
        donationOpenPackageId =
            donationOrder.donationData.donationOpenPackageId;
        donationDeductionPackageId =
            donationOrder.donationData.donationDeductionPackageId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoadingUpdate || isLoadingDelete,
      child: ContainerX(
        color: Theme.of(context).cardColor,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 18),
        isBorder: true,
        child: Column(
          children: [
            Row(
              children: [
                /// Image
                ImageNetworkX(
                  imageUrl: cartItem.imageUrl ?? '',
                  height: 50,
                  width: 50,
                  radius: StyleX.radiusSm,
                ).marginSymmetric(horizontal: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        cartItem.name,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 9),
                      Column(
                        children: [
                          /// Shares
                          if (donationOrder.donationData.donationType ==
                              ModelDonationDataTypeStatusX.shares)
                            Row(
                              children: [
                                Flexible(
                                  child: FittedBox(
                                    child: SizedBox(
                                      width: 130,
                                      child: NumberFieldX(
                                        value: sharesQuantity,
                                        min: 1,
                                        color: Theme.of(context).cardColor,
                                        onChanged: (val) {
                                          setState(() {
                                            sharesQuantity = val.toInt();
                                          });
                                          if (_debounceTimer?.isActive ?? false) {
                                            _debounceTimer!.cancel();
                                          }

                                          _debounceTimer = Timer(
                                              _debounceTimerDuration, () async {
                                            setState(() {
                                              isLoadingUpdate = true;
                                            });
                                            try {
                                              await widget.onUpdate(
                                                cartItem,
                                                price: ((donationOrder
                                                            .donationShares!
                                                            .price) *
                                                        (sharesQuantity))
                                                    .toString(),
                                                sharesQuantity: val.toInt(),
                                                donationSharesPackageId:
                                                    donationSharesPackageId,
                                                donationOpenPackageId:
                                                    donationOpenPackageId,
                                                donationDeductionPackageId:
                                                    donationDeductionPackageId,
                                              );
                                            } catch (_) {}
                                            setState(() {
                                              isLoadingUpdate = false;
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Row(
                                  children: [
                                    TextX(
                                      FunctionX.formatLargeNumber(
                                          (donationOrder
                                                  .donationShares!.price) *
                                              (sharesQuantity)),
                                      fontWeight: FontWeight.w700,
                                      overflow: null,
                                      maxLines: 1,
                                    ),
                                    TextX(
                                      ' ${"SAR".tr}',
                                      style: TextStyleX.titleSmall,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if (donationOrder.donationData.donationType !=
                              ModelDonationDataTypeStatusX.shares)
                            SizedBox(
                              width: 180,
                              child: Opacity(
                                opacity:
                                    donationOrder.isCanEditAmount ? 0.5 : 1,
                                child: TextFieldX(
                                  controller: priceController,
                                  onlyRead: donationOrder.isCanEditAmount,
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  hint: "0",
                                  borderColor: context.isDarkMode
                                      ? null
                                      : ColorX.grey.shade300,
                                  color: Theme.of(context).cardColor,
                                  validate: ValidateX.money,
                                  onChanged: (val) {
                                    if (_debounceTimer?.isActive ?? false) {
                                      _debounceTimer!.cancel();
                                    }
                                    _debounceTimer = Timer(
                                        _debounceTimerDuration, () async {
                                      setState(() {
                                        isLoadingUpdate = true;
                                      });
                                      try {
                                        await widget.onUpdate(
                                          cartItem,
                                          price: val,
                                          sharesQuantity: sharesQuantity,
                                          donationSharesPackageId:
                                              donationSharesPackageId,
                                          donationOpenPackageId:
                                              donationOpenPackageId,
                                          donationDeductionPackageId:
                                              donationDeductionPackageId,
                                        );
                                      } catch (_) {}
                                      setState(() {
                                        isLoadingUpdate = false;
                                      });
                                    });
                                  },
                                  suffixWidget: TextX(
                                    "SAR",
                                    style: TextStyleX.titleSmall,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      isLoadingDelete = true;
                    });
                    try {
                      await widget.onDelete(cartItem);
                    } catch (_) {}
                    setState(() {
                      isLoadingDelete = false;
                    });
                  },
                  icon: const Icon(
                    Icons.delete_rounded,
                  ),
                ).marginSymmetric(horizontal: 6),
              ],
            ),
            if (donationOrder.donationData.isPackagesEnabled)
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 18, left: 18),
                child: Row(
                  children: [
                    TextX(
                      donationOrder.donationData.donationDeductionPackageId ==
                              null
                          ? "Package type"
                          : "Type of deduction",
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(width: 16),
                    if (donationOpenPackageId != null &&
                        donationOrder.openPackages.isNotEmpty)
                      Flexible(
                        child: DropdownX<String>(
                          value: donationOpenPackageId,
                          list: donationOrder.openPackages
                              .map((e) => e.id)
                              .toList(),
                          valueShow: (id) => donationOrder.openPackages
                              .firstWhere((x) => x.id == id)
                              .name,
                          onChanged: (id) async {
                            if (donationOpenPackageId != id) {
                              setState(() {
                                donationOpenPackageId = id;
                                priceController.text = donationOrder
                                    .openPackages
                                    .firstWhere((x) => x.id == id)
                                    .price
                                    .toString();
                                isLoadingUpdate = true;
                              });
                              try {
                                await widget.onUpdate(
                                  cartItem,
                                  price: priceController.text,
                                  sharesQuantity: sharesQuantity,
                                  donationSharesPackageId:
                                      donationSharesPackageId,
                                  donationOpenPackageId: donationOpenPackageId,
                                  donationDeductionPackageId:
                                      donationDeductionPackageId,
                                );
                              } catch (_) {}
                              setState(() {
                                isLoadingUpdate = false;
                              });
                            }
                          },
                        ),
                      )
                    else if (donationSharesPackageId != null &&
                        donationOrder.sharesPackages.isNotEmpty)
                      Flexible(
                        child: DropdownX<String>(
                          value: donationSharesPackageId,
                          list: donationOrder.sharesPackages
                              .map((e) => e.id)
                              .toList(),
                          valueShow: (id) => donationOrder.sharesPackages
                              .firstWhere((x) => x.id == id)
                              .name,
                          onChanged: (id) async {
                            if (donationSharesPackageId != id) {
                              setState(() {
                                donationSharesPackageId = id;
                                sharesQuantity = donationOrder.sharesPackages
                                    .firstWhere((x) => x.id == id)
                                    .sharesCount;
                                isLoadingUpdate = true;
                              });
                              try {
                                await widget.onUpdate(
                                  cartItem,
                                  price:
                                      ((donationOrder.donationShares!.price) *
                                              (sharesQuantity))
                                          .toString(),
                                  sharesQuantity: sharesQuantity,
                                  donationSharesPackageId: id,
                                  donationOpenPackageId: donationOpenPackageId,
                                  donationDeductionPackageId:
                                      donationDeductionPackageId,
                                );
                              } catch (_) {}
                              setState(() {
                                isLoadingUpdate = false;
                              });
                            }
                          },
                        ),
                      )
                    else if (donationDeductionPackageId != null &&
                        donationOrder.donationDeductionPackages.isNotEmpty)
                      Flexible(
                        child: DropdownX(
                          value: donationDeductionPackageId,
                          list: donationOrder.donationDeductionPackages
                              .map((e) => e.id)
                              .toList(),
                          valueShow: (id) => donationOrder
                              .donationDeductionPackages
                              .firstWhere((x) => x.id == id)
                              .name,
                          onChanged: (id) async {
                            if (donationDeductionPackageId != id) {
                              setState(() {
                                donationDeductionPackageId = id;
                                priceController.text = donationOrder
                                    .donationDeductionPackages
                                    .firstWhere((x) => x.id == id)
                                    .price
                                    .toString();
                                isLoadingUpdate = true;
                              });
                              try {
                                await widget.onUpdate(
                                  cartItem,
                                  price: priceController.text,
                                  sharesQuantity: sharesQuantity,
                                  donationSharesPackageId:
                                      donationSharesPackageId,
                                  donationOpenPackageId: donationOpenPackageId,
                                  donationDeductionPackageId:
                                      donationDeductionPackageId,
                                );
                              } catch (_) {}
                              setState(() {
                                isLoadingUpdate = false;
                              });
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
            if (isLoadingUpdate || isLoadingDelete)
              Row(
                children: [
                  TextX(
                    isLoadingUpdate ? 'Updating now' : 'Deleting now',
                    color: isLoadingDelete
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: isLoadingDelete
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              )
                  .paddingOnly(top: 10)
                  .marginSymmetric(horizontal: 18)
                  .sizeAnimation200,
          ],
        ),
      ),
    );
  }
}
