import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: "My Activity",actions: [BasketIconButtonsX()],),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp,vertical:StyleX.vPaddingApp),
          child: OptionsGroupCardX(options: [
            OptionCardX(title: "Register My Donations", icon: Icons.favorite_rounded,onTap: controller.onDonations,),
            OptionCardX(title: "My Orders", icon: Icons.shopping_bag_rounded,onTap: controller.onOrders,),
            OptionCardX(title: "My Dedications", icon: Icons.card_giftcard_rounded,onTap: controller.onDedications,),
            OptionCardX(title: "My Campaigns", icon: Icons.campaign_rounded,onTap: controller.onCampaigns,),
            OptionCardX(title: "My Deductions", icon: Icons.credit_card_rounded,onTap: controller.onDeductions,),
            OptionCardX(title: "My Guarantees", icon: Icons.thumb_up_alt_rounded,onTap: controller.onGuarantees,),
            OptionCardX(title: "Giving Basket", icon: Icons.shopping_cart_rounded,onTap: controller.onGivingBasket,),
            OptionCardX(title: "Sharing Links", icon: Icons.share_rounded,onTap: controller.onSharingLinks,),
            OptionCardX(title: "Payment cards", icon: Icons.credit_card_rounded,onTap: controller.onPaymentCards,),
            OptionCardX(title: "Notifications", icon: Icons.notifications_rounded,onTap: controller.onNotifications,isBottomLine: false,),
          ]),
        ),
      ),
    );
  }
}
