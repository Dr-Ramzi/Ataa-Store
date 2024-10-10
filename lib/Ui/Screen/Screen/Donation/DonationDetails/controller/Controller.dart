import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../Core/Controller/Other/donateOnBehalfOfFamilyController.dart';
import '../../../../../../Data/Model/Donation/donation.dart';
import '../../../../../../Data/data.dart';
import '../../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';

class DonationDetailsController extends GetxController {
  //============================================================================
  // Injection of required controls

  DonateOnBehalfOfFamilyController donateOnBehalfOfFamilyController = Get.put(
      DonateOnBehalfOfFamilyController(),
      tag: Get.arguments.toString());

  //============================================================================
  // Variables

  final int code = Get.arguments; // The Code is sent from the previous page
  late DonationX donation;

  Rx<ButtonStateEX> payDonationButtonState = ButtonStateEX.normal.obs;
  Rx<ButtonStateEX> addToCartButtonState = ButtonStateEX.normal.obs;

  PageController imagesController = PageController();

  late Rx<VideoPlayerController> videoPlayerController;
  late ChewieController chewieController;
  RxBool isInitChewieController = false.obs;
  RxBool hasErrorVideo = false.obs;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// Get donation details from database
      donation = await DatabaseX.getDonationDetails(code: code);

      /// Init Video Player
      if (donation.donationDetails.videoUrl!=null && donation.donationDetails.videoUrl!.isURL) {
        initVideoPlayer(donation.donationDetails.videoUrl!);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  onPayDonation() async => await payDonationSheet(donation);
  onDonationAddToCart() async =>
      await payDonationSheet(donation, onlyAddToCart: true);

  int getNumCover() {
    return donation.donationDetails.imageUrl!=null && donation.donationDetails.videoUrl!=null? 2 : 1;
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
    if (donation.donationDetails.videoUrl!=null && donation.donationDetails.videoUrl!.isURL) {
      chewieController.dispose();
      videoPlayerController.value.dispose();
    }
    super.onClose();
  }
}
