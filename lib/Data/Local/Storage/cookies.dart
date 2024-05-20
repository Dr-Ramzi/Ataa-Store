part of '../../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Data storage and management via web cookies
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class CookieX{
  //============================================================================
  // Variables

  static const int maxAge =2592000; /// 2592000 sec = 30 days.

  //============================================================================
  // Functions

  static remove(String key) {
    html.document.cookie = "$key=; max-age=$maxAge; path=/;";
  }

  static void put({required String key, required String value}) {
    html.document.cookie = "$key=$value; max-age=$maxAge; path=/;";
  }

  static String get(String key,{required String defaultValue}) {
    String? cookies = html.document.cookie??'';
    if(cookies!=''){
      List<String> listValues = cookies.split(";");
      String? matchVal;
      for (int i = 0; i < listValues.length; i++) {
        List<String> map = listValues[i].split("=");
        String key1 = map[0].trim();
        String val = map[1].trim();
        if (key == key1) {
          matchVal = val;
          break;
        }
      }
      return matchVal??defaultValue;
    }
    return defaultValue;
  }
}