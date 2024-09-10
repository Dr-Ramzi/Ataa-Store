part of '../../widget.dart';

class MyDonationCardX extends StatelessWidget {
  const MyDonationCardX({
    super.key,
    required this.myDonation,
    required this.donation,
  });
  final DonationRecordX myDonation;
  final DonationX donation;

  @override
  Widget build(BuildContext context) {
    return AccordionX(
      title: donation.name,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityDataRowX(
            title: "State",
            data: myDonation.state,
          ).fadeAnimation100,
          if (myDonation.package != null)
            ActivityDataRowX(
              title: "Package",
              data: myDonation.package!,
            ).fadeAnimation100,
          if (myDonation.donationAmount != null)
            ActivityDataRowX(
              title: "Donation amount",
              data:
                  "${FunctionX.formatLargeNumber(myDonation.donationAmount!)} ${"SAR".tr}",
            ).fadeAnimation200,
          if (myDonation.numStock != null)
            ActivityDataRowX(
              title: "Number of Shares",
              data: myDonation.numStock!.toString(),
            ).fadeAnimation200,
          if (myDonation.numStock != null)
            ActivityDataRowX(
              title: "Share value",
              data:
                  "${FunctionX.formatLargeNumber(donation.donationShares.price)} ${"SAR".tr}",
            ).fadeAnimation200,
          ActivityDataRowX(
            title: "Payment method",
            data: myDonation.paymentMethod,
          ).fadeAnimation200,
          ActivityDataRowX(
            title: "Donation date",
            data: myDonation.donationDate,
          ).fadeAnimation300,
          ActivityDataRowX(
            title: "Donation receipt",
            dataWidget: InkWell(
              onTap: () {
                bottomSheetX(
                  title: "Donation receipt",
                  child: ImageNetworkX(
                    height: 400,
                    fit: BoxFit.contain,
                    imageUrl: myDonation.donationReceiptUrl,
                  ).fadeAnimation300,
                );
              },
              child: Row(
                children: [
                  TextX(
                    "Show receipt",
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.image_outlined,
                    size: 22,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ).fadeAnimation400,
          ActivityDataRowX(
            isLine: false,
            title: "Project report",
            dataWidget: InkWell(
              onTap: () {
                /// TODO: add code to download project report
                ToastX.success(message: "The file was downloaded successfully");
              },
              child: Row(
                children: [
                  TextX(
                    "Download the report",
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.download_rounded,
                    size: 22,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ).fadeAnimation400,
        ],
      ),
    );
  }
}
