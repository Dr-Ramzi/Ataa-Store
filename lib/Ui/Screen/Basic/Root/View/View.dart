import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../GeneralState/error.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/loading.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// for don't move navbar when open keyboard
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: controller.init(),
        builder: (context, snapshot) {
          /// Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingSectionX();
          }

          /// Error State
          if (snapshot.hasError) {
            return ErrorView(
              error: snapshot.error.toString(),
            );
          }

          /// Main Content
          return Obx(
            () => Scaffold(
              /// App Bar
              appBar: AppBarRootX(
                key: Key(controller.appBarTitle()),
                title: controller.appBarTitle(),
                pages: controller.pages,
                indexSelected: controller.indexPageSelected.value,
                leadingWidth: controller.isHome() ? 260 : 0,

                /// To implement the home page design
                leading: controller.isHome()
                    ? const HomeAppBarLeadingX().fadeAnimation200
                    : null,
                actions: [BasketIconButtonsX()],
              ),

              /// Pages Content
              body: controller.pages[controller.indexPageSelected.value].view,

              /// Nav Bar
              bottomNavigationBar: ContainerX(
                radius: 0,
                padding: EdgeInsets.symmetric(horizontal: 4),
                isShadow: true,
                color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                /// To add some safety space on the edges so that the titles do not come off the screen
                child: SafeArea(
                  top: false,
                  maintainBottomViewPadding: true,
                  child: SizedBox(
                    height: StyleX.navBarHeight,
                    child: BottomNavigationBar(
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      currentIndex: controller.indexPageSelected.value,
                      onTap: controller.onItemSelected,
                      iconSize: StyleX.navBarIconSize,
                      items: controller.pages.map(
                        (page) {
                          return BottomNavigationBarItem(
                            icon: page.icon,
                            label: page.label.tr,
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),

              /// Quick Action Button In Nav Bar
              floatingActionButton: Visibility(
                /// for don't move when open keyboard
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: QuickDonationButton(onTap: controller.openQuickDonation),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          );
        },
      ),
    );
  }
}
