import 'package:get/get.dart';
import '../../../../../../../Data/data.dart';

class MyOrdersController extends GetxController {
  //============================================================================
  // Variables

  List<OrderX> orders =[];
  List<List<OrderProductX>> products =[];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch All my orders
      await Future.delayed(const Duration(seconds: 1)); // delete this

      orders=TestDataX.orders;

      /// TODO: Database >>> Fetch All products in orders
      for(int i=0; i<orders.length;i++) {
        products.add(TestDataX.orderProducts.where((x) => orders[i].orderProductsIDs.contains(x.id)).toList());
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}