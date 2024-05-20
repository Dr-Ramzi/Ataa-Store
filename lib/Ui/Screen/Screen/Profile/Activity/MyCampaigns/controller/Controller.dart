import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Data/data.dart';

class MyCampaignsController extends GetxController {
  //============================================================================
  // Variables

  List<CampaignX> campaigns = [];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch All My Campaigns
      await Future.delayed(const Duration(seconds: 1)); // delete this

      campaigns = TestDataX.campaigns;
    } catch (e) {
      return Future.error(e);
    }
  }

  createCampaign() => Get.toNamed(RouteNameX.createCampaign);

  onTapCampaign(String id) =>
      Get.toNamed(RouteNameX.campaignDetails, arguments: id);
}
