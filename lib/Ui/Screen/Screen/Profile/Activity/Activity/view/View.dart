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
      appBar: AppBarX(title: "My Activity",actions: [CartIconButtonsX()],),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp,vertical:StyleX.vPaddingApp),
          child: OptionsGroupCardX(options: [
            OptionCardX(title: "Register My Donations", icon: Icons.favorite_rounded,onTap: controller.onDonations,),
            /// TODO: Show >>> My Orders
            // OptionCardX(title: "My Orders", icon: Icons.shopping_bag_rounded,onTap: controller.onOrders,),
            /// TODO: Show >>> My Gifting
            OptionCardX(title: "My Gifting", icon: IconX.gift,onTap: controller.onGifting,),
            /// TODO: Show >>> My Campaigns
            // OptionCardX(title: "My Campaigns", icon: IconX.speakerPhone,onTap: controller.onCampaigns,),
            /// TODO: Show >>> My Deductions
            // OptionCardX(title: "My Deductions", icon: IconX.creditCard,onTap: controller.onDeductions,),
            /// TODO: Show >>> My Sponsorships
            // OptionCardX(title: "My Sponsorships", icon: Icons.thumb_up_alt_rounded,onTap: controller.onSponsorships,),
            OptionCardX(title: "Cart", icon: Icons.shopping_cart_rounded,onTap: controller.onGivingCart,),
            OptionCardX(title: "Sharing Links", icon: Icons.share_rounded,onTap: controller.onSharingLinks,),
            OptionCardX(title: "Payment cards", icon: IconX.creditCard,onTap: controller.onPaymentCards,),
            OptionCardX(title: "Notifications", icon: Icons.notifications_rounded,onTap: controller.onNotifications,isBottomLine: false,),
          ]),
        ),
      ),
    );
  }
}
