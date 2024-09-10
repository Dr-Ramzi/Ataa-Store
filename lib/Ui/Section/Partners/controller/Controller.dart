import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Data/data.dart';

class PartnersController extends GetxController {
  Future<List<PartnerX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    try {
      List<PartnerX> results = await DatabaseX.getPartners(
        page: data.page,
        perPage: data.perPage,
      );
      return results;
    } catch (e) {
      return Future.error(e);
    }
  }
  void onTap(PartnerX partner) async {
    try {
      if(partner.externalUrl.isNotEmpty) {
        await launchUrl(
          Uri.parse(partner.externalUrl));
      }
    } catch (_) {}
  }
}