part of '../../data.dart';

class DonationSharesX{
  DonationSharesX({
    required this.id,
    required this.price,
    required this.isShare,
    this.sharesPackages=const[],
  });

  late String id;
  late int price;
  late bool isShare;
  late List<DonationSharesPackageX> sharesPackages;

  factory DonationSharesX.fromJson(Map<String, dynamic> json,List<Map<String,dynamic>> sharesPackages) {
    return DonationSharesX(
      id: json[NameX.id]??"",
      price: json[NameX.price]??0,
      isShare: json[NameX.price]!=null,
      sharesPackages: sharesPackages.map((json) => DonationSharesPackageX.fromJson(json)).toList(),
    );
  }

}