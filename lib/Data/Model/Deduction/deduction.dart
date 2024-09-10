part of '../../data.dart';

class DeductionX{
  DeductionX({
    required this.id,
    required this.name,
    required this.description,
    required this.briefDescription,
    required this.recurring,
    required this.currentDonations,
    required this.shareURL,
    required this.imageURL,
    required this.videoURL,
    required this.totalNumberSubscriptions,
    this.fixedDeductionAmount,
  });

  late String id;
  late String name;
  late String description;
  late String briefDescription;
  late String recurring;
  late int currentDonations;
  late String shareURL;
  late String imageURL;
  late String videoURL;
  late int totalNumberSubscriptions;
  late int? fixedDeductionAmount;

}