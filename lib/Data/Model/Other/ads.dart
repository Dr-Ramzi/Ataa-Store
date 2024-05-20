part of '../../data.dart';

class AdsX{
  AdsX({
    required this.id,
    required this.goToLink,
    required this.imageURL,
  });

  late String id;
  late String goToLink;
  late String imageURL;

  factory AdsX.fromJson(Map<String, dynamic> json) {
    return AdsX(
      id: json[NameX.id].toString(),
      goToLink: json[NameX.goTo].toString(),
      imageURL: json[NameX.imageURL].toString(),
    );
  }

}