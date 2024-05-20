import 'package:get/get.dart';
import '../../../../../../../Core/Controller/Create/addShareLinkController.dart';
import '../../../../../../../Data/data.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../../../../../ScreenSheet/Create/AddShareLink/addShareLinkSheet.dart';

class SharingLinksController extends GetxController {
  //============================================================================
  // Injection of required controls

  final AddShareLinkControllerX addShareLinkController = Get.put(AddShareLinkControllerX());

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  RxList<ShareLinkX> shareLinks =<ShareLinkX>[].obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >> Fetch my sharing Links
      await Future.delayed(const Duration(seconds: 1)); // delete this

      shareLinks.value=TestDataX.shareLinks;
    } catch (e) {
      return Future.error(e);
    }
  }

  onAddShareLink() async {
    if (isLoading.isFalse) {
      isLoading.value = true;
      try {
        /// A sheet is displayed below for entering data and creating a new share link
        var newLink = await addShareLinkSheetX(controller: addShareLinkController);
        /// It is checked whether a share link has been created or not
        if(newLink!=null){
          /// Add to share links list
          shareLinks.add(newLink);
        }
      } catch (e) {
        ToastX.error(message: e.toString());
      }
      isLoading.value = false;
    }
  }
}