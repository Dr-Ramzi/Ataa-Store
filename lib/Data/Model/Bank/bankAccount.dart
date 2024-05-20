part of '../../data.dart';

class BankAccountX {
  BankAccountX({
    required this.id,
    required this.name,
    required this.iban,
    required this.imageURL,
  });

  late String id;
  late String name;
  late String iban;
  late String imageURL;

  factory BankAccountX.fromJson(Map<String, dynamic> json) {
    return BankAccountX(
      id: json[NameX.id].toString(),
      name: json[NameX.name].toString(),
      iban: json[NameX.iban].toString(),
      imageURL: json[NameX.imageURL].toString(),
    );
  }
}
