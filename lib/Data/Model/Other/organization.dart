part of '../../data.dart';

class OrganizationX{
  OrganizationX({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
  });

  late String id;
  late String name;
  late String description;
  late String imageURL;

  factory OrganizationX.fromJson(Map<String, dynamic> json) {
    return OrganizationX(
      id: json[NameX.id].toString(),
      name: json[NameX.name].toString(),
      description: json[NameX.description].toString(),
      imageURL: json[NameX.imageURL].toString(),
    );
  }

}