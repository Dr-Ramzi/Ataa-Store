import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class EditProfileController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  late int countryCode = app.user.value.countryCode;
  late Rx<String> gender = (app.user.value.gender ?? "").obs;

  XFile? image;
  final ImagePicker picker = ImagePicker();

  /// Input Filed
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  late TextEditingController name =
      TextEditingController(text: app.user.value.name);
  late TextEditingController phone =
      TextEditingController(text: app.user.value.phone.toString());
  late TextEditingController email =
      TextEditingController(text: app.user.value.email);

  //============================================================================
  // Functions

  void onChangeGender(String? value) => gender.value = value!;

  void onChangePhone(String val) => countryCode = int.parse(val);

  changeImage() async {
    /// Open the user's photo gallery to select a photo
    var x = await picker.pickImage(source: ImageSource.gallery);

    /// If an image is selected, the data is updated
    if (x != null) {
      image = x;
      update();
    }
  }

  onEdit() async {
    if (isLoading.isFalse) {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        buttonState.value = ButtonStateEX.loading;
        try {
          /// TODO: Database >>> Update profile details
          await Future.delayed(const Duration(seconds: 1)); // delete this

          // if(email.text.toLowerCase().trim()!=app.user.value.email){
          //   bool? otpResult = await Get.toNamed(RouteNameX.otp,
          //     arguments: OtpX(
          //         email: email.text.trim(),
          //         isLogin: false,
          //         isPhone: false,
          //         isEdit: true
          //     ),);
          // }
          //
          // if(phone.text.trim()!=app.user.value.phone.toString() || countryCode!=app.user.value.countryCode ){
          //   bool? otpResult = await Get.toNamed(RouteNameX.otp,
          //     arguments: OtpX(
          //         phone: int.parse(phone.text),
          //         countryCode: countryCode,
          //         isLogin: false,
          //         isPhone: true,
          //         isEdit: true
          //     ),);
          // }

          // final result = await DatabaseX.updateProfile(
          //   image: image != null ? File(image!.path) : null,
          //   body: DBContactX.bodyUpdateProfile(
          //     name: name.text.trim(),
          //     phone:phone.text.trim(),
          //     countryCode:countryCode,
          //     email: email.text.trim(),
          //     gender: gender.value,
          //   ),
          // );
          // app.user = result;

          /// Update user object
          app.user.value.name = name.text;
          app.user.value.phone = int.parse(phone.text);
          app.user.value.countryCode = countryCode;
          app.user.value.gender = gender.value;
          // app.user.value.imageURL;
          app.update();

          /// The time delay here is aesthetically beneficial
          buttonState.value = ButtonStateEX.success;
          await Future.delayed(
            const Duration(seconds: StyleX.successButtonSecond),
          );

          /// Close the profile edite screen
          Get.back();
          ToastX.success(message: "Profile updated successfully");
        } catch (error) {
          ToastX.error(message: error.toString());
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
      } else {
        autoValidate = AutovalidateMode.always;
      }
    }
  }
}
