import 'package:ataa/Core/Extension/convert/convert.dart';
import '../../../Core/Helper/model/model.dart';
import '../../data.dart';

class GiftCategoryX{
  GiftCategoryX({
    required this.id,
    required this.name,
    this.order,
    required this.status,
    required this.imageUrl,
    this.donationCategories = const [],
});

  String id;
  String name;
  bool status;
  int? order;
  String imageUrl;
  List<OrganizationX> donationCategories;

  factory GiftCategoryX.fromJson(Map<String, dynamic> json) {
    Map<String, Object?> imageJson = Map<String, Object?>.from(json[NameX.image] ?? {});
    return ModelUtilX.checkFromJson(
        json,
            (json) => GiftCategoryX(
          id: json[NameX.id].toStrX,
          name: json[NameX.name].toStrX,
          status: json[NameX.status].toBoolDefaultX(true),
          order: json[NameX.order].toIntNullableX,
          imageUrl: imageJson[NameX.url].toStrX,
          donationCategories: ModelUtilX.generateItems((json[NameX.giftDonationCategories]??[]) as List, OrganizationX.fromJson),
        ),
        requiredAnyDataOfKeys: [
          [
            NameX.id,
            NameX.name,
            NameX.image,
            NameX.url,
          ]
        ]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.status: status,
      NameX.order: order,
      NameX.image: {NameX.url: imageUrl},
      NameX.donationCategories: donationCategories.map((e) => e.toJson()).toList(),
    };
  }
}