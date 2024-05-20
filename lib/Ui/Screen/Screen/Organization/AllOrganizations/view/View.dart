import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../UI/Animation/animation.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class AllOrganizationsView extends GetView<AllOrganizationsController> {
  const AllOrganizationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: "Association Programs",
        actions: [BasketIconButtonsX()],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            /// Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: StyleX.vPaddingApp,
                  horizontal: StyleX.hPaddingApp,
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < 3; i++)
                      const ShimmerAnimationX(
                        height: 110,
                        margin: EdgeInsets.only(bottom: 10),
                      )
                  ],
                ),
              );
            }

            /// Error State
            if (snapshot.hasError) {
              return ErrorView(
                error: snapshot.error.toString(),
              );
            }

            /// Main Content
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleX.hPaddingApp,
                vertical: StyleX.vPaddingApp,
              ),
              child: Column(
                children: [
                  ...controller.organizations.map(
                    /// Organization Card
                    (org) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () => controller.onTap(org),
                        child: ContainerX(
                          isBorder: true,
                          child: Row(
                            children: [
                              /// Image
                              ImageNetworkX(
                                imageUrl: org.imageURL,
                                height: 40,
                              ),
                              const SizedBox(width: 20),

                              /// Name & Description
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextX(
                                      org.name,
                                      style: TextStyleX.titleLarge,
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 3),
                                    TextX(
                                      org.description,
                                      style: TextStyleX.supTitleMedium,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),

                              /// Icon
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                    ).fadeAnimation300,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
