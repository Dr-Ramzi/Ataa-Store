part of '../../widget.dart';

class MyGiftingCardX extends StatelessWidget {
  const MyGiftingCardX({
    super.key,
    required this.gifting,
  });
  final GiftingX gifting;

  @override
  Widget build(BuildContext context) {
    return AccordionX(
      title: gifting.typeName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityDataRowX(
            title: "Mahdi Name",
            data: gifting.name,
          ).fadeAnimation100,
          ActivityDataRowX(
            title: "Gift amount",
            data:
            "${FunctionX.formatLargeNumber(gifting.donationAmount)} ${"SAR".tr}",
          ).fadeAnimation100,
          ActivityDataRowX(
            title: "Payment method",
            data: gifting.paymentMethod,
          ).fadeAnimation200,
          ActivityDataRowX(
            title: "Gifting Date",
            data: gifting.giftingData,
          ).fadeAnimation200,
          ActivityDataRowX(
            title: "Gifting",
            dataWidget: InkWell(
              onTap: () async{
                try {
                  await launchUrl(Uri.parse(gifting.giftingURL));
                } catch (_) {}
              },
              child: Row(
                children: [
                  TextX(
                    "Gifting Link",
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.open_in_new_rounded,
                    size: 22,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ).fadeAnimation300,
        ],
      ),
    );
  }
}
