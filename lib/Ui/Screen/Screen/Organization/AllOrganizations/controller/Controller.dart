import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class AllOrganizationsController extends GetxController {
  //============================================================================
  // Variables

  List<OrganizationX> organizations =[];

  //============================================================================
  // Functions

   getData()async{
     try{
       /// TODO: Database >>> Fetch All organizations
       await Future.delayed(const Duration(seconds: 1)); // delete thia

       organizations= TestDataX.organizations;

     }catch(e){
       return Future.error(e);
     }
   }

   onTap(OrganizationX org) => Get.toNamed(RouteNameX.organizationDetails,arguments: org);

}