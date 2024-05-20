import 'package:get/get.dart';
import '../../../../../../Data/data.dart';

class ContactUsController extends GetxController {
  //============================================================================
  // Variables

  late ContactUsX contactUs;

  //============================================================================
  // Functions

  getData()async{
    try{
      /// TODO: Database >>> Get contact information
      await Future.delayed(const Duration(seconds: 1)); // delete this
      contactUs=TestDataX.contactUs;
    }catch(e){
      return Future.error(e);
    }
  }
}