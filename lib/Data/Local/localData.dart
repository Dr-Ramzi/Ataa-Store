part of '../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Managing data stored internally on the client device
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class LocalDataX<T>{
  //============================================================================
  // Variables

  static late String route;
  static late SettingsX settings;

  static String get cartID => get(LocalKeyX.cartId,defaultData: LocalDefaultDataX.cartId);
  static bool get cartIdIsAssign => get(LocalKeyX.cartIdIsAssign,defaultData: LocalDefaultDataX.cartIdIsAssign);
  static String get token => get(LocalKeyX.token,defaultData: LocalDefaultDataX.token);

  static late int unreadNotifications;
  static late List<NotificationX> allNotifications;

  //============================================================================
  // Functions

  static Future<void> init() async {
    /// Recover data saved in phone case
    await HiveX.init();
    settings = SettingsX.fromJson(
      get(
        LocalKeyX.settings,
        defaultData:LocalDefaultDataX.settings.toJson(),
      ),
    );
    allNotifications = List<NotificationX>.from(
      get(LocalKeyX.allNotifications, defaultData:LocalDefaultDataX.allNotifications)
          .map(
            (json) => NotificationX.fromJson(json),
      ),
    );
    route = get(LocalKeyX.route, defaultData:LocalDefaultDataX.route)!;
  }

  static T get<T>(String kay, {T? defaultData}) {
    return HiveX.get<T>(kay, defaultData)!;
  }

  static void put<T>(String kay, T data , {Duration? maxAge}) {
    HiveX.put(data: data, key: kay , maxAge: maxAge);
  }

  static void remove(String kay) {
    HiveX.remove(kay);
  }
}