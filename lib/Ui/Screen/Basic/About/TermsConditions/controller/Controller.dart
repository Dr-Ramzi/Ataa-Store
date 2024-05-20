import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class TermsConditionsController extends GetxController {
  //============================================================================
  // Variables

  String termsConditions="";

  //============================================================================
  // Functions

  getData()async{
    try{
      /// TODO: Database >>> Fetch Terms and Conditions data
      await Future.delayed(const Duration(seconds: 1)); // delete this
      termsConditions=TestDataX.termsConditions;
    }catch(e){
      return Future.error(e);
    }
  }
}