part of '../../data.dart';

class UserX {
  UserX({
    required this.id,
    required this.name,
    required this.phone,
    required this.countryCode,
    required this.token,
    this.email,
    this.gender,
    this.imageUrl,
  });

  late String id;
  late String token;
  late String name;
  late int phone;
  late int countryCode;
  String? email;
  String? gender;
  String? imageUrl;

  factory UserX.fromJson(Map<String, dynamic> json, String token) {
    Map<String, Object?> imageJson =
        Map<String, Object?>.from(json[NameX.image] ?? {});
    return ModelUtilX.checkFromJson(
      json,
      (json) {
        return UserX(
          id: json[NameX.id].toStrDefaultX(''),
          name: json[NameX.name].toStrDefaultX(''),
          phone: json[NameX.phone].toIntX,
          countryCode: json[NameX.countryCode].toIntDefaultX(966),
          email: json[NameX.email].toStrNullableX,
          gender: json[NameX.gender].toStrNullableX,
          imageUrl: imageJson[NameX.url].toStrNullableX,
          token: token,
        );
      },
      requiredDataKeys: [
        NameX.phone,
      ],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.phone: phone,
      NameX.email: email,
      NameX.gender: gender,
      NameX.imageUrl: imageUrl,
    };
  }
}
