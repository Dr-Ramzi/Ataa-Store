part of '../../widget.dart';

class DonationCardX extends StatelessWidget {
  const DonationCardX({
    super.key,
    required this.donation,
    this.isSmallCard = false,
    required this.onDonation,
    required this.onAddToCart,
    required this.doneImageUrl,
  });
  final bool isSmallCard;
  final DonationX donation;
  final String? doneImageUrl;
  final Function(DonationX donation) onDonation;
  final Function(DonationX id) onAddToCart;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      radius: StyleX.radius,
      margin: isSmallCard
          ? const EdgeInsetsDirectional.only(end: 14)
          : const EdgeInsetsDirectional.only(bottom: 14),
      padding: EdgeInsets.zero,
      width: isSmallCard ? StyleX.donationCardWidthSM : double.maxFinite,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RouteNameX.donationDetails, arguments: donation.donationBasic.code);
        },
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      /// Cover Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(StyleX.radius),
                        ),
                        child: ImageNetworkX(
                          height: 170,
                          width: double.maxFinite,
                          imageUrl: donation.donationDetails.imageUrl??'',
                        ),
                      ),

                      if(donation.donationBasic.isDone)
                        Positioned.fill(
                          child: ImageNetworkX(
                            imageUrl: doneImageUrl ?? ImageX.doneDonation,
                            isFile: doneImageUrl == null,
                            empty: const SizedBox(),
                            fit: BoxFit.contain,
                          ).paddingAll(5),
                        ),

                      /// Zakat Marker
                      if (donation.donationSettings.isZakat)
                        Positioned.directional(
                          textDirection: Directionality.of(context),
                          start: 10,
                          top: 12,
                          child: const ZakatDisbursementsCardX(),
                        ),

                      /// Value Share
                      if (donation.donationShares!=null)
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
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: TextX(
                              "${"Value share is".tr} ${donation.donationShares?.price} ${"SAR".tr}",
                              color: Colors.white,
                              style: TextStyleX.supTitleMedium,
                            ),
                          ),
                        ),

                      /// Share Button
                      Positioned.directional(
                        end: 10,
                        top: 10,
                        textDirection: Directionality.of(context),
                        child: InkResponse(
                          onTap: () async =>
                          await shareSheet(donation.shareURL),
                          child: const ContainerX(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Icon(Icons.share_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  /// Content
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Donation Name
                        TextX(
                          donation.donationBasic.name,
                          style: TextStyleX.titleMedium,
                          fontWeight: FontWeight.w700,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Icon(
                              Icons.payments_rounded,
                              color: context.isDarkMode
                                  ? Theme.of(context).primaryColor
                                  : ColorX.primary.shade700,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            TextX(
                              "${"Collected".tr}: ${FunctionX.formatLargeNumber(donation.donationBasic.currentDonations)} ${"SAR".tr}",
                              color: Theme.of(context).colorScheme.secondary,
                            )
                          ],
                        ),
                        const SizedBox(height: 8),

                        /// Completion Indicator Line
                        // if (donation.isShowCompletionIndicator)
                        //   Row(
                        //     children: [
                        //       Expanded(
                        //           child:
                        //           LinearProgressIndicator(
                        //             value:
                        //             donation.currentDonations / donation.totalDonations,
                        //             borderRadius: BorderRadius.circular(50),
                        //             minHeight: 6,
                        //           )
                        //       ),
                        //       const SizedBox(width: 16),
                        //       TextX(
                        //         "${donation.donationProgress.toStringAsFixed(2)} %",
                        //         style: TextStyleX.supTitleLarge,
                        //       )
                        //     ],
                        //   ).marginOnly(top: 2, bottom: 4),

                        /// This space replaces the buttons and the extra 8 pixels are for their margin
                        const SizedBox(
                          height: StyleX.buttonHeight + 8,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              /// Buttons
              Positioned(
                bottom: 8,
                left: 16,
                right: 16,
                child: AddToCartAndDonationButtonsX(
                  disabled: donation.donationBasic.isDone,
                  onDonation: () async => await onDonation(donation),
                  onAddToCart: () async => await onAddToCart(donation),
                  payDonationButtonState: ButtonStateEX.normal,
                  addToCartButtonState: ButtonStateEX.normal,
                  sameSize: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
