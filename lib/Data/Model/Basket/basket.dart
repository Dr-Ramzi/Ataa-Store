part of '../../data.dart';

class BasketX {
  BasketX({
    required this.id,
    required this.location,
    required this.totalPrice,
    required this.countItem,
    required this.currency,
    required this.isProduct,
    required this.cartItems,
  });
  BasketX.empty(){
    id = "";
    location = "";
    totalPrice = 0;
    countItem = 0;
    currency = "";
    isProduct = false;
    cartItems = [];
  }

  late String id;
  late String? location;
  late double totalPrice;
  late int countItem;
  late String currency;
  late bool isProduct;
  late List<dynamic> cartItems;

  factory BasketX.fromJson(Map<String, dynamic> json) {
    return BasketX(
      id: json[NameX.id] ?? '',
      location: json[NameX.location],
      totalPrice: json[NameX.totalPrice]?.toDouble() ?? 0.0,
      countItem: json[NameX.countItem] ?? 0,
      currency: json[NameX.currency] ?? '',
      isProduct: json[NameX.isProduct] ?? false,
      cartItems: json[NameX.cartItems] ?? [],
    );
  }
}