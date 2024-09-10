part of '../../data.dart';

class AdsX {
  AdsX({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    required this.buttonUrl,
    required this.externalUrl,
    this.isActive = true,
    this.imageUrl,
    this.videoUrl,
  });

  String id;
  String title;
  String subtitle;
  String buttonTitle;
  String buttonUrl;
  String externalUrl;
  bool isActive;
  String? imageUrl;
  String? videoUrl;

  factory AdsX.fromJson(Map<String, dynamic> json) {
    Map<String, Object?> imageJson = Map<String, Object?>.from(json[NameX.image] ?? {});
    return ModelUtilX.checkFromJson(
      json,
          (json) => AdsX(
        id: json[NameX.id].toStrDefaultX(''),
        title: json[NameX.titleAds].toStrDefaultX(''),
        subtitle: json[NameX.subtitle].toStrDefaultX(''),
        buttonTitle: json[NameX.buttonTitle].toStrDefaultX(''),
        buttonUrl: json[NameX.buttonUrl].toStrDefaultX(''),
        externalUrl: json[NameX.externalUrl].toStrDefaultX(''),
        isActive: json[NameX.isActive].toBoolDefaultX(true),
        imageUrl: imageJson[NameX.url].toStrNullableX,
        videoUrl: json[NameX.videoUrl].toStrNullableX,
      ),
      requiredAnyDataOfKeys: [
        [
          NameX.videoUrl,
          NameX.image,
          NameX.url,
        ]
      ]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.title: title,
      NameX.subtitle: subtitle,
      NameX.buttonTitle: buttonTitle,
      NameX.buttonUrl: buttonUrl,
      NameX.externalUrl: externalUrl,
      NameX.isActive: isActive,
      NameX.image: {NameX.url: imageUrl},
      NameX.videoUrl: videoUrl,
    };
  }
}