import 'package:get/get.dart';
import '../../../Config/config.dart';
import '../../../Data/data.dart';

class BasketGeneralControllerX extends GetxController {
  //============================================================================
  // Variables

  RxInt numItemsBadge = 0.obs;

  //============================================================================
  // Functions

  openBasket() => Get.toNamed(RouteNameX.basket);

  getData() async {
    try {
      /// TODO: Database >>> Fetch the number of items in the basket
      await Future.delayed(const Duration(seconds: 1)); // delete this
      numItemsBadge.value = 0;
    } catch (e) {
      return Future.error(e);
    }
  }

  addDonation(DonationX donation) async {
    try {
      /// TODO: Database >>> Add donation to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      numItemsBadge.value++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addCampaign(CampaignX campaign) async {
    try {
      /// TODO: Database >>> Add campaign to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      numItemsBadge.value++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addDedication(DedicationX dedication) async {
    try {
      /// TODO: Database >>> Add dedication to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      numItemsBadge.value++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addGuarantee(GuaranteeX guarantee) async {
    try {
      /// TODO: Database >>> Add guarantee to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      numItemsBadge.value++;
    } catch (e) {
      return Future.error(e);
    }
  }

  addProduct(ProductX product) async {
    try {
      /// TODO: Database >>> Add product to cart
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// update number items for icon basket badge
      numItemsBadge.value++;
    } catch (e) {
      return Future.error(e);
    }
  }

}
