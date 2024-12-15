import 'dart:async';
import 'package:ataa/Core/Error/error.dart';
import 'package:ataa/Core/Extension/convert/convert.dart';
import 'package:ataa/Data/Model/Cart/MiniCart.dart';
import 'package:ataa/Data/Model/Cart/updateCartItemForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/Controller/Cart/cartGeneralController.dart';
import '../../../../../Core/Controller/Cart/deliveryAddressController.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/Model/Cart/cartItem.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';
import '../../../../ScreenSheet/Other/MandatoryAuth/mandatoryAuth.dart';

class CartController extends GetxController {
  //============================================================================
  // Injection of required controls

  final AppControllerX app = Get.find();
  final CartGeneralControllerX cartGeneral = Get.find();
  final DeliveryAddressControllerX deliveryAddressController = Get.find();

  //============================================================================
  // Variables

  /// Text Field
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction;

  /// Cart Money
  RxDouble shippingCharges = 0.0.obs;
  RxDouble cartSummary = 0.0.obs;

  /// Cart Process
  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  //============================================================================
  // Functions

  Future getData() async {
    try {
      /// Get Cart Data
      await cartGeneral.getData();
      cartSummary.value= cartGeneral.cart.value.totalPrice;

      /// Get delivery data if available
      if (cartGeneral.cart.value.isProduct) {
        await deliveryAddressController.getData();

        /// TODO: Database >>> Fetch shipping charges
        shippingCharges.value = 10;
      } else {
        shippingCharges.value = 0;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Pay

  /// Verify the entered data
  bool dataVerification() {
    if (cartGeneral.cart.value.isProduct &&
        deliveryAddressController.isHasData.value == false) {
      // check delivery data
      return throw "Delivery data must be entered";
    } else if (!formKey.currentState!.validate()) {
      // check text fields
      autoValidate = AutovalidateMode.always;
      return throw "Check the donation entry fields";
    }
    return true;
  }

  onPay() async {
    if (isLoading.isFalse) {
      if(app.isLogin.isFalse){
        var numberOfItemsBeforeLogin = cartGeneral.countItem.value;
        await mandatoryAuthSheetX();
        // انتظر حتى يتم إغلاق جميع شاشات البوتم شيت المفتوحة
        while (Get.isBottomSheetOpen ?? false) {
          await Future.delayed(const Duration(milliseconds: 100)); // إضافة تأخير بسيط للتحقق بشكل دوري
        }
        if(numberOfItemsBeforeLogin!=cartGeneral.countItem.value){
          /// Stop the payment process because the items and price may change
          cartGeneral.cart.refresh();
          update();
          cartSummary.value= cartGeneral.cart.value.totalPrice;
          return;
        }
      }
      if(app.isLogin.isTrue){
        try {
          if (dataVerification()) {
            isLoading.value = true;
            buttonState.value = ButtonStateEX.loading;

            await Get.toNamed(
              RouteNameX.generalPayment,
              arguments: {
                NameX.totalCart: cartGeneral.cart.value.totalPrice,
                NameX.fromCart:true,
              },
            );
            cartSummary.value= cartGeneral.cart.value.totalPrice;
          }
        } catch (error) {
          ToastX.error(message: error);
          buttonState.value = ButtonStateEX.failed;
        }
        isLoading.value = false;

        /// Reset the button state
        Timer(
          const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
              () {
            buttonState.value = ButtonStateEX.normal;
          },
        );
      }
    }
  }

  //----------------------------------------------------------------------------

  onDeleteItem(CartItemX item) async {
    if(isLoading.isFalse){
      try {
        isLoading.value = true;
        MiniCartX miniCart = await DatabaseX.deleteCartItem(
          itemId: item.id,
          cartId: cartGeneral.cart.value.id,
        );
        cartGeneral.countItem.value=miniCart.countItem;
        cartGeneral.cart.value.countItem=miniCart.countItem;
        cartSummary.value= cartSummary.value-(item.price*item.quantity);
        cartGeneral.cart.value.totalPrice = cartSummary.value;
        cartGeneral.cart.value.items.removeWhere((e) => e.id == item.id);
        cartGeneral.cart.refresh();
        ToastX.success(message: miniCart.message);
      } catch (e) {
        ToastX.error(message: e.toString());
      }
      isLoading.value = false;
    }
  }

  onUpdate(
    CartItemX item, {
    String? price,
    int? quantity,
    int? sharesQuantity,
    String? donationSharesPackageId,
    String? donationOpenPackageId,
    String? donationDeductionPackageId,
  }) async {
    var index = cartGeneral.cart.value.items.indexWhere((e) => e.id == item.id);
    if(isLoading.isTrue){
      /// So that the item's status on the screen is restored to its basic data before the update.
      cartGeneral.cart.value.items[index] = CartItemX(
        id: item.id,
        price: item.price,
        quantity: item.quantity,
        type: item.type,
        name: item.name,
        order: item.order,
      );
      return null;
    }
    if (price == null || ValidateX.money(price) == null) {
      try {
        isLoading.value = true;
        var result = await DatabaseX.updateCartItem(
          form: UpdateCartItemFormX(
            id: item.id,
            price: price == null ? item.price : price.toIntX,
            quantity: quantity ?? item.quantity,
            sharesQuantity: sharesQuantity,
            donationSharesPackageId: donationSharesPackageId,
            donationOpenPackageId: donationOpenPackageId,
            donationDeductionPackageId: donationDeductionPackageId,
          ),
        );
        cartSummary.value=result.$1.totalPrice;
        cartGeneral.cart.value.totalPrice = cartSummary.value;
        cartGeneral.cart.value.items[index]= result.$1.items.firstWhere((e) => e.id == item.id);
        cartGeneral.countItem.value= result.$1.countItem;
        cartGeneral.cart.value.countItem=result.$1.countItem;
        if (result.$2 != null) {
          ToastX.success(message: result.$2);
        }
      } catch (e) {
        e.toErrorX.log();
        /// So that the item's status on the screen is restored to its basic data before the update.
        cartGeneral.cart.value.items[index] = CartItemX(
          id: item.id,
          price: item.price,
          quantity: item.quantity,
          type: item.type,
          name: item.name,
          order: item.order,
        );
        ToastX.error(message: e.toString());
      }
      isLoading.value = false;
    }
  }
}
