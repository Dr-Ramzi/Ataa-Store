part of '../../data.dart';

class OrderProductX{
  OrderProductX({
    required this.id,
    required this.productID,
    required this.numProduct,
    required this.name,
    required this.price,
    required this.imageURL,
  });

  late String id;
  late String productID;
  late String name;
  late String imageURL;
  late int numProduct;
  late int price;

  factory OrderProductX.fromJson(Map<String, dynamic> json) {
    return OrderProductX(
      id: json[NameX.id].toString(),
      productID: json[NameX.productID].toString(),
      name: json[NameX.name].toString(),
      imageURL: json[NameX.imageUrl].toString(),
      numProduct: json[NameX.numProduct] ?? 0,
      price: json[NameX.price] ?? 0,
     );
  }

}