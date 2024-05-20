part of '../../data.dart';

class StatisticsX{
  StatisticsX({
    required this.id,

    required this.allDonations,
    required this.completedDonations,
    required this.totalParticipation,
    required this.totalDonationAmount,

    required this.totalCampaigns,
    required this.totalCampaignAmount,
    required this.numCampaignDonations,
    required this.numCampaignVisits,

    required this.numRequests,
    required this.completedOrders,
    required this.totalAmountOrders,

    required this.totalDeductions,
    required this.totalAmountDeductions,

    required this.numGuarantees,
    required this.totalAmountGuarantees,

    required this.numLinks,
    required this.newRegistrationsViaLinks,
    required this.numDonationsViaLinks,
    required this.numLinkVisits,
    required this.totalAmountDonationsViaLinks,
  });

  late String id;

  late int allDonations;
  late int completedDonations;
  late int totalParticipation;
  late int totalDonationAmount;


  late int totalCampaigns;
  late int totalCampaignAmount;
  late int numCampaignDonations;
  late int numCampaignVisits;

  late int numRequests;
  late int completedOrders;
  late int totalAmountOrders;

  late int totalDeductions;
  late int totalAmountDeductions;

  late int numGuarantees;
  late int totalAmountGuarantees;

  late int numLinks;
  late int newRegistrationsViaLinks;
  late int numDonationsViaLinks;
  late int numLinkVisits;
  late int totalAmountDonationsViaLinks;

}