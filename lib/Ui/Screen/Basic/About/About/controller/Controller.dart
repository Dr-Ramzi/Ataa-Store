import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Data/data.dart';

class AboutController extends GetxController {
  //============================================================================
  // Variables

  late PageX about;
  ScrollController scrollController = ScrollController();

  //============================================================================
  // Functions

  Future getData()async{
    try{
      about = await DatabaseX.getAboutPage();
    }catch(e){
      return Future.error(e);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
