part of '../../data.dart';

class DonationTypeX{
  DonationTypeX({
    required this.id,
    required this.name,
    required this.type,
  });

  late String id;
  late String name;
  late String type;

  factory DonationTypeX.fromJson(Map<String, dynamic> json) {
    return DonationTypeX(
      id: json[NameX.id]??"",
      name: json[NameX.donationTypeName]??"",
      type: json[NameX.name]??"",
    );
  }

}