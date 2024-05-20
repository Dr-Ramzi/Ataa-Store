import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class PrivacyPolicyController extends GetxController {
  //============================================================================
  // Variables

  String privacyPolicy="";

  //============================================================================
  // Functions

  getData()async{
    try{
      /// TODO: Database >>> Fetch privacy policy data
      await Future.delayed(const Duration(seconds: 1)); // delete this
      privacyPolicy= TestDataX.privacyPolicy;
    }catch(e){
      return Future.error(e);
    }
  }
}