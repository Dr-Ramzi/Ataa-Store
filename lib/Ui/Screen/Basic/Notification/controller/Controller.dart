import 'package:get/get.dart';
import '../../../../../Data/Model/Other/notification.dart';
import '../../../../../Data/data.dart';

class NotificationsController extends GetxController {
  //============================================================================
  // Functions

  Future<List<NotificationX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    return await DatabaseX.getAllNotifications(
        page: data.page,
        perPage: data.perPage,
      );
  }
}
