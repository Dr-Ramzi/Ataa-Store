part of '../../data.dart';

class ContactUsX{
  ContactUsX({
    required this.phone,
    required this.email,
    required this.web,
  });

  late String phone;
  late String email;
  late String web;

  factory ContactUsX.fromJson(Map<String, dynamic> json) {
    return ContactUsX(
      phone: json[NameX.phone].toString(),
      email: json[NameX.email].toString(),
      web: json[NameX.web].toString(),
    );
  }
}