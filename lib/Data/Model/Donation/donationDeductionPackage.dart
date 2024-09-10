part of '../../data.dart';

class DonationDeductionPackageX{
  DonationDeductionPackageX({
    required this.id,
    required this.name,
    required this.recurring,
    required this.price,
    required this.endDate,
  });

  late String id;
  late String name;
  late String recurring;
  late int price;
  late String endDate;

  factory DonationDeductionPackageX.fromJson(Map<String, dynamic> json) {
    return DonationDeductionPackageX(
      id: json[NameX.id]??"",
      name: json[NameX.name]??"",
      recurring: json[NameX.recurring]??"",
      price: json[NameX.price]??0,
      endDate: json[NameX.endDate]??"",
    );
  }

}