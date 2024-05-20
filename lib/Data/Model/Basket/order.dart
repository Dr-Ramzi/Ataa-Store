part of '../../data.dart';

class OrderX {
  OrderX({
    required this.id,
    required this.numOrder,
    required this.state,
    required this.paymentMethod,
    required this.orderInvoiceUrl,
    required this.aramexInvoiceUrl,
    required this.totalPrice,
    required this.orderDate,
    required this.orderProductsIDs,
  });

  late String id;
  late String state;
  late String paymentMethod;
  late int numOrder;
  late String orderInvoiceUrl;
  late String aramexInvoiceUrl;
  late int totalPrice;
  late String orderDate;
  late List<String> orderProductsIDs = [];

  factory OrderX.fromJson(Map<String, dynamic> json) {
    return OrderX(
      id: json[NameX.id].toString(),
      state: json[NameX.state].toString(),
      paymentMethod: json[NameX.paymentMethod].toString(),
      numOrder: json[NameX.numOrder] ?? 0,
      orderInvoiceUrl: json[NameX.orderInvoiceUrl].toString(),
      aramexInvoiceUrl: json[NameX.aramexInvoiceUrl].toString(),
      totalPrice: json[NameX.totalPrice] ?? 0,
      orderDate: json[NameX.orderDate].toString(),
      orderProductsIDs: List<String>.from(json[NameX.orderProductsIDs] ?? []),
    );
  }
}
