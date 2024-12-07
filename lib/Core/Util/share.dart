part of '../core.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this Util }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Manage sharing with other applications
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class ShareX{
  static Future<String?> share({required ShareOn share,required String msg,required String url}) async {
    try {
      String? response;
      // final FlutterShareMe flutterShareMe = FlutterShareMe();
      switch (share) {
        case ShareOn.facebook:
          try {
            await launchUrl(Uri.parse("https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(url)}&t=$msg"));
          } catch (_) {}
          // response = await flutterShareMe.shareToFacebook(url: url, msg: msg);
          break;
        case ShareOn.twitter:
          // response = await flutterShareMe.shareToTwitter(url: url, msg: msg);
          break;
        case ShareOn.whatsapp:
          // response = await flutterShareMe.shareToWhatsApp(msg: msg);
          break;
        case ShareOn.shareSystem:
          // response = await flutterShareMe.shareToSystem(msg: msg);
          break;
        case ShareOn.telegram:
          // response = await flutterShareMe.shareToTelegram(msg: msg);
          break;
      }
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}

/// Sharing Platform
enum ShareOn {
  facebook,
  twitter,
  whatsapp,
  telegram,
  shareSystem,
}