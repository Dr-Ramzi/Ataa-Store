part of '../../data.dart';

class DonationOpenPackageX{
  DonationOpenPackageX({
    required this.id,
    required this.name,
    required this.price,
  });

  late String id;
  late String name;
  late int price;

  factory DonationOpenPackageX.fromJson(Map<String, dynamic> json) {
    return DonationOpenPackageX(
      id: json[NameX.id]??"",
      name: json[NameX.name]??"",
      price: json[NameX.price]??0,
    );
  }

}