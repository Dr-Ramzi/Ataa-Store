part of '../../data.dart';

class DeductionX extends CharitableProjectX{
  DeductionX({
    required super.id,
    required super.name,
    required this.totalNumberSubscriptions,
    this.fixedDeductionAmount,
    required super.currentDonations,
    required super.description,
    required this.deduction,
    required super.shareURL,
    required super.imageURL,
  });


  late String deduction;
  late int totalNumberSubscriptions;
  late int? fixedDeductionAmount;

}