import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
  //============================================================================
  // Variables

  late PageX privacyPolicy;

  //============================================================================
  // Functions

  Future getData()async{
    try{
      privacyPolicy = await DatabaseX.getPrivacyPolicyPage();
    }catch(e){
      return Future.error(e);
    }
  }
}