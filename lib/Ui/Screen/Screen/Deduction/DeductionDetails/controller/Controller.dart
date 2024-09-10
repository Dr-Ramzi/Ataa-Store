import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../Core/Controller/Other/donateOnBehalfOfFamilyController.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Pay/SubscriptionDeduction/subscriptionDeductionSheet.dart';

class DeductionDetailsController extends GetxController {
  //============================================================================
  // Injection of required controls

  DonateOnBehalfOfFamilyController donateOnBehalfOfFamilyController =
      Get.put(DonateOnBehalfOfFamilyController(), tag: Get.arguments);

  //============================================================================
  // Variables

  final id = Get.arguments; // The ID is sent from the previous page
  late DeductionX deduction;

  Rx<ButtonStateEX> subscriptionButtonState = ButtonStateEX.normal.obs;
  PageController imagesController = PageController();

  late Rx<VideoPlayerController> videoPlayerController;
  late ChewieController chewieController;
  RxBool isInitChewieController = false.obs;
  RxBool hasErrorVideo = false.obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch deduction details
      await Future.delayed(const Duration(seconds: 1));

      /// delete this
      deduction = TestDataX.deductions.firstWhere((element) => element.id == id);

      /// Init Video Player
      if (deduction.videoURL.isNotEmpty && deduction.videoURL.isURL) {
        initVideoPlayer(deduction.videoURL);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  onSubscriptionDeduction() async =>
      await subscriptionDeductionSheetX(deduction);

  int getNumCover() {
    return deduction.imageURL.isNotEmpty && deduction.videoURL.isNotEmpty? 2 : 1;
  }

  initVideoPlayer(String url) async {
    try {
      isInitChewieController.value = false;
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url)).obs;
      await videoPlayerController.value.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController.value,
        autoPlay: false,
        looping: false,
        allowPlaybackSpeedChanging: false,
        hideControlsTimer: const Duration(seconds: 1),
        controlsSafeAreaMinimum: const EdgeInsets.only(bottom: 14),
      );
      isInitChewieController.value = true;
    } catch (_) {
      hasErrorVideo.value = true;
    }
  }

  //============================================================================
  // Initialization

  @override
  void onClose() {
    if (deduction.videoURL.isNotEmpty && deduction.videoURL.isURL) {
      chewieController.dispose();
      videoPlayerController.value.dispose();
    }
    super.onClose();
  }
}
