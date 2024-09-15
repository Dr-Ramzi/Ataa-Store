import 'package:get/get.dart';
import '../../../Config/config.dart';
import '../../../Data/Model/Cart/cart.dart';
import '../../../Data/data.dart';

class CartGeneralControllerX extends GetxController {
  //============================================================================
  // Variables

  Rx<CartX?> cart = Rx<CartX?>(null);

  //============================================================================
  // Functions

  delete(){
    cart.value = null;
  }

  saveCartID(){
    if(cart.value!=null) {
      LocalDataX.put(LocalKeyX.cartId, cart.value?.id);
    }
  }
  
  assignCart()async{
    if(LocalDataX.cartID.isNotEmpty && !LocalDataX.cartIDIsAssign){
      try{
        await DatabaseX.assignCart(LocalDataX.cartID);
      }catch(e){
        return Future.error(e);
      }
    }
  }

  getData({bool isLogin=false})async{
    try{
      if(LocalDataX.cartID.isNotEmpty || LocalDataX.token.isNotEmpty){
        cart.value = await DatabaseX.getAllCartItems(LocalDataX.cartID);
      }else{
        cart.value = await DatabaseX.createCart();
      }
      if(isLogin){
        await assignCart();
      }
      saveCartID();
    }catch(e){
      return Future.error(e);
    }
  }

  openCart() => Get.toNamed(RouteNameX.cart);

  addDonation(DonationX donation) async {
    try {
      /// TODO: Database >>> Add donation to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon Cart badge
      cart.value?.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addCampaign(CampaignX campaign) async {
    try {
      /// TODO: Database >>> Add campaign to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon Cart badge
      cart.value?.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addGifting(GiftingX gifting) async {
    try {
      /// TODO: Database >>> Add gifting to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon Cart badge
      cart.value?.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addSponsorship(SponsorshipX sponsorship) async {
    try {
      /// TODO: Database >>> Add sponsorship to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon Cart badge
      cart.value?.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addProduct(ProductX product) async {
    try {
      /// TODO: Database >>> Add product to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon Cart badge
      cart.value?.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

}
