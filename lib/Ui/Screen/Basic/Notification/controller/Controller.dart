import 'package:get/get.dart';
import '../../../../../Data/data.dart';

class NotificationsController extends GetxController {
  //============================================================================
  // Variables

  RxList<NotificationX> notifications = <NotificationX>[].obs;

  //============================================================================
  // Functions

  void getData() {
    /// Fetch data from internal storage because all notifications are kept on the device when they arrive
    notifications.value = [];

    /// TODO: Delete >>> this code after run notifications
    // notifications.value = TestDataX.notifications;
  }

  /// Delete all notifications from variables and internal storage
  void deleteAllNotifications() {
    notifications.value = [];
  }

  //============================================================================
  // Initialization

  @override
  void onInit() async {
    super.onInit();

    /// Fetch data when initializing the controller
    getData();

    /// This Delayed to Fix error in flutter
    Future.delayed(Duration.zero).then((value) {
      /// TODO: Clear the number of unread notifications
    });
  }
}
