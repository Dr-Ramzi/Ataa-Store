part of '../../widget.dart';

class CharitableProjectCardX extends StatelessWidget {
  const CharitableProjectCardX(
      {super.key,
      this.stockValue,
      this.deduction,
      this.isZakat = false,
      this.onAddToCart,
      required this.obj,
      this.totalDonations,
      this.isSmallCard = false,
      required this.onTap,
      required this.onDonation,
      });
  final bool isSmallCard;
  final int? stockValue;
  final int? totalDonations;
  final String? deduction;
  final bool isZakat;
  final Function(String id) onTap;
  final Function(CharitableProjectX obj) onDonation;
  final Function(CharitableProjectX id)? onAddToCart;
  final CharitableProjectX obj;
  
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      radius: StyleX.radius,
      margin: isSmallCard
          ? const EdgeInsetsDirectional.only(end: 14)
          : const EdgeInsetsDirectional.only(bottom: 14),
      padding: EdgeInsets.zero,
      height: deduction!=null?StyleX.deductionCardHeight:StyleX.charitableProjectCardHeight,
      width: isSmallCard ? StyleX.charitableProjectCardWidthSM : double.maxFinite,
      child: GestureDetector(
        onTap: () async => await onTap(obj.id),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(
                        StyleX.radius,
                      ),
                    ),
                    child: ImageNetworkX(
                      height: 170,
                      width: double.maxFinite,
                      imageUrl: obj.imageURL[0],
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    end: 10,
                    top: 10,
                    child: InkResponse(
                      onTap: () {
                        shareSheet(obj.shareURL);
                      },
                      child: const ContainerX(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Icon(
                          Icons.share_rounded,
                        ),
                      ),
                    ),
                  ),
                  if (isZakat && deduction == null)
                    Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: 10,
                        top: 12,
                        child: const ZakatDisbursementsCardX()),
                  if (deduction != null)
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 10,
                      top: 12,
                      child: DeductionMarkerCardX(deduction: deduction!)
                    ),
                  if (stockValue != null)
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 0,
                      bottom: 0,
                      child: Container(
                          decoration: BoxDecoration(
                            color: ColorX.primary,
                            borderRadius: const BorderRadiusDirectional.only(
                              topEnd: Radius.circular(StyleX.radiusMd),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: TextX(
                            "${"Value share is".tr} $stockValue ${"SAR".tr}",
                            color: Colors.white,
                            style: TextStyleX.supTitleMedium,
                          )),
                    ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    TextX(
                      obj.name,
                      style: TextStyleX.titleMedium,
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                    ),
                    if (totalDonations != null)
                      const SizedBox(
                        height: 6,
                      ),
                    if (totalDonations != null)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: TextX(
                                  "${FunctionX.formatLargeNumber(obj.currentDonations)} ${"SAR was collected".tr}",
                                  style: TextStyleX.supTitleMedium,
                                  maxLines: 1,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: TextX(
                                  "${FunctionX.formatLargeNumber(totalDonations! - obj.currentDonations)} ${"SAR remaining".tr}",
                                  style: TextStyleX.supTitleMedium,
                                  maxLines: 1,
                                  color: context.isDarkMode
                                      ? ColorX.grey.shade400
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          LinearProgressIndicator(
                            value: obj.currentDonations / totalDonations!,
                            borderRadius: BorderRadius.circular(50),
                            minHeight: 6,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    AddToCartAndDonationButtonsX(
                        onDonation: () async => await onDonation(obj),
                        onAddToCart: onAddToCart != null
                            ? () async => await onAddToCart!(obj)
                            : null,
                        isSubscribe: deduction != null,
                        sameSize: false,
                        payDonationButtonState: ButtonStateEX.normal,
                        addToCartButtonState: ButtonStateEX.normal,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
