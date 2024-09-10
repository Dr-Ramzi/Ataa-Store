import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class AllOrganizationsController extends GetxController {
  //============================================================================
  // Functions

  Future<List<OrganizationX>> getData(ScrollRefreshLoadMoreParametersX data) async {
     try{
       return await DatabaseX.getAllOrganizations(page: data.page, perPage: data.perPage);
     }catch(e){
       return Future.error(e);
     }
   }

   onTap(OrganizationX org) => Get.toNamed(RouteNameX.organizationDetails,arguments: org);

}