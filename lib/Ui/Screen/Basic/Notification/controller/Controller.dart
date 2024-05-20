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
    notifications.value = LocalDataX.allNotifications.reversed.toList();

    /// TODO: Delete >>> this code after run notifications
    notifications.value = TestDataX.notifications;
  }

  /// Delete all notifications from variables and internal storage
  void deleteAllNotifications() {
    notifications.value = [];
    LocalDataX.allNotifications = [];
    LocalDataX.put(LocalKeyX.allNotifications, []);
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
      /// Clear the number of unread notifications
      LocalDataX.put(LocalKeyX.unreadNotifications, 0);
    });
  }
}
