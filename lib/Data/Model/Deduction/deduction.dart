part of '../../data.dart';

class DeductionX{
  DeductionX({
    required this.id,
    required this.name,
    required this.code,
    required this.recurring,
    required this.recurringLocalized,

    this.order,
    required this.status,

    required this.achievedAmount,
    required this.subscribersCount,

    required this.description,

    required this.imageUrl,
    required this.videoUrl,

    required this.category,

    required this.initialPrice,
    required this.isOpenPrice,
    required this.day,
    required this.dayLocalized,
    required this.isSubscribed,
    this.shareURL='',
  });

  String id;
  int code;
  String name;
  String recurring;
  String? recurringLocalized;

  int? order; // don't know
  bool status; // don't know

  num achievedAmount;
  num subscribersCount;

  String description;

  String? day;
  String? dayLocalized;

  bool isSubscribed;

  String imageUrl;
  String videoUrl;

  DonationCategoryX category;

  double initialPrice;
  bool isOpenPrice;
  String shareURL;

  factory DeductionX.fromJson(Map<String, dynamic> json) {
    Map<String, Object?> imageJson = Map<String, Object?>.from(json[NameX.image] ?? {});
    Map<String, Object?> donationCategoryJson = Map<String, dynamic>.from(json[NameX.donationCategory]);

    return ModelUtilX.checkFromJson(
        json,
            (json) => DeductionX(
              id: json[NameX.id].toStrX,
              code: json[NameX.code].toIntX,
              name: json[NameX.name].toStrX,
              recurring: json[NameX.recurring].toStrX,
              recurringLocalized: json[NameX.recurringLocalized].toStrNullableX,

              order: json[NameX.order].toIntNullableX,
              status: json[NameX.status].toBoolDefaultX(true),

              achievedAmount: json[NameX.achievedAmount].toDoubleDefaultX(0),
              subscribersCount: json[NameX.subscribersCount].toIntDefaultX(0),

              description: json[NameX.description].toStrDefaultX(''),

              imageUrl: imageJson[NameX.url].toStrDefaultX(''),
              videoUrl: json[NameX.videoUrl].toStrDefaultX(''),

              category: DonationCategoryX.fromJson(donationCategoryJson),

              day: json[NameX.day].toStrNullableX,
              dayLocalized: json[NameX.dayLocalized].toStrNullableX,
              initialPrice: json[NameX.initialPrice].toDoubleX,
              isOpenPrice: json[NameX.isOpenPrice].toBoolDefaultX(false),
              isSubscribed: json[NameX.isSubscribed].toBoolDefaultX(false),
            ),
        requiredDataKeys: [
          NameX.id,
          NameX.code,
          NameX.name,
          NameX.recurring,
          NameX.initialPrice,
          NameX.donationCategory,
        ]
    );
  }

}