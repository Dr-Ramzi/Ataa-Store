part of '../../data.dart';

class ShareLinkX{
  ShareLinkX({
    required this.id,
    required this.donationID,
    required this.donationName,
    required this.link,
    required this.numVisits,
    required this.numRegistered,
    required this.numDonors,
    required this.totalDonations,
  });
  late String id;
  late String donationID;
  late String donationName;
  late String link;
  late int numVisits;
  late int numRegistered;
  late int numDonors;
  late int totalDonations;
}