import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/Constant/navbarItems.dart';
import '../../../../../UI/Widget/widget.dart';
import '../../../Screen/QuickDonation/controller/Controller.dart';
import '../../../Screen/QuickDonation/view/View.dart';

class RootController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  QuickDonationController quickDonationController =
      Get.put(QuickDonationController());

  //============================================================================
  // Variables

  RxInt indexPageSelected = 0.obs;
  List<RootPageX> pages = navBarItems;
  RxBool isMoreDynamicPage = false.obs;

  //============================================================================
  // Functions

  isHomePage() => indexPageSelected.value == 0;
  isMorePage() => indexPageSelected.value == 3;
  changeMoreDynamicPage() => isMoreDynamicPage.value = !isMoreDynamicPage.value;
  appBarTitle() {
    if (indexPageSelected.value == 1) {
      return "Donation opportunities";
    } else if (isMoreDynamicPage.isTrue && indexPageSelected.value == 3) {
      return 'More Pages';
    }  else if (indexPageSelected.value != 0) {
      return pages[indexPageSelected.value].label;
    } else {
      /// So that a title does not appear when the home page is open
      return "";
    }
  }

  onItemSelected(int index) {
    /// To disable the hidden button below the quick donate button
    if (!(app.generalSettings.isActiveQuickDonation && index == 2)) {
      indexPageSelected.value = index;
    }
  }

  returnPage() => pages[indexPageSelected.value].view;

  openDonations() => onItemSelected(1);
  openNotification() => Get.toNamed(RouteNameX.notifications);
  openSettings() => Get.toNamed(RouteNameX.settings);

  openQuickDonation({bool isFromAction = false}) async {
    /// Fix init screen on Quick Action
    if (isFromAction) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    /// Check if it is already open
    if (Get.isBottomSheetOpen != true) {
      bottomSheetX(
        title: "Quick Donation",
        child: QuickDonationView(controller: quickDonationController),
        isPaddingBottom: false,
      );
    }
  }

  //============================================================================
  // Initialization

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init()async{
    /// Initialize quick actions
    // await QuickActionX.init();
    if(!app.generalSettings.isActiveQuickDonation){
      pages.removeAt(2);
    }
  }
}
