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
  onGivingCart()=>Get.toNamed(RouteNameX.cart);

  onSharingLinks()=>Get.toNamed(RouteNameX.myShareLinks);
  onPaymentCards()=>Get.toNamed(RouteNameX.paymentCards);
  onNotifications()=>Get.toNamed(RouteNameX.notifications);

}