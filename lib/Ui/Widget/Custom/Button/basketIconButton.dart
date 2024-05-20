part of "../../widget.dart";

class BasketIconButtonsX extends StatelessWidget {
  BasketIconButtonsX({super.key, this.color = Colors.white,this.isAnimation=true});
  final Color color;
  final bool isAnimation;
  final BasketGeneralControllerX controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: Obx(
        () => badges.Badge(
          showBadge: controller.numItemsBadge.value > 0,
          position: badges.BadgePosition.topEnd(top: -5, end: 0),
          badgeStyle: badges.BadgeStyle(badgeColor: color),
          badgeContent: TextX(
            controller.numItemsBadge.value.toString(),
            color: ColorX.primary,
            style: TextStyleX.supTitleMedium,
          ),
          child: InkResponse(
            onTap: controller.openBasket,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Iconsax.shopping_cart5, color: color,size: 28),
            ),
          ),
        ),
      ),
    ).fadeAnimationX(100,isDisable:!isAnimation);
  }
}
