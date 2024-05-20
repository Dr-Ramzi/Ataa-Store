part of '../../data.dart';

class CampaignX{
  CampaignX({
    required this.id,
    required this.orgID,
    required this.donationID,
    required this.endDate,
    required this.title,
    required this.totalNumberDonations,
    required this.currentDonations,
    required this.totalDonations,
    required this.isZakat,
    this.stockValue,
    this.maxNumStock,
    this.targetAmount,
    required this.shareURL,
    required this.imageURL,
  });
  late String id;
  late String title;
  late String orgID;
  late String donationID;
  late DateTime endDate;
  late String shareURL;
  int? stockValue;
  int? maxNumStock;
  int? targetAmount;
  late bool isZakat;
  late int currentDonations;
  late int totalDonations;
  late int totalNumberDonations;
  late List<String> imageURL;

  get getTargetAmount => targetAmount ?? stockValue!*maxNumStock!;
  get remainingDonations=> totalDonations-currentDonations;
  num get donationProgress=> currentDonations/totalDonations*100;
}