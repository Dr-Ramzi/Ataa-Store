import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class TypesGuaranteesController extends GetxController {

  //============================================================================
  // Functions

  onTapNewMuslim()=> Get.toNamed(RouteNameX.allGuarantees,arguments: {NameX.isNewMuslim:true});
  onTapEducationNewMuslim()=> Get.toNamed(RouteNameX.allGuarantees,arguments: {NameX.isEducationNewMuslim:true});
  onTapEducationQuran()=> Get.toNamed(RouteNameX.allGuarantees,arguments: {NameX.isEducationQuran:true});
  onTapPreachers()=> Get.toNamed(RouteNameX.allGuarantees,arguments: {NameX.isPreachers:true});

}