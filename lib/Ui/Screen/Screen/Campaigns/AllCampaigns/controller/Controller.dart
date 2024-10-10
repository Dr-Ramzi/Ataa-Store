import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Filter/filterController.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/Model/Donation/donation.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Filter/GeneralFilter/generalFilterSheet.dart';
import '../../../../../ScreenSheet/Other/MandatoryAuth/mandatoryAuth.dart';
import '../../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class AllCampaignsController extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  FilterControllerX filterController = Get.put(FilterControllerX(tag: "All Campaigns"),tag: "All Campaigns");

  //============================================================================
  // Variables

  TextEditingController search = TextEditingController();
  List<CampaignX> campaigns = [];
  List<DonationX> donations = [];
  RxList<CampaignX> campaignsResult = <CampaignX>[].obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch campaigns
      /// TODO: Database >>>  Fetch donations
      await Future.delayed(const Duration(seconds: 1)); // delete this

      campaigns = TestDataX.campaigns;
      for(int i=0;i<campaigns.length;i++){
        // donations.add(TestDataX.donations.firstWhere((x) => x.modelId==campaigns[i].donationID));
      }

      campaignsResult.value = campaigns;

      /// If he moves to another screen and returns here and there was a previous search,
      /// it will return the results of the last search
      if (search.text.isNotEmpty) {
        onFilter();
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter()async{
    bool? result = await generalFilterSheetX(controller: filterController);
    if(result==true){
      /// TODO: Database >>> Add a campaign filter
      /// TODO: Algorithm >>> Add a campaign filter
      onSearching(search.text);
    }
  }

  onSearching(String search) async {
    /// TODO: Expected Condition >>> Change the search code if you want to retrieve search results from the database
    try {
      /// clean search text from withe space and convert all char to lower case for contains with campaign data
      search = search.toLowerCase().trimLeft().trimRight();

      /// Bring all campaigns that partially or completely match the name
      campaignsResult.value = campaigns
          .where(
            (campaign) => campaign.title.toLowerCase().contains(search),
          )
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------

  onTapCampaign(String id) =>
      Get.toNamed(RouteNameX.campaignDetails, arguments: id);

  onCampaignDonation(CampaignX campaign) async {
    await payDonationSheet(donations.firstWhere((x) => x.id==campaign.donationID),campaign:campaign);
  }

  onAddToCart(campaign) async {
    await payDonationSheet(donations.firstWhere((x) => x.id==campaign.donationID),campaign:campaign, onlyAddToCart: true);
  }

  createCampaign(){
    if(app.isLogin.value){
      Get.toNamed(RouteNameX.createCampaign);
    }else{
      mandatoryAuthSheetX();
    }
  }

}
