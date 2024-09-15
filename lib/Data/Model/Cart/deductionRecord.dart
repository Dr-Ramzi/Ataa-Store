part of '../../data.dart';

class DeductionRecordX {
  DeductionRecordX({
    required this.id,
    required this.deductionID,
    required this.name,
    required this.deduction,
    required this.deductionAmount,
    required this.bankCardNumber,
  });

  late String id;
  late String deductionID;
  late String name;
  late String deduction;
  late String bankCardNumber;
  late int deductionAmount;

  factory DeductionRecordX.fromJson(Map<String, dynamic> json) {
    return DeductionRecordX(
      id: json[NameX.id].toString(),
      deductionID: json[NameX.deductionID].toString(),
      name: json[NameX.name].toString(),
      deduction: json[NameX.deduction].toString(),
      bankCardNumber: json[NameX.bankCardNumber].toString(),
      deductionAmount: json[NameX.deductionAmount],
    );
  }
}
