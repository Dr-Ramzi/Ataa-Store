part of '../../data.dart';

class PaymentCardX {
  PaymentCardX({
    required this.id,
    required this.name,
    required this.cardNum,
    required this.expiryDate,
    required this.cvv,
    required this.isDefault,
  });

  late String id;
  late String name;
  late String cardNum;
  late String expiryDate;
  late int cvv;
  late bool isDefault;

  factory PaymentCardX.fromJson(Map<String, dynamic> json) {
    return PaymentCardX(
      id: json[NameX.id].toString(),
      name: json[NameX.name].toString(),
      cardNum: json[NameX.cardNum].toString(),
      expiryDate: json[NameX.expiryDate].toString(),
      cvv: json[NameX.cvv] ?? 0,
      isDefault: json[NameX.isDefault] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.cardNum: cardNum,
      NameX.expiryDate: expiryDate,
      NameX.cvv: cvv,
      NameX.isDefault: isDefault,
    };
  }
}
