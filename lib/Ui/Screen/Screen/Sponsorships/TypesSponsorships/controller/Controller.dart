import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class TypesSponsorshipsController extends GetxController {

  //============================================================================
  // Functions

  onTapNewMuslim()=> Get.toNamed(RouteNameX.allSponsorships,arguments: {NameX.isNewMuslim:true});
  onTapEducationNewMuslim()=> Get.toNamed(RouteNameX.allSponsorships,arguments: {NameX.isEducationNewMuslim:true});
  onTapEducationQuran()=> Get.toNamed(RouteNameX.allSponsorships,arguments: {NameX.isEducationQuran:true});
  onTapPreachers()=> Get.toNamed(RouteNameX.allSponsorships,arguments: {NameX.isPreachers:true});

}