part of '../../widget.dart';

class DeductionCardX extends StatelessWidget {
  const DeductionCardX({
    super.key,
    required this.deduction,
    required this.onTap,
    required this.onSubscribe,
    this.isSmallCard = false,
  });
  final DeductionX deduction;
  final Function(String id) onTap;
  final Function(DeductionX deduction) onSubscribe;
  final bool isSmallCard;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      radius: StyleX.radius,
      margin: isSmallCard
          ? const EdgeInsetsDirectional.only(end: 14)
          : const EdgeInsetsDirectional.only(bottom: 14),
      padding: EdgeInsets.zero,
      width: isSmallCard ? StyleX.deductionCardWidthSM : double.maxFinite,
      child: GestureDetector(
        onTap: () async => await onTap(deduction.id),
        child: Container(
          color: Colors.transparent,
          child: Column(
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
                      imageUrl: deduction.imageUrl,
                    ),
                  ),

                  /// Share Button
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    end: 10,
                    top: 10,
                    child: InkResponse(
                      onTap: () async => await shareSheet(deduction.shareURL),
                      child: const ContainerX(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Icon(Icons.share_rounded),
                      ),
                    ),
                  ),

                  /// Deduction Recurring Marker
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      start: 10,
                      top: 12,
                      child:
                          DeductionMarkerCardX(deduction: deduction.recurring)),
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
                    /// Deduction Name
                    TextX(
                      deduction.name,
                      style: TextStyleX.titleMedium,
                      fontWeight: FontWeight.w700,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),

                    /// Subscribe Button
                    if(deduction.isSubscribed)
                    ButtonX.gray(
                      text: 'Subscribed',
                      onTap: (){},
                    ),
                    if(!deduction.isSubscribed)
                    ButtonX(
                      text: "Subscribe Now",
                      onTap: () async=>await onSubscribe(deduction),
                      iconData: Icons.payments_rounded,
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
