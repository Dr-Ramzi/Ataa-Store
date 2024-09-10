import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Data/data.dart';
import '../../../Ui/Widget/widget.dart';

class PreviewDedicateControllerX  extends GetxController {
  //============================================================================
  // Variables

  GiftingX gifting = GiftingX.empty();
  String imageUrl='';
  String message='';
  String url='';

  RxBool isImage = true.obs;
  final previewVia = ValueNotifier(1);

  //============================================================================
  // Functions

  getDate()async{
    try{
      /// TODO: Database >>> Fetch the gift offer data
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// Fake data
      imageUrl="https://github.com/SakerDakak/Images/blob/main/dedications-card-1.png?raw=true";
      message="Congratulations on your graduation, our dear graduate. On this occasion, I donated 1,000 riyals on your behalf via the Ataa platform.\n\nFrom: Abdulaziz Salman Ali";
      url="https://donate.edialoguec.org.sa/gift/3245";

    }catch(e){
      return Future.error(e);
    }
  }

  /// Move the user to the gift link
  onTapUrl()async{
    try{
      await launchUrl(Uri.parse(url));
    }catch(e){
      ToastX.error(message: "There is an error the link cannot be opened.\nTry again");
    }
  }

  //============================================================================
  // Initialization

  @override
  void onInit() {
    super.onInit();

    /// listener if change tap is image or massage
    previewVia.addListener(() {
      isImage.value = previewVia.value == 1;
    });
  }
}