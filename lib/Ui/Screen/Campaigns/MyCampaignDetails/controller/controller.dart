import 'package:get/get.dart';

import '../../../../../Config/Translation/translation.dart';
import '../../../../../Data/Enum/linkable_type_status.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/ScreenSheet/Other/Share/shareSheet.dart';
import 'package:intl/date_symbol_data_local.dart';

class MyCampaignDetailsController extends GetxController {
  //============================================================================
  // Injection of required controls

  //============================================================================
  // Variables

  final CampaignX campaign = Get.arguments;

  //============================================================================
  // Functions

  openShare() async {
    await shareSheet(
      id: campaign.id,
      code: campaign.code,
      type: LinkableTypeStatusX.campaign,
    );
  }

  //============================================================================
  // Initialization

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting(TranslationX.getLanguageCode, null);
  }
}