part of '../../widget.dart';

class MyDedicationCardX extends StatelessWidget {
  const MyDedicationCardX({
    super.key,
    required this.dedication,
  });
  final DedicationX dedication;

  @override
  Widget build(BuildContext context) {
    return AccordionX(
      title: dedication.typeName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityDataRowX(
            title: "Mahdi Name",
            data: dedication.name,
          ).fadeAnimation100,
          ActivityDataRowX(
            title: "Gift amount",
            data:
            "${FunctionX.formatLargeNumber(dedication.donationAmount)} ${"SAR".tr}",
          ).fadeAnimation100,
          ActivityDataRowX(
            title: "Payment method",
            data: dedication.paymentMethod,
          ).fadeAnimation200,
          ActivityDataRowX(
            title: "Dedication Date",
            data: dedication.dedicationData,
          ).fadeAnimation200,
          ActivityDataRowX(
            title: "Dedication",
            dataWidget: InkWell(
              onTap: () async{
                try {
                  await launchUrl(Uri.parse(dedication.dedicationURL));
                } catch (_) {}
              },
              child: Row(
                children: [
                  TextX(
                    "Dedication Link",
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
