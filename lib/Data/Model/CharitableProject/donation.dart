part of '../../data.dart';

class DonationX extends CharitableProjectX{
  DonationX({
    required super.id,
    required super.name,
    required this.totalNumberDonations,
    required super.currentDonations,
    required this.totalDonations,
    required super.description,
    required this.idea,
    required this.plan,
    required this.currentTargets,
    required this.totalTargets,
    required this.isZakat,
    this.stockValue,
    this.packages=const[],
    required super.shareURL,
    required super.imageURL,
  });


  late int totalNumberDonations;
  late int totalDonations;
  late int currentTargets;
  late int totalTargets;
  late String idea;
  late String plan;
  late bool isZakat;
  int? stockValue;
  late List<String> packages;


  get remainingDonations=> totalDonations-currentDonations;
  num get donationProgress=> currentDonations/totalDonations*100;
}