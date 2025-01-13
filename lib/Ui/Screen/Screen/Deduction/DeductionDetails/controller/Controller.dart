import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Other/donateOnBehalfOfFamilyController.dart';
import '../../../../../../Data/Model/Deduction/deduction.dart';
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
  late RxBool isSubscribed;

  Rx<ButtonStateEX> subscriptionButtonState = ButtonStateEX.normal.obs;
  PageController imagesController = PageController();

  late Rx<VideoPlayerController> videoPlayerController;
  late ChewieController chewieController;
  late YoutubePlayerController youtubeController;
  RxBool isInitChewieController = false.obs;
  RxBool isInitYoutubeController = false.obs;
  RxBool hasErrorVideo = false.obs;

  //============================================================================
  // Functions

  getData() async {
    try {

      deduction = await DatabaseX.getDeductionDetails(id: id);
      isSubscribed = deduction.isSubscribed.obs;

      /// Init Video Player
      if (deduction.videoUrl.isNotEmpty && deduction.videoUrl.isURL) {
        final url = deduction.videoUrl;
        if (isYoutubeUrl(url)) {
          initYoutubePlayer(url);
        } else {
          initVideoPlayer(url);
        }
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> onSubscriptionDonation() async {
    (dynamic isOpenPayment, dynamic deductionAmount)? subscription =
    await subscriptionDeductionSheetX(deduction);
    if (subscription != null && subscription.$1 == true) {
      var isDone = await Get.toNamed(
        RouteNameX.deductionPayment,
        arguments: [
          deduction,
          deduction.isOpenPrice
              ? subscription.$2
              : deduction.initialPrice
        ],
      );
      if(isDone == true){
        isSubscribed.value = true;
      }
    }
  }

  int getNumCover() {
    return deduction.imageUrl.isNotEmpty && deduction.videoUrl.isNotEmpty? 2 : 1;
  }
  /// Check if the URL is a YouTube link
  bool isYoutubeUrl(String url) {
    return YoutubePlayer.convertUrlToId(url) != null;
  }

  /// Initialize YouTube Player
  initYoutubePlayer(String url) {
    try {
      isInitYoutubeController.value = false;
      youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          disableDragSeek: true,
          loop: true,
        ),
      );
      isInitYoutubeController.value = true;
    } catch (_) {
      hasErrorVideo.value = true;
    }
  }
  /// Initialize Video Player
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
  closePage(){
    try{
      Get.back(result: isSubscribed.value);
    }catch(_){
      Get.back();
    }
  }

  closePageResult(){
    try{
      // check if isSubscribed not initialization
      bool x = isSubscribed.value;
      return x;
    }catch(_){}
  }
  //============================================================================
  // Initialization

  @override
  void onClose() {
    try{
      if (deduction.videoUrl.isNotEmpty && deduction.videoUrl.isURL) {
        if (isInitChewieController.value) {
          chewieController.dispose();
          videoPlayerController.value.dispose();
        }
        if (isInitYoutubeController.value) {
          youtubeController.dispose();
        }
      }
    }catch(_){}
    super.onClose();
  }
}
