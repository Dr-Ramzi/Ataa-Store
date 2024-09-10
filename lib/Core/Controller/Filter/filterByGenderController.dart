import 'package:get/get.dart';

class FilterByGenderControllerX extends GetxController {
  //============================================================================
  // Variables

  RxString genderSelected="All".obs;
  List<String> options=["All","Male","Female"];

  //============================================================================
  // Functions

  onChange(String? val){
    genderSelected.value=val??"";
    Get.back();
  }

}