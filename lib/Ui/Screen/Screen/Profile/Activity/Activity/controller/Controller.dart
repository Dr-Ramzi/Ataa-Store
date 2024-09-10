import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';

class ActivityController extends GetxController {

  //============================================================================
  // Functions

  onDonations()=>Get.toNamed(RouteNameX.myDonations);
  onOrders()=>Get.toNamed(RouteNameX.myOrders);
  onGifting()=>Get.toNamed(RouteNameX.myGifts);

  onCampaigns()=>Get.toNamed(RouteNameX.myCampaigns);
  onDeductions()=>Get.toNamed(RouteNameX.myDeductions);
  onSponsorships()=>Get.toNamed(RouteNameX.mySponsorships);
  onGivingBasket()=>Get.toNamed(RouteNameX.basket);

  onSharingLinks()=>Get.toNamed(RouteNameX.sharingLinks);
  onPaymentCards()=>Get.toNamed(RouteNameX.paymentCards);
  onNotifications()=>Get.toNamed(RouteNameX.notifications);

}