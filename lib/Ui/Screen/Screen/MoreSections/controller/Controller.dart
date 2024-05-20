import 'package:get/get.dart';
import '../../../../../Config/config.dart';

class MoreSectionsController extends GetxController {

  //============================================================================
  // Functions
  
  onAssociationPrograms() => Get.toNamed(RouteNameX.allOrganizations);

  onGuarantees() => Get.toNamed(RouteNameX.typesGuarantees);

  onDedications() => Get.toNamed(RouteNameX.dedications);

  onDeductions() => Get.toNamed(RouteNameX.allDeductions);

  onZakat() => Get.toNamed(RouteNameX.zakat);

  onUserCampaigns() => Get.toNamed(RouteNameX.allCampaigns);
  
}