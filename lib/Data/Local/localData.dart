part of '../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Managing data stored internally on the client device
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class LocalDataX {
  //============================================================================
  // Variables

  static late String route;
  static late SettingsX settings;

  static String get token => get(LocalKeyX.token, LocalDefaultDataX.token);
  static String get userID => get(LocalKeyX.userID, LocalDefaultDataX.userID);

  static late int unreadNotifications;
  static late List<NotificationX> allNotifications;

  //============================================================================
  // Functions

  static Future<void> init() async {
    /// Recover data saved in web state
    if (kIsWeb) {
      settings = SettingsX.fromJson(
        Map<String, dynamic>.from(
          json.decode(
            get(
              LocalKeyX.settings,
              json.encode(LocalDefaultDataX.settings.toJson()),
            ),
          ),
        ),
      );
      allNotifications = List<NotificationX>.from(
        json
            .decode(
              get(
                LocalKeyX.allNotifications,
                json.encode(LocalDefaultDataX.allNotifications),
              ),
            )
            .map(
              (json) => NotificationX.fromJson(json),
            ),
      );
    } else {
      /// Recover data saved in phone case
      await HiveX.initialize();
      settings = SettingsX.fromJson(
        get(
          LocalKeyX.settings,
          LocalDefaultDataX.settings.toJson(),
        ),
      );
      allNotifications = List<NotificationX>.from(
        get(LocalKeyX.allNotifications, LocalDefaultDataX.allNotifications)
            .map(
          (json) => NotificationX.fromJson(json),
        ),
      );
    }
    route = get(LocalKeyX.route, LocalDefaultDataX.route);
    unreadNotifications = int.parse(get(
      LocalKeyX.unreadNotifications,
      LocalDefaultDataX.unreadNotifications.toString(),
    ).toString());
  }

  //============================================================================
  // Basic Functions

  static remove(String kay) {
    if (kIsWeb) {
      CookieX.remove(kay);
    } else {
      HiveX.remove(kay);
    }
  }

  static get(String kay, var defaultData) {
    if (kIsWeb) {
      return CookieX.get(kay, defaultValue: defaultData);
    } else {
      return HiveX.get(kay, defaultValue: defaultData);
    }
  }

  static put(String kay, data) {
    if (kIsWeb) {
      CookieX.put(value: data, key: kay);
    } else {
      HiveX.put(val: data, kay: kay);
    }
  }
}
