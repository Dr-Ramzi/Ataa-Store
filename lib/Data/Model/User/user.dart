part of '../../data.dart';

class UserX {
  UserX({
    required this.id,
    required this.name,
    required this.phone,
    required this.countryCode,
    this.email,
    this.gender,
    this.imageURL,
    this.token="",
  });

  UserX.empty();

  late String id;
  late String token;
  late String name;
  late int phone;
  late int countryCode;
  late String? email;
  late String? gender;
  late String? imageURL;

  factory UserX.fromJson(Map<String, dynamic> json, String token) {
    return UserX(
      id: json[NameX.id].toString(),
      name: json[NameX.name].toString(),
      phone: json[NameX.phone]??0,
      countryCode: json[NameX.countryCode]??0,
      email: json[NameX.email],
      gender: json[NameX.gender],
      imageURL: (json[NameX.imageURL]??{})[NameX.imageURL],
      token: token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.phone: phone,
      NameX.email: email,
      NameX.gender: gender,
      NameX.imageURL: imageURL,
    };
  }
}
