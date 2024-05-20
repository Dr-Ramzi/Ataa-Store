import 'dart:async';
import 'package:get/get.dart';
import '../../core.dart';

class ShaeControllerX extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  String shareUrl='';
  String shareMsg='';

  //============================================================================
  // Functions

  /// Get the share link
  shareLink(String link)async{
    try{
      /// If the user is logged in, a special link will be created for him
     if(app.isLogin.value){
       shareUrl = await createCustomLink(link);
     }else{
       shareUrl = link;
     }
     shareMsg = "${"Contribute with us in spreading goodness".tr}, \n$shareUrl";
    }catch(e){
      return Future.error(e);
    }
  }

  Future<String> createCustomLink(String link)async{
    try{
      /// TODO: Database >>> Create a custom link to share
      await Future.delayed(const Duration(seconds: 1));
      return link;
    }catch(e){
      return Future.error(e);
    }
  }
}