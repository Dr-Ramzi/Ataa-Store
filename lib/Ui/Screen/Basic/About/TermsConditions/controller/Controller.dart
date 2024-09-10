import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class TermsConditionsController extends GetxController {
  //============================================================================
  // Variables

  late PageX termsConditions;

  //============================================================================
  // Functions

  Future<void> getData()async{
    try{
      termsConditions = await DatabaseX.getTermsAndConditionsPage();
    }catch(e){
      return Future.error(e);
    }
  }
}