import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class AppBarSectionX extends GetView<ProfileDetailsController> {
  const AppBarSectionX({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        /// If the user is logged in
        if (controller.app.isLogin.value) {
          return GetBuilder<AppControllerX>(
            builder: (controllerApp) => ProfileAccountCardX(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).cardTheme.color,
                  radius: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ImageNetworkX(
                      /// So that the image is updated if it changes
                      key: Key(
                        controllerApp.user.value.imageURL ?? "profile image",
                      ),
                      height: 120,
                      width: 120,
                      imageUrl: controllerApp.user.value.imageURL ?? "",
                      fit: BoxFit.cover,

                      /// Empty State
                      empty: Center(
                        child: TextX(
                          controllerApp.user.value.name[0],
                          style: TextStyleX.headerLarge,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                      /// Error State
                      failed: Center(
                        child: TextX(
                          controllerApp.user.value.name[0],
                          style: TextStyleX.headerLarge,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ).fadeAnimation300,
                const SizedBox(height: 10),

                /// User Name && Edit Button
                InkWell(
                  onTap: controller.onEditProfile,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextX(
                        controllerApp.user.value.name,
                        color: Theme.of(context).primaryColor,
                        textAlign: TextAlign.center,
                        style: TextStyleX.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Iconsax.edit,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ).fadeAnimation300,

                /// Motivational text
                TextX(
                  'Contribute with us by spreading goodness',
                  style: TextStyleX.supTitleLarge,
                ).fadeAnimation300
              ],
            ),
          );
        } else {
          /// If you are not logged in
          /// Auth Buttons
          return ProfileAccountCardX(
            children: [
              ButtonX.second(
                onTap: () => Get.offAllNamed(RouteNameX.login),
                text: "Login",
              ).fadeAnimation300,
              ButtonX(
                onTap: () => Get.offAllNamed(RouteNameX.signUp),
                text: "Sing Up",
              ).fadeAnimation300,
            ],
          );
        }
      },
    );
  }
}
