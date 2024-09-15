import 'package:ataa/Core/Extension/convert/convert.dart';
import '../../../Core/Helper/model/model.dart';
import '../../data.dart';

class CartItemX {
  CartItemX({
    required this.id,
    required this.price,
    required this.quantity,
    required this.type,
    required this.name,
    required this.order,
    this.imageUrl,
  });

  String id;
  double price;
  int quantity;
  String type;
  String name;
  OrderX order;
  String? imageUrl;

  factory CartItemX.fromJson(Map<String, dynamic> json) {
    Map<String, Object?> imageJson = Map<String, Object?>.from(json[NameX.image] ?? {});
    Map<String, Object?> orderJson = Map<String, Object?>.from(json[NameX.order] ?? {});

    return ModelUtilX.checkFromJson(
      json,
          (json) => CartItemX(
        id: json[NameX.id].toStrX,
        price: json[NameX.price].toDoubleX,
        quantity: json[NameX.quantity].toIntDefaultX(1),
        type: json[NameX.type].toStrX,
        name: json[NameX.name].toStrX,
        order: OrderX.fromJson(orderJson),
        imageUrl: imageJson[NameX.url].toStrNullableX,
      ),
      requiredDataKeys: [
        NameX.id,
        NameX.price,
        NameX.type,
        NameX.name,
        NameX.order,
      ],
    );
  }

  /// Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.price: price,
      NameX.quantity: quantity,
      NameX.type: type,
      NameX.name: name,
      NameX.order: order.toJson(),
      NameX.image: {NameX.url: imageUrl},
    };
  }
}