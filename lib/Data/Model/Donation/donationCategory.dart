part of '../../data.dart';

class DonationCategoryX{
  DonationCategoryX({
    required this.id,
    required this.name,
  });

  late String id;
  late String name;

  factory DonationCategoryX.fromJson(Map<String, dynamic> json) {
    return DonationCategoryX(
      id: json[NameX.id]??"",
      name: json[NameX.name]??"",
    );
  }

}