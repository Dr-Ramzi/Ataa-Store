import 'package:ataa/UI/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class MainContentSectionX extends GetView<BasketController> {
  const MainContentSectionX({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleX.hPaddingApp,
        vertical: StyleX.vPaddingApp,
      ),
      child: Obx(
        () => AbsorbPointer(
          /// This is so that everything is locked during my operation
          absorbing: controller.isLoading.value,
          child: Column(
            children: [
              /// This from for if update some price in items
              Form(
                key: controller.formKey,
                autovalidateMode: controller.autoValidate,
                child: Column(
                  children: [
                    /// Donation Items
                    ...controller.donationRecords.map(
                      (basketItem) {
                        return BasketDonationCardX(
                          donation: controller.getDonationById(
                            basketItem.donationID,
                          ),
                          basketItem: basketItem,
                          onDelete: controller.onDeleteDonationItem,
                          onChangedPrice: controller.onChangedDonationPrice,
                          onChangedPackage: controller.onChangedPackage,
                          onChangedNumStock: controller.onChangeNumStock,
                          priceController:
                              controller.donationPriceController[basketItem.id],
                        ).fadeAnimation300;
                      },
                    ),

                    /// Dedication Items
                    ...controller.dedications.map(
                      (dedication) {
                        return BasketDedicationCardX(
                          dedication: dedication,
                          dedicationType: controller.getDedicationTypeById(
                            dedication.typeID,
                          ),
                          onDelete: controller.onDeleteDedicationItem,
                          onChangedPrice:
                              controller.onChangedDedicationDonationAmount,
                          priceController:
                              controller.dedicationDonationAmountController[
                                  dedication.id],
                        ).fadeAnimation300;
                      },
                    )
                  ],
                ),
              ),

              /// Guarantee Items
              ...controller.guarantees.map(
                    (guarantee) {
                  return BasketGuaranteeCardX(
                    guarantee: guarantee,
                    onDelete: controller.onDeleteGuaranteeItem,
                  ).fadeAnimation400;
                },
              ),

              /// Product Items
              ...controller.orderProducts.map(
                (productItem) {
                  return BasketProductCardX(
                    product: controller.getProductById(productItem.productID),
                    productItem: productItem,
                    onDelete: controller.onDeleteProductItem,
                    onChangedNum: controller.onChangeProductNum,
                  ).fadeAnimation400;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
