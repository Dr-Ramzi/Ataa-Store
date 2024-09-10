part of '../../data.dart';

class DonationX{
  DonationX({
    required this.id,
    required this.name,
    required this.code,

    required this.order,
    required this.status,

    required this.currentDonations,
    required this.totalDonations,
    required this.remainingDonations,
    required this.countDonations,
    required this.countDonor,
    this.completionRate,

    required this.description,
    required this.briefDescription,

    required this.imageURL,
    required this.videoURL,

    required this.categories,

    required this.donationType,
    required this.isShowPackages,
    required this.isCanEditAmount,
    required this.donationShares,
    required this.donationDeductionPackages,
    required this.openPackages,

    required this.isShowHome,
    required this.isShowDonationsPercentage,
    required this.isShowCompletionIndicator,
    required this.isShowGifting,
    required this.isZakat,
    required this.isShowDonorsCount,


    this.shareURL="",
  });

  late String id;
  late int code;
  late String name;

  late int order; // don't know
  late bool status; // don't know

  late num currentDonations;
  late num totalDonations;
  late num remainingDonations;
  late num countDonations;
  late num countDonor;
  late num? completionRate;

  late String description;
  late String briefDescription;

  late String imageURL;
  late String videoURL;

  late List<DonationCategoryX> categories;


  late DonationTypeX donationType;
  late bool isShowPackages;
  late bool isCanEditAmount;
  late DonationSharesX donationShares;
  late List<DonationDeductionPackageX> donationDeductionPackages;
  late List<DonationOpenPackageX> openPackages;


  late bool isShowHome;
  late bool isShowDonationsPercentage;
  late bool isShowCompletionIndicator;
  late bool isShowGifting; // don't know
  late bool isZakat;
  late bool isShowDonorsCount;


  late String shareURL;


  num get donationProgress=> completionRate??currentDonations/totalDonations*100;
  bool get isDone=> (completionRate??0)>=100;

  factory DonationX.fromJson(Map<String, dynamic> json) {
    return DonationX(
      id: json[NameX.id]??"",
      code: json[NameX.donationBasic][NameX.code]??0,
      name: json[NameX.donationBasic][NameX.donationName]??"",

      order: json[NameX.donationBasic][NameX.order]??0,
      status: json[NameX.donationBasic][NameX.status]??true,

      currentDonations: json[NameX.donationBasic][NameX.currentDonations]??0,
      totalDonations: json[NameX.donationBasic][NameX.totalDonations]??0,
      remainingDonations: json[NameX.donationBasic][NameX.remainingDonations]??0,
      countDonations: json[NameX.donationBasic][NameX.countDonations]??0,
      countDonor: json[NameX.donationBasic][NameX.countDonor]??0,
      completionRate: json[NameX.donationBasic][NameX.completionRate]??0,

      description: json[NameX.donationDetails][NameX.description]??"",
      briefDescription: json[NameX.donationDetails][NameX.briefDescription]??"",

      imageURL: json[NameX.donationDetails][NameX.image][NameX.url]??"",
      videoURL: json[NameX.donationDetails][NameX.videoUrl]??"",

      categories: List<Map<String,dynamic>>.from(json[NameX.donationCategories]??[])
          .map((json) => DonationCategoryX.fromJson(json)).toList(),

      donationType: DonationTypeX.fromJson(json[NameX.donationTypeDetails][NameX.donationType]??{}),
      isShowPackages: json[NameX.donationTypeDetails][NameX.isShowPackages]??false,
      isCanEditAmount: json[NameX.donationTypeDetails][NameX.isCanEditAmount]??false,
      donationShares: DonationSharesX.fromJson(json[NameX.donationTypeDetails][NameX.donationShare]??{},
          List<Map<String,dynamic>>.from(json[NameX.donationTypeDetails][NameX.donationSharesPackages]??[]),
      ),
      donationDeductionPackages: List<Map<String,dynamic>>.from(json[NameX.donationTypeDetails][NameX.donationDeductionPackages]??[])
          .map((json) => DonationDeductionPackageX.fromJson(json)).toList(),
      openPackages: List<Map<String,dynamic>>.from(json[NameX.donationTypeDetails][NameX.donationOpenPackages]??[])
          .map((json) => DonationOpenPackageX.fromJson(json)).toList(),

      isShowHome: json[NameX.donationSettings][NameX.isShowHome]??false,
      isShowDonationsPercentage: json[NameX.donationSettings][NameX.isShowDonationsPercentage]??false,
      isShowCompletionIndicator: json[NameX.donationSettings][NameX.isShowCompletionIndicator]??false,
      isShowGifting: json[NameX.donationSettings][NameX.isShowGifting]??false,
      isZakat: json[NameX.donationSettings][NameX.isZakat]??false,
      isShowDonorsCount: json[NameX.donationSettings][NameX.isShowDonorsCount]??false,

      // shareURL: json[NameX.]??'',
    );
  }

}