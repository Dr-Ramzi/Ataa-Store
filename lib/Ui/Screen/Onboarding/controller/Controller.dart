import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Config/config.dart';
import '../../../../Data/data.dart';

class OnboardingController extends GetxController {
  //============================================================================
  // Variables

  RxInt cardIndex = 0.obs;
  final List<String> cardsTitle = OnboardingX.titles;
  final List<String> cardsSubtitle = OnboardingX.subtitles;
  final Rx<PageController> cardController = PageController().obs;

  //============================================================================
  // Functions

  onNext() {
    /// If the cards run out, the skip is triggered
    if (cardIndex.value == cardsTitle.length - 1) {
      onSkip();
    } else {
      cardController.value.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  onSkip() {
    /// Save the path when you log in, so it doesn't appear again
    LocalDataX.put(LocalKeyX.route, RouteNameX.login);
    Get.offAllNamed(RouteNameX.login);
  }

  /// Get the name of the button
  buttonText(){
    if (cardIndex.value == cardsTitle.length - 1) {
      return "Start Now";
    } else {
      return "Next";
    }
  }
}
