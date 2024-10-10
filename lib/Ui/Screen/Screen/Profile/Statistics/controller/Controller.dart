import 'package:ataa/Core/Error/error.dart';
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
  var isLoading = false.obs;
  var isError = false.obs;
  ErrorX? error;

  var donationStatistics = Rxn<DonationStatisticsX>();
  var campaignStatistics = Rxn<CampaignStatisticsX>();
  var orderStatistics = Rxn<OrderStatisticsX>();
  var giftStatistics = Rxn<GiftStatisticsX>();
  var deductionStatistics = Rxn<DeductionStatisticsX>();
  var sponsorshipStatistics = Rxn<SponsorshipStatisticsX>();
  var shareLinkStatistics = Rxn<ShareLinkStatisticsX>();

  Future<void> fetchAllStatistics() async {
    isLoading.value = true;
    isError.value = false;
    error = null;

    int errorCount = 0;

    try {
      donationStatistics.value = await getDonationStatistics();
    } catch (e) {
      errorCount++;
      error=e.toErrorX;
    }

    try {
      campaignStatistics.value = await getCampaignStatistics();
    } catch (e) {
      errorCount++;
    }

    try {
      orderStatistics.value = await getOrderStatistics();
    } catch (e) {
      errorCount++;
    }

    try {
      giftStatistics.value = await getGiftStatistics();
    } catch (e) {
      errorCount++;
    }

    try {
      deductionStatistics.value = await getDeductionStatistics();
    } catch (e) {
      errorCount++;
    }

    try {
      sponsorshipStatistics.value = await getSponsorshipStatistics();
    } catch (e) {
      errorCount++;
    }

    try {
      shareLinkStatistics.value = await getShareLinkStatistics();
    } catch (e) {
      errorCount++;
    }

    isLoading.value = false;

    if (errorCount == 7) {
      throw error!;
    }
  }

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

  void retry() {
    fetchAllStatistics();
  }
}