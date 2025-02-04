import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Widget/Basic/Utils/future_builder.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: 'Contact us',
        actions: [CartIconButtonsX()],
      ),
      body: SafeArea(
        child: FutureBuilderX(
          future: controller.getData,
          loading: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: StyleX.hPaddingApp,
              vertical: StyleX.vPaddingApp,
            ),
            child: Column(
              children: [
                for (int i = 0; i < 10; i++)
                  const ShimmerAnimationX(
                    height: 66,
                    margin: EdgeInsets.only(bottom: 12),
                  )
              ],
            ),
          ),
          child: (_) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: StyleX.hPaddingApp,
              vertical: StyleX.vPaddingApp,
            ),
            child: Column(
              children: [
                if (controller.page.contentHTML.isNotEmpty)
                  HtmlWidget(
                    Get.isDarkMode
                        ? controller.page.contentHTML.replaceAllMapped(
                        RegExp(r'color:\s*(rgb\(0,\s*0,\s*0\)|#000000|black|rgb\(255,\s*255,\s*255\)|#ffffff|white)', caseSensitive: false),
                            (match) {
                          const colorMap = {
                            'rgb(0, 0, 0)': 'rgb(255, 255, 255)',
                            '#000000': '#ffffff',
                            'black': 'white',
                            'rgb(255, 255, 255)': 'rgb(0, 0, 0)',
                            '#ffffff': '#000000',
                            'white': 'black',
                          };
                          return 'color: ${colorMap[match.group(1)?.toLowerCase()] ?? match.group(1)}';
                        }): controller.page.contentHTML,
                    customWidgetBuilder: (element) {
                      if (element.localName == 'img') {
                        return ImageNetworkX(
                          imageUrl: element.attributes[NameX.src].toString(),
                          width: double.maxFinite,
                        );
                      }
                      return null;
                    },
                    textStyle: TextStyleX.titleMedium,
                  ).fadeAnimation200.paddingOnly(bottom: 16),
                ContactCardX(
                  icon: IconX.contactUs,
                  title: controller.formatPhoneNumber(controller.contactUs.mobile.toString(),countryCode: controller.contactUs.countryCode),
                  isShow: controller.contactUs.mobile != null,
                  onTap: controller.onTapMobile,
                ).fadeAnimation200,
                ContactCardX(
                  icon: IconX.whatsappBold,
                  title: controller.formatPhoneNumber(controller.contactUs.whatsappNumber.toString(),countryCode: controller.contactUs.whatsappCountryCode),
                  isShow: controller.contactUs.whatsappNumber != null,
                  onTap: controller.onTapWhatsapp,
                ).fadeAnimation300,
                ContactCardX(
                  icon: Icons.email_rounded,
                  title: controller.contactUs.email,
                  isShow: controller.contactUs.email != null,
                  onTap: controller.onTapEmail,
                ).fadeAnimation300,
                ContactCardX(
                  icon: Icons.language_rounded,
                  title: controller.socialMedia.siteUrl,
                  isShow: controller.socialMedia.siteUrl != null,
                  onTap: controller.onTapSite,
                ).fadeAnimation400,
                ContactCardX(
                  icon: IconX.x,
                  title: 'Our account on X platform',
                  isShow: controller.socialMedia.twitterUrl != null,
                  onTap: controller.onTapTwitter,
                ).fadeAnimation400,
                ContactCardX(
                  icon: IconX.snapchat,
                  title: 'Our account on Snapchat platform',
                  isShow: controller.socialMedia.snapchatUrl != null,
                  onTap: controller.onTapSnapchat,
                ).fadeAnimation500,
                ContactCardX(
                  icon: IconX.facebook,
                  title: 'Our account on Facebook platform',
                  isShow: controller.socialMedia.facebookUrl != null,
                  onTap: controller.onTapFacebook,
                ).fadeAnimation500,
                ContactCardX(
                  icon: IconX.instagram,
                  title: 'Our account on Instagram platform',
                  isShow: controller.socialMedia.instagramUrl != null,
                  onTap: controller.onTapInstagram,
                ).fadeAnimation600,
                ContactCardX(
                  icon: IconX.youtube,
                  title: 'Our account on YouTube platform',
                  isShow: controller.socialMedia.youtubeUrl != null,
                  onTap: controller.onTapYoutube,
                ).fadeAnimation600,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
