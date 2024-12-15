import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Data/Model/Other/notification.dart';
import '../../../../Widget/Basic/Other/scrollRefreshLoadMore.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Notifications'),
      body: SafeArea(
        child: ScrollRefreshLoadMoreX<NotificationX>(
          fetchData: controller.getData,
          pageSize: 20,
          initLoading: Column(
            children: [
              for (int i = 0; i < 10; i++)
                const ShimmerAnimationX(
                  height: 100,
                  margin: EdgeInsets.symmetric(vertical: 5),
                )
            ],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
            vertical: StyleX.vPaddingApp,
          ),
          emptyMessage: "You have no new notifications.",
          itemBuilder: (data, index) {
            return NotificationCard(
              notification: data,
            ).fadeAnimation200;
          },
        ),
      ),
    );
  }
}
