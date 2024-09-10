import 'package:get/get.dart';
import '../../../../../../Data/Model/Statistics/campaignStatistics.dart';
import '../../../../../../Data/Model/Statistics/deductionStatistics.dart';
import '../../../../../../Data/Model/Statistics/donationStatistics.dart';
import '../../../../../../Data/Model/Statistics/giftStatistics.dart';
import '../../../../../../Data/Model/Statistics/orderStatistics.dart';
import '../../../../../../Data/Model/Statistics/shareLinkStatistics.dart';
import '../../../../../../Data/Model/Statistics/sponsorshipStatistics.dart';
import '../../../../../../Data/data.dart';

class StatisticsController extends GetxController {
  //============================================================================
  // Functions

  Future<DonationStatisticsX> getDonationStatistics() async {
    return await DatabaseX.getDonationStatistics();
  }

  Future<CampaignStatisticsX> getCampaignStatistics() async {
    return await DatabaseX.getCampaignStatistics();
  }

  Future<OrderStatisticsX> getOrderStatistics() async {
    return await DatabaseX.getOrderStatistics();
  }

  Future<GiftStatisticsX> getGiftStatistics() async {
    return await DatabaseX.getGiftStatistics();
  }

  Future<DeductionStatisticsX> getDeductionStatistics() async {
    return await DatabaseX.getDeductionStatistics();
  }

  Future<SponsorshipStatisticsX> getSponsorshipStatistics() async {
    return await DatabaseX.getSponsorshipStatistics();
  }

  Future<ShareLinkStatisticsX> getShareLinkStatistics() async {
    return await DatabaseX.getShareLinkStatistics();
  }
}
