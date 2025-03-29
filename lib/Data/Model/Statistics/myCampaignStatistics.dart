import 'package:ataa/Core/Extension/convert/convert.dart';
import '../../../Core/Helper/model/model.dart';
import '../../data.dart';

class CampaignStatisticsX {
  CampaignStatisticsX({
    required this.countCampaigns,
    required this.countCampaignVisits,
    required this.countCampaignDonating,
    required this.totalAmountCampaign,
  });

  int countCampaigns;
  int countCampaignVisits;
  int countCampaignDonating;
  double totalAmountCampaign;


  factory CampaignStatisticsX.fromJson(Map<String, dynamic> json) {
    return ModelUtilX.checkFromJson(
        json,
            (json) => CampaignStatisticsX(
              countCampaigns: json[NameX.countCampaigns].toIntX,
              countCampaignVisits: json[NameX.countCampaignVisits].toIntX,
              countCampaignDonating: json[NameX.countCampaignDonating].toIntX,
              totalAmountCampaign: json[NameX.totalAmountCampaign].toDoubleX,
        ),
        requiredAnyDataOfKeys: [
          [
            NameX.countCampaigns,
            NameX.countCampaignVisits,
            NameX.countCampaignDonating,
            NameX.totalAmountCampaign,
          ]
        ]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.countCampaigns: countCampaigns,
      NameX.countCampaignVisits: countCampaignVisits,
      NameX.countCampaignDonating: countCampaignDonating,
      NameX.totalAmountCampaign: totalAmountCampaign,
    };
  }
}
