import 'package:get/get.dart';
import '../../../Config/config.dart';
import '../../../Data/data.dart';

class BasketGeneralControllerX extends GetxController {
  //============================================================================
  // Variables

  Rx<BasketX> basket = BasketX.empty().obs;

  //============================================================================
  // Functions

  delete(){
    basket.value = BasketX.empty();
  }

  saveBasketID(){
    LocalDataX.put(LocalKeyX.basketID, basket.value.id);
  }
  
  assignBasket()async{
    if(LocalDataX.basketID.isNotEmpty){
      try{
        await DatabaseX.assignBasket(LocalDataX.basketID);
      }catch(e){
        return Future.error(e);
      }
    }
  }

  getData({bool isLogin=false})async{
    try{
      if(LocalDataX.basketID.isNotEmpty || LocalDataX.token.isNotEmpty){
        basket.value = await DatabaseX.getAllBasketItems(LocalDataX.basketID);
      }else{
        basket.value = await DatabaseX.createBasket();
      }
      if(isLogin){
        await assignBasket();
      }
      saveBasketID();
    }catch(e){
      return Future.error(e);
    }
  }

  openBasket() => Get.toNamed(RouteNameX.basket);

  addDonation(DonationX donation) async {
    try {
      /// TODO: Database >>> Add donation to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      basket.value.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addCampaign(CampaignX campaign) async {
    try {
      /// TODO: Database >>> Add campaign to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      basket.value.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addGifting(GiftingX gifting) async {
    try {
      /// TODO: Database >>> Add gifting to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      basket.value.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addSponsorship(SponsorshipX sponsorship) async {
    try {
      /// TODO: Database >>> Add sponsorship to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      basket.value.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addProduct(ProductX product) async {
    try {
      /// TODO: Database >>> Add product to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      basket.value.countItem++;
    } catch (e) {
      return Future.error(e);
    }
  }

}
