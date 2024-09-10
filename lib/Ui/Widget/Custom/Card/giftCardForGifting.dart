import 'dart:math';

import 'package:ataa/Config/config.dart';
import 'package:flutter/material.dart';

import '../../widget.dart';

class GiftCardForGiftingX extends StatelessWidget {
  const GiftCardForGiftingX({
    super.key,
    this.radius = StyleX.radius,
    this.borderWidth = 4,
    this.isPreview = false,
  });
  final double radius;
  final double borderWidth;
  final bool isPreview;
  @override
  Widget build(BuildContext context) {
    // النسبة بين الطول والعرض الأصلية
    double aspectRatio = 473.8 / 310;
    return LayoutBuilder(
      builder: (context, constraints) {
        // عرض الشاشة المتاح
        double maxWidth = constraints.maxWidth;

        // عرض البطاقة، بحيث لا يتجاوز 500
        double cardWidth = maxWidth;
        if (cardWidth > 500) {
          cardWidth = 500;
        }

        // الطول بناءً على النسبة بين العرض والطول، وبشرط أن لا يزيد عن 700
        double cardHeight = cardWidth * aspectRatio;
        if (cardHeight > 700) {
          cardHeight = 700;
          cardWidth = cardHeight / aspectRatio;
        }

        // نسبة التحجيم بناءً على الحجم الأصلي (310 عرضًا)
        double scaleFactor = cardWidth / 310;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500, // الحد الأقصى لعرض البطاقة
              maxHeight: 700, // الحد الأقصى لطول البطاقة
            ),
            child: ClipRRect(
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: borderWidth,
                  ),
                ),
                child: Stack(children: [
                  Positioned.fill(child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 22.4 * scaleFactor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 22.4 * scaleFactor),
                              Center(
                                child: Image.asset(
                                  ImageX.giftCardLogo,
                                  height: 35 * scaleFactor,
                                ),
                              ),
                              SizedBox(height: 30 * scaleFactor),
                              ContainerX(
                                height: 26 * scaleFactor,
                                width: double.infinity,
                                color: ColorX.primary.shade500,
                                radius: 100,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 17 * scaleFactor,
                                  vertical: 5.6 * scaleFactor,
                                ),
                                child: TextX(
                                  'afgafgasfgasgadgdfdssdsd',
                                  style: TextStyleX.titleSmall.copyWith(
                                    fontSize: 10 * scaleFactor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(height: 16 * scaleFactor),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: ImageNetworkX(
                                  imageUrl: '',
                                  empty: const SizedBox(),
                                  height: 60 * scaleFactor,
                                ),
                              ),
                              SizedBox(height: 14 * scaleFactor),
                              TextX(
                                'afgafgasfgasgadgdfdssdsd',
                                style: TextStyleX.titleSmall.copyWith(
                                  fontSize: 21 * scaleFactor,
                                  fontWeight: FontWeight.w700,
                                ),
                                color: ColorX.primary.shade500,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                              ),
                              SizedBox(height: 14 * scaleFactor),
                              TextX(
                                'afgafgasfgasgadgdfdssdsd',
                                style: TextStyleX.titleSmall.copyWith(
                                  fontSize: 10.6 * scaleFactor,
                                  fontWeight: FontWeight.w600,
                                ),
                                color: ColorX.grey.shade700,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              SizedBox(height: 14 * scaleFactor),
                              ContainerX(
                                height: 26 * scaleFactor,
                                width: double.infinity,
                                color: ColorX.primary.shade500.withOpacity(0.1),
                                radius: 100,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 17 * scaleFactor,
                                  vertical: 5.6 * scaleFactor,
                                ),
                                child: TextX(
                                  'dfasdfasdgasdfga',
                                  style: TextStyleX.titleSmall.copyWith(
                                    fontSize: 10 * scaleFactor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  color: ColorX.primary.shade500,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(height: 14 * scaleFactor),
                              TextX(
                                'akdshfiauhdsfpiuahsufh',
                                style: TextStyleX.titleSmall.copyWith(
                                  fontSize: 10.6 * scaleFactor,
                                  fontWeight: FontWeight.w600,
                                ),
                                color: ColorX.grey.shade700,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 4 * scaleFactor),
                      const Spacer(
                        flex: 1,
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 22.4 * scaleFactor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerX(
                              width: 19.5 * scaleFactor,
                              height: 3.5 * scaleFactor,
                              color: ColorX.primary.shade500,
                              radius: 30,
                              child: const SizedBox(),
                            ),
                            SizedBox(width: 17 * scaleFactor),
                            Flexible(
                              child: TextX(
                                'dssdhfgauidhfa;iosdhfpasdiuhfpa',
                                style: TextStyleX.titleSmall.copyWith(
                                  fontSize: 10.6 * scaleFactor,
                                  fontWeight: FontWeight.w600,
                                ),
                                color: ColorX.grey.shade700,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(width: 17 * scaleFactor),
                            ContainerX(
                              width: 19.5 * scaleFactor,
                              height: 3.5 * scaleFactor,
                              color: ColorX.primary.shade500,
                              radius: 30,
                              child: const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4 * scaleFactor),
                      const Spacer(
                        flex: 1,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          ImageX.giftCardBackground1,
                          fit: BoxFit.contain,
                          // scale: scaleFactor,
                          width: 112 * scaleFactor,
                        ),
                      ),
                    ],
                  ),),
                  if(isPreview)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.3,
                      child: ClipRect(
                        child: OverflowBox(
                          alignment: Alignment.center,
                          minWidth: 0.0,
                          minHeight: 0.0,
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                          child: Transform.rotate(
                            angle: (35.4 * pi / 180)*-1, // تدوير العنصر بزاوية 35.4 درجة
                            child: Row(children: [
                            ContainerX(
                              width: 124 * scaleFactor,
                              height: 3.5 * scaleFactor,
                              color: ColorX.grey.shade300,
                              radius: 30,
                              child: const SizedBox(),
                            ),
                            SizedBox(width: 17 * scaleFactor),
                            TextX('PREVIEW',
                              style: TextStyleX.titleSmall.copyWith(
                                fontSize: 53 * scaleFactor,
                                fontWeight: FontWeight.w700,
                              ),
                              color: ColorX.grey.shade300,
                            ),
                            SizedBox(width: 17 * scaleFactor),
                            ContainerX(
                              width: 124 * scaleFactor,
                              height: 3.5 * scaleFactor,
                              color: ColorX.grey.shade300,
                              radius: 30,
                              child: const SizedBox(),
                            ),
                                              ],),
                          ),
                        ),
                      ),
                    ),),
                ],),
              ),
            ),
          ),
        );
      },
    );
  }
}
