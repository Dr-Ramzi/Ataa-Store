part of '../../data.dart';

class DonationRecordX {
  DonationRecordX({
    required this.id,
    required this.donationId,
    this.donationAmount,
    this.numStock,
    this.package,
    required this.state,
    required this.paymentMethod,
    required this.donationDate,
    required this.donationReceiptUrl,
    required this.projectReportUrl,
  });

  late String id;
  late String donationId;
  late int? donationAmount;
  late int? numStock;
  late String? package;
  late String state;
  late String paymentMethod;
  late String donationDate;
  late String donationReceiptUrl;
  late String projectReportUrl;

  factory DonationRecordX.fromJson(Map<String, dynamic> json) {
    return DonationRecordX(
      id: json[NameX.id].toString(),
      donationId: json[NameX.donationId].toString(),
      donationAmount: json[NameX.donationAmount],
      numStock: json[NameX.numStock],
      package: json[NameX.package],
      state: json[NameX.state].toString(),
      paymentMethod: json[NameX.paymentMethod].toString(),
      donationDate: json[NameX.donationDate].toString(),
      donationReceiptUrl: json[NameX.donationReceiptUrl].toString(),
      projectReportUrl: json[NameX.projectReportUrl].toString(),
    );
  }
}
