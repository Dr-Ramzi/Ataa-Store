import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class MoreSectionsView extends GetView<MoreSectionsController> {
  const MoreSectionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
            vertical: StyleX.vPaddingApp,
        ),
        child: Column(
          children: [
            MoreCardX(title: "Association programs", icon: Icons.work_rounded,onTap: controller.onAssociationPrograms,).fadeAnimation200,
            MoreCardX(title: "Guarantees", icon: Icons.thumb_up_rounded,onTap: controller.onGuarantees,).fadeAnimation200,
            MoreCardX(title: "Dedications", icon: Icons.card_giftcard_rounded,onTap: controller.onDedications,).fadeAnimation300,
            MoreCardX(title: "Deductions", icon: Icons.credit_card_rounded,onTap: controller.onDeductions,).fadeAnimation300,
            MoreCardX(title: "Zakat", icon: Icons.verified,onTap: controller.onZakat,).fadeAnimation400,
            MoreCardX(title: "User campaigns", icon: Icons.campaign_rounded,onTap: controller.onUserCampaigns,).fadeAnimation400,
          ],
        ),
      ),
    );
  }
}
