import 'package:ataa/UI/Animation/animation.dart';
import 'package:ataa/Ui/Widget/Basic/Utils/future_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Config/config.dart';
import '../../../../Core/Controller/Other/previewDedicateController.dart';
import '../../../Widget/Custom/Card/giftCardForGifting.dart';
import '../../../Widget/widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this bottom sheet }}~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Preview the gifting before paying
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

previewDedicateSheetX({required PreviewDedicateControllerX controller}) {
  return bottomSheetX(
    title: "Preview the gifting",
    child: Obx(
          () => Column(
        children: [
          /// Display type tabs
          ClipRRect(
            borderRadius: BorderRadius.circular(StyleX.radius),
            child: SizedBox(
              width: double.maxFinite,
              child: AdvancedSegment<int, String>(
                controller: controller.previewVia,
                segments: {
                  1: 'Gift Card'.tr,
                  2: 'Text Message'.tr,
                },
                activeStyle: TextStyleX.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: FontX.fontFamily),
                inactiveStyle: TextStyleX.titleMedium.copyWith(
                    fontWeight: FontWeight.w600, fontFamily: FontX.fontFamily),
                backgroundColor: Get.context!.isDarkMode
                    ? Theme.of(Get.context!).cardColor
                    : ColorX.grey.shade100,
                sliderColor: Theme.of(Get.context!).primaryColor,
                borderRadius: BorderRadius.zero,
                itemPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 17,
                ),
                sliderOffset: 0,
                shadow: const [],
              ).fadeAnimation200,
            ),
          ),

          /// Show the gifting image
          if (controller.isCard.value)
            ContainerX(
              maxHeight: 500,
              minHeight: 400,
              padding: const EdgeInsets.all(16),
              child: GiftCardForGiftingX(
                isPreview: true,
                radius: 26,
                borderWidth: 7,
                nameFrom: controller.nameFrom,
                nameTo: controller.nameTo,
                amount: controller.amount,
                isShowAmount: controller.isShowAmount,
                orgName: controller.orgName,
                color: controller.color,
                giftCardFormByGender: controller.giftCardFormByGender,
              ),
            ).fadeAnimation300,

          /// Show the gifting message
          if (!controller.isCard.value)
            Container(
              constraints: const BoxConstraints(
                maxHeight: 500,
                minHeight: 400,
              ),
              child: Column(
                children: [
                  FutureBuilderX(
                    future: controller.getDate,
                    loading: ShimmerAnimationX(
                      height: 200,
                      width: double.maxFinite,
                      borderRadius: BorderRadius.circular(StyleX.radius),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: (data) => ContainerX(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      color: Get.theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// message
                          MessageText(
                            message:controller.getMessageString(),
                          ),
                        ],
                      ),
                    ).fadeAnimation300,
                  ),
                ],
              ),
            ),

          /// Close Button
          ButtonX.gray(
            text: "Close",
            onTap: Get.back,
            marginVertical: 0,
          ).marginOnly(bottom: 6)
        ],
      ),
    ),
  );
}

class MessageText extends StatelessWidget {
  final String message;

  const MessageText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      _buildMessageWithLinks(message),
      style: TextStyleX.titleMedium.copyWith(color: ColorX.primary,fontFamily: FontX.fontFamily),
    );
  }

  TextSpan _buildMessageWithLinks(String message) {
    final RegExp linkRegExp = RegExp(
      r'((https?:\/\/)?(www\.)?[^\s]+\.[^\s]{2,})', // نمط الروابط المعدل
      caseSensitive: false, // تجاهل حالة الأحرف (uppercase/lowercase)
    );

    List<TextSpan> spans = [];
    int start = 0;

    for (final match in linkRegExp.allMatches(message)) {
      if (match.start > start) {
        spans.add(TextSpan(text: message.substring(start, match.start)));
      }

      final String url = match.group(0)!;
      final String fullUrl = url.startsWith('http') ? url : 'http://$url'; // إضافة http:// إذا كان الرابط لا يبدأ بـ http

      spans.add(
        TextSpan(
          text: url,
          style: TextStyleX.titleMedium.copyWith(color: ColorX.url,fontFamily: FontX.fontFamily),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _launchURL(fullUrl);
            },
        ),
      );

      start = match.end;
    }

    if (start < message.length) {
      spans.add(TextSpan(text: message.substring(start)));
    }

    return TextSpan(children: spans);
  }

  void _launchURL(String url) async {
    try{
      await launchUrl(Uri.parse(url));
    }catch(_){}
  }
}