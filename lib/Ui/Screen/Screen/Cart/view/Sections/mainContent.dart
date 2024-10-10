import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/Enum/model_type_status.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class MainContentSectionX extends GetView<CartController> {
  const MainContentSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleX.hPaddingApp,
        vertical: StyleX.vPaddingApp,
      ),
      child: Form(
        key: controller.formKey,
        autovalidateMode: controller.autoValidate,
        child: GetBuilder<CartController>(builder: (controller) => Obx(() => Column(
          children: [
            /// Donation Items
            ...controller.cartGeneral.cart.value.items.where((e) => e.order.modelType == ModelTypeStatusX.donation).map(
                  (item) {
                return CartDonationCardX(
                  cartItem: item,
                  onDelete: controller.onDeleteItem,
                  onUpdate: controller.onUpdate,
                ).fadeAnimation300;
              },
            ),

            ...controller.cartGeneral.cart.value.items.where((e) => e.order.modelType == ModelTypeStatusX.gift).map(
                  (item) {
                return CartGiftCardX(
                  cartItem: item,
                  onDelete: controller.onDeleteItem,
                  onUpdate: controller.onUpdate,
                ).fadeAnimation300;
              },
            ),

            // /// Sponsorship Items
            // ...controller.sponsorships.map(
            //       (sponsorship) {
            //     return CartSponsorshipCardX(
            //       sponsorship: sponsorship,
            //       onDelete: controller.onDeleteSponsorshipItem,
            //     ).fadeAnimation400;
            //   },
            // ),
            //
            // /// Product Items
            // ...controller.orderProducts.map(
            //   (productItem) {
            //     return CartProductCardX(
            //       product: controller.getProductById(productItem.productID),
            //       productItem: productItem,
            //       onDelete: controller.onDeleteProductItem,
            //       onChangedNum: controller.onChangeProductNum,
            //     ).fadeAnimation400;
            //   },
            // ),
          ],
        ),),),
      ),
    );
  }
}
