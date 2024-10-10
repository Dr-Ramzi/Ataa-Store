part of '../../widget.dart';

class CampaignCardX extends StatelessWidget {
  const CampaignCardX({
    super.key,
    required this.campaign,
    this.onAddToCart,
    this.onDonation,
    required this.onTap,
    this.isPreview = false,
  });

  final Function(String id) onTap;

  final bool isPreview;
  final Function(CampaignX)? onDonation;
  final Function(CampaignX)? onAddToCart;
  final CampaignX campaign;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      radius: StyleX.radius,
      margin: const EdgeInsetsDirectional.only(bottom: 14),
      padding: EdgeInsets.zero,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () async => await onTap(campaign.id),
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
                    imageUrl: campaign.imageUrl??'',
                  ),
                ),
                if(!isPreview)
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  end: 10,
                  top: 10,
                  child: InkResponse(
                    onTap: () {
                      shareSheet(campaign.shareURL);
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
                if (campaign.isZakat)
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 10,
                      top: 12,
                      child: const ZakatDisbursementsCardX()),
                if (campaign.stockValue != null)
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
                        "${"Value share is".tr} ${campaign.stockValue} ${"SAR".tr}",
                        color: Colors.white,
                        style: TextStyleX.supTitleMedium,
                      ),
                    ),
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
                    campaign.title,
                    style: TextStyleX.titleMedium,
                    fontWeight: FontWeight.w700,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextX(
                              "${FunctionX.formatLargeNumber(campaign.currentDonations)} ${"SAR was collected".tr}",
                              style: TextStyleX.supTitleMedium,
                              maxLines: 1,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: TextX(
                              "${FunctionX.formatLargeNumber(campaign.totalDonations - campaign.currentDonations)} ${"SAR remaining".tr}",
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
                        value:
                            campaign.currentDonations / campaign.totalDonations,
                        borderRadius: BorderRadius.circular(50),
                        minHeight: 6,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                        Flexible(
                          flex: 7,
                          child: ButtonX(
                            onTap:  () async {
                              if (isPreview) {
                                await onTap(campaign.id);
                              } else if (onDonation != null) {
                                await onDonation!(campaign);
                              }
                            },
                            text: isPreview ? "Campaign preview" : "Donate Now",
                            iconData: Icons.payments_rounded,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          flex: 2,
                          child: ButtonX.second(
                            onTap:() async {
                              if (isPreview) {
                                shareSheet(campaign.shareURL);
                              } else if (onAddToCart != null) {
                                await onAddToCart!(campaign);
                              }
                            },
                            iconData: isPreview?Icons.share_rounded:Icons.shopping_cart_rounded,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
