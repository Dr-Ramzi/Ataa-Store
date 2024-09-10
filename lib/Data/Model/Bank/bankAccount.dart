part of '../../data.dart';

class BankAccountX {
  BankAccountX({
    required this.id,
    required this.name,
    required this.iban,
    required this.status,
  });

  late String id;
  late String name;
  late String iban;
  late bool status;

  factory BankAccountX.fromJson(Map<String, dynamic> json) {
    return ModelUtilX.checkFromJson(
      json,
      (json) => BankAccountX(
        id: json[NameX.id].toStrDefaultX(''),
        name: json[NameX.accountNumber].toStrX,
        iban: json[NameX.iban].toStrX,
        status: json[NameX.status].toBoolDefaultX(true),
      ),
      requiredAnyDataOfKeys: [
        [
          NameX.accountNumber,
          NameX.iban,
        ]
      ],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.iban: iban,
      NameX.status: status,
    };
  }
}
