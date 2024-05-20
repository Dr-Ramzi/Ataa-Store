import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Sort/sortProductsController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Other/ProductAddToCart/productAddToCart.dart';
import '../../../../../ScreenSheet/Sort/SortProducts/sortProducts.dart';

class StoreController extends GetxController {
  //============================================================================
  // Injection of required controls

  SortProductsControllerX sortProductsController =
      Get.put(SortProductsControllerX());

  //============================================================================
  // Variables

  List<ProductX> products = [];
  RxList<ProductX> productsResult = <ProductX>[].obs;
  final TextEditingController search = TextEditingController();

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch All Products
      await Future.delayed(const Duration(seconds: 1)); // delete this

      products = TestDataX.products;

      productsResult.value = products;
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Other

  onTapProduct(String id) =>
      Get.toNamed(RouteNameX.productDetails, arguments: id);

  onAddToCart(ProductX product) async => await productAddToCartSheetX(product);

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter() async {
    /// Keep the current arrangement
    var x = sortProductsController.sortSelected.value;
    /// Open the bottom sheet to choose the new arrangement
    await sortProductsSheetX(controller: sortProductsController);
    /// Checks if the specified order is different from what was intended to be reordered
    if (x != sortProductsController.sortSelected.value) {
      /// Run the ranking process
      sort();
      /// When the ranking is finished, the applied search process is performed
      onSearching(search.text);
    }
  }

  sort() {
    switch (sortProductsController.sortSelected.value) {
      case ProductSortEX.all:
        products.shuffle();
      case ProductSortEX.seller:
        products.sort((a, b) => b.numSales.compareTo(a.numSales));
      case ProductSortEX.rated:
        products.sort((a, b) => b.rating.compareTo(a.rating));
      case ProductSortEX.priceHigh:
        products.sort((a, b) => b.price.compareTo(a.price));
      case ProductSortEX.priceLow:
        products.sort((a, b) => a.price.compareTo(b.price));
    }
  }

  onSearching(String search) async {
    /// TODO: Change the search code if you want to retrieve search results from the database
    try {
      /// clean search text from withe space and convert all char to lower case for contains with product data
      search = search.toLowerCase().trimLeft().trimRight();

      /// Bring all products that partially or completely match the name or description
      productsResult.value = products
          .where(
            (product) =>
                product.name.toLowerCase().contains(search) ||
                product.description.toLowerCase().contains(search),
          )
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
