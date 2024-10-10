import 'package:ataa/Data/Model/ContactUs/contactUsSocialMedia.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../Data/Model/ContactUs/contactUs.dart';
import '../../../../../../Data/data.dart';

class ContactUsController extends GetxController {
  //============================================================================
  // Variables

  late ContactUsX contactUs;
  late ContactUsSocialMediaX socialMedia;
  late PageX page;

  //============================================================================
  // Functions

  Future getData() async {
    try {
      contactUs = await DatabaseX.getContactUs();
      socialMedia = await DatabaseX.getContactUsSocialMedia();
      page = await DatabaseX.getContactUsPage();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> openUrl(Uri uri) async {
    try {
      await launchUrl(uri);
    } catch (_) {}
  }

  Future<void> onTapMobile() async {
    final Uri uri = Uri(scheme: 'tel', path: contactUs.mobile.toString());
    await openUrl(uri);
  }

  Future<void> onTapWhatsapp() async {
    final Uri uri = Uri.parse("whatsapp://send?phone=${contactUs.whatsappNumber}");
    await openUrl(uri);
  }

  Future<void> onTapEmail() async {
    final Uri uri = Uri(scheme: 'mailto', path: contactUs.email!);
    await openUrl(uri);
  }

  Future<void> onTapSite() async {
    final Uri uri = Uri.parse(socialMedia.siteUrl!.startsWith('http') ? socialMedia.siteUrl! : 'https://${socialMedia.siteUrl}');
    await openUrl(uri);
  }

  Future<void> onTapTwitter() async {
    final Uri uri = Uri.parse(socialMedia.twitterUrl!);
    await openUrl(uri);
  }

  Future<void> onTapSnapchat() async {
    final Uri uri = Uri.parse(socialMedia.snapchatUrl!);
    await openUrl(uri);
  }

  Future<void> onTapFacebook() async {
    final Uri uri = Uri.parse(socialMedia.facebookUrl!);
    await openUrl(uri);
  }

  Future<void> onTapInstagram() async {
    final Uri uri = Uri.parse(socialMedia.instagramUrl!);
    await openUrl(uri);
  }

  Future<void> onTapYoutube() async {
    final Uri uri = Uri.parse(socialMedia.youtubeUrl!);
    await openUrl(uri);
  }
}
