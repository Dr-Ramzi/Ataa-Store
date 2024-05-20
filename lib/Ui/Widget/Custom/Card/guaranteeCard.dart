part of '../../widget.dart';

class GuaranteeCardX extends StatelessWidget {
  const GuaranteeCardX({
    super.key,
    required this.guarantee,
    required this.onAddToCart,
    required this.onDonation,
    this.payDonationButtonState = ButtonStateEX.normal,
    this.addToCartButtonState = ButtonStateEX.normal,
  });
  final GuaranteeX guarantee;
  final Function(GuaranteeX guarantee) onDonation;
  final Function(GuaranteeX guarantee) onAddToCart;
  final ButtonStateEX payDonationButtonState;
  final ButtonStateEX addToCartButtonState;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      radius: StyleX.radius,
      margin: const EdgeInsetsDirectional.only(bottom: 14),
      width: double.maxFinite,
      // height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Cover
          ContainerX(
            color: Theme.of(context).colorScheme.onPrimary,
            height: 75,
            width: double.maxFinite,
            child: Center(
              child: Icon(
                Icons.person_rounded,
                size: 40,
                color: ColorX.primary,
              ),
            ),
          ),
          const SizedBox(height: 22),

          /// Muslim Num & Country
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (guarantee.muslimNum != null)
                TextX(
                  "${"Muslim".tr} ${guarantee.muslimNum!}",
                  style: TextStyleX.titleLarge,
                  fontWeight: FontWeight.w700,
                ),
              if (guarantee.muslimNum == null)
                TextX(
                  "Prayers for Islam",
                  style: TextStyleX.titleLarge,
                  fontWeight: FontWeight.w700,
                ),
              Row(
                children: [
                  TextX(
                    guarantee.country,
                    style: TextStyleX.titleSmall,
                  ),
                  const SizedBox(width: 8),
                  CountryFlag.fromCountryCode(
                    guarantee.countryFlagCode.toUpperCase(),
                    width: 30,
                    height: 30,
                    borderRadius: 6,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          /// Course Name
          if (guarantee.courseName != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX("Course name", style: TextStyleX.supTitleMedium,),
                const SizedBox(height: 6),
                TextX(
                  guarantee.courseName!,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                ),
              ],
            ),
          const SizedBox(height: 12),

          /// Previous Religion & Gender & Language
          Row(
            children: [
              if (guarantee.previousReligion != null)
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX("Previous religion",
                          style: TextStyleX.supTitleMedium),
                      const SizedBox(height: 6),
                      TextX(
                        guarantee.previousReligion!,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: guarantee.previousReligion != null?CrossAxisAlignment.center:CrossAxisAlignment.start,
                  children: [
                    TextX("Gender", style: TextStyleX.supTitleMedium),
                    const SizedBox(height: 6),
                    TextX(
                      guarantee.gender,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: guarantee.previousReligion != null?CrossAxisAlignment.center:CrossAxisAlignment.start,
                  children: [
                    TextX("Language", style: TextStyleX.supTitleMedium),
                    const SizedBox(height: 6),
                    TextX(
                      guarantee.language,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          /// Donation Amount & Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    TextX(
                      FunctionX.formatLargeNumber(guarantee.donationAmount)
                          .toString(),
                      style: TextStyleX.titleLarge,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(width: 6),
                    const TextX(
                      "SAR",
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  ButtonStateX(
                    maxWidth: 150,
                    text: "Donate Now",
                    state: payDonationButtonState,
                    iconData: Icons.payments_rounded,
                    onTap: () async => await onDonation(guarantee),
                  ),
                  const SizedBox(width: 8),
                  ButtonStateX.second(
                    maxWidth: 55,
                    state: addToCartButtonState,
                    iconData: Icons.shopping_cart_rounded,
                    onTap: () async => await onAddToCart(guarantee),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
