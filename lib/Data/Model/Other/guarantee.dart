part of '../../data.dart';

class GuaranteeX{
  GuaranteeX({
    required this.id,
    this.muslimNum,
    required this.country,
    required this.countryFlagCode,
    required this.gender,
    required this.language,
    this.previousReligion,
    this.courseName,
    required this.donationAmount,
  });

  late String id;
  late int? muslimNum;
  late String country;
  late String countryFlagCode;
  late String gender;
  late String language;
  late String? previousReligion;
  late String? courseName;
  late int donationAmount;

  // factory GuaranteeX.fromJson(Map<String, dynamic> json) {
  //   return GuaranteeX(
  //     id: json[NameX.id].toString(),
  //   );
  // }

}