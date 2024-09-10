part of '../../data.dart';

class DonationSharesPackageX{
  DonationSharesPackageX({
    required this.id,
    required this.name,
    required this.sharesCount,
  });

  late String id;
  late String name;
  late int sharesCount;

  factory DonationSharesPackageX.fromJson(Map<String, dynamic> json) {
    return DonationSharesPackageX(
      id: json[NameX.id]??"",
      name: json[NameX.name]??"",
      sharesCount: json[NameX.sharesCount]??0,
    );
  }

}