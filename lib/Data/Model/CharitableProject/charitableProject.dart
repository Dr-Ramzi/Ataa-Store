part of '../../data.dart';

class CharitableProjectX{
  CharitableProjectX({
    required this.id,
    required this.name,
    required this.currentDonations,
    required this.description,
    required this.shareURL,
    required this.imageURL,
  });

  late String id;
  late String name;
  late String description;
  late String shareURL;
  late int currentDonations;
  late List<String> imageURL;
}