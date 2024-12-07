import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../Config/config.dart';
import '../../../../GeneralState/empty.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Notifications'),
      body: SafeArea(
        child: Obx(
          () {
            /// Empty State
            if (controller.notifications.isEmpty) {
              return Column(
                children: [
                  const EmptyView(message: "You have no new notifications.").fadeAnimation200,
                ],
              );
            } else {
              /// Main Content
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: StyleX.hPaddingApp,
                  vertical: StyleX.vPaddingApp,
                ),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    notification: controller.notifications[index],
                  ).fadeAnimation200;
                },
              );
            }
          },
        ),
      ),
      // /// Delete Button
      // floatingActionButton: Obx(
      //   () {
      //     /// Show the button only if there are notifications
      //     if (controller.notifications.isNotEmpty) {
      //       return FloatingActionButtonX(
      //         icon: Iconsax.trash,
      //         backgroundColor: ColorX.danger,
      //         onTap: () {
      //           bottomSheetDangerousX(
      //               icon: Icons.delete,
      //               onOk: controller.deleteAllNotifications,
      //               okText: "Delete",
      //               title: "Delete All Notifications",
      //               message:
      //                   "You are about to delete all notifications,are you sure you want to delete them?",
      //           );
      //         },
      //       ).fadeAnimation400;
      //     } else {
      //       return const SizedBox();
      //     }
      //   },
      // ),
    );
  }
}
