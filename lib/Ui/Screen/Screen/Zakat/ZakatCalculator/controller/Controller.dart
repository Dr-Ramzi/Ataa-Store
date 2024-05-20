import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../ScreenSheet/Other/MandatoryAuth/mandatoryAuth.dart';

class ZakatCalculatorController extends GetxController {
  ///============================================================================
  /// Injection of required controls

  final AppControllerX app = Get.find();

  ///============================================================================
  /// Variables

  //----------------------------------------------------------------------------
  // Processing and validation

  RxBool isLoading = false.obs;
  Rx<ButtonStateEX> buttonState = ButtonStateEX.normal.obs;

  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> formKeyAdditionalAmount = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  //----------------------------------------------------------------------------
  // Inputs Zakat

  TextEditingController caskMoney = TextEditingController();
  RxList<int> goldCarats = <int>[].obs;
  RxList<TextEditingController> goldGrams = [TextEditingController()].obs;
  TextEditingController silver = TextEditingController();
  RxList<TextEditingController> stockNames = [TextEditingController()].obs;
  RxList<int> stockNumbers = <int>[1].obs;
  RxList<TextEditingController> stockValues = [TextEditingController()].obs;
  TextEditingController others = TextEditingController();
  TextEditingController additionalAmount = TextEditingController();

  //----------------------------------------------------------------------------
  // Gold & Silver Price

  RxBool isGetGoldPrice = false.obs;
  Map<int, double> goldCaratsPrice = {};
  double silverPrice = 0;

  //----------------------------------------------------------------------------
  // Open and Close Zakat Section

  RxBool isCashMoney = false.obs;
  RxBool isGold = false.obs;
  RxBool isSilver = false.obs;
  RxBool isShares = false.obs;
  RxBool isOther = false.obs;

  //----------------------------------------------------------------------------
  // Total funds and zakat sections

  RxInt totalZakat = 0.obs;
  RxInt totalMoney = 0.obs;
  int totalCash = 0;
  int totalGold = 0;
  int totalSilver = 0;
  int totalShare = 0;
  int totalOther = 0;
  int totalAdditionalAmount = 0;

  ///============================================================================
  /// Functions

  // Verify whether there is an activated Zakat section or not
  isHasZakat() {
    if (isCashMoney.isTrue ||
        isGold.isTrue ||
        isSilver.isTrue ||
        isShares.isTrue ||
        isOther.isTrue) {
      return true;
    } else {
      return false;
    }
  }

  //----------------------------------------------------------------------------
  // Activate and close sections
  // then calculate the value of the money after removing or adding entries for the section that was changed.

  onOpenCashMoney(bool val) {
    isCashMoney.value = val;
    calculateTotal();
  }

  onOpenGold(bool val) {
    isGold.value = val;
    calculateTotal();
  }

  onOpenSilver(bool val) {
    isSilver.value = val;
    calculateTotal();
  }

  onOpenShares(bool val) {
    isShares.value = val;
    calculateTotal();
  }

  onOpenOther(bool val) {
    isOther.value = val;
    calculateTotal();
  }

  //----------------------------------------------------------------------------
  // Metal price
  // Get the prices of silver and gold from the database to calculate the value of Zakat

  getGold() async {
    try {
      goldCaratsPrice = FunctionX.goldOunceToCarats(
        await DatabaseX.getGoldPrice(),
      );

      /// Conversion from US dollars to Saudi riyals
      goldCaratsPrice.updateAll((key, caratPrice) => caratPrice * 3.76);

      /// To activate the calculation of zakat, zakat depends on the value
      /// of gold to calculate 85 grams, which is the legal quorum
      isGetGoldPrice.value = true;
    } catch (e) {
      return Future.error(e);
    }
  }

  getSilver() async {
    try {
      silverPrice = FunctionX.silverOunceToGram(
        await DatabaseX.getSilverPrice(),
      );

      /// Conversion from US dollars to Saudi riyals
      silverPrice = silverPrice * 3.76;
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Metal processing
  /// To add the word “carat” to the karat to be displayed on the screen

  List<String> getGoldCaratsList() {
    return ConstantX.goldCarats.map((carat) => "$carat ${"Carat".tr}").toList();
  }

  /// To add the word “carat” to the selected value so that it is similar to the values in the list of values
  getGoldCaratValue(index) {
    if (goldCarats.asMap()[index] != null) {
      return "${goldCarats[index]} ${"Carat".tr}";
    }
  }

  /// When changing one of the gold karat values
  onChangeGoldCarat(String val, int index) {
    /// The value is returned to a number after the word carat is added to it
    var carat = int.parse(val.substring(0, val.indexOf(" ")));

    /// It checks whether there is a previous value to modify or create a new value
    if (goldCarats.asMap()[index] != null) {
      goldCarats[index] = carat;
    } else {
      goldCarats.insert(index, carat);
    }

    /// Checking the value of a gram, if it is correct, the total of the new gold is calculated
    if (ValidateX.money(goldGrams[index].text) == null) {
      calculateGold();
    }
  }

  /// When an additional gold field is added
  onAddZakatGoldRow() {
    goldGrams.add(TextEditingController());
  }

  /// When a gold field is removed
  onRemoveZakatGoldRow(int i) {
    /// There must be more than one field
    if (goldGrams.length > 1) {
      goldGrams.removeAt(i);
      if (goldCarats.asMap()[i] != null) {
        goldCarats.removeAt(i);
      }
      calculateGold();
    }
  }

  /// Ensure that carat values are present in all input fields
  bool validateGold() {
    if (isGold.value && goldGrams.length != goldCarats.length) {
      return false;
    }
    return true;
  }

  //----------------------------------------------------------------------------
  // Sections Calculator
  /// Calculate the total funds in each section and then activate the calculation of the general zakat value
  /// Important Note: Only the valid value is calculated and errors are later shown when payment is made

  calculateCashMoney() {
    /// Verify the activation of the section and ensure that the entries are correct
    if (isCashMoney.value && ValidateX.money(caskMoney.text) == null) {
      /// Add the entered value to the department's total funds
      totalCash = int.parse(caskMoney.text);

      /// Calculating the value of general zakat
      calculateTotal();
    }
  }

  calculateGold() {
    /// Verify the activation of the section
    if (isGold.value) {
      /// Reset the total value to start a new calculation
      totalGold = 0;

      /// Go through all entered values
      for (int i = 0; i < goldGrams.length; i++) {
        /// Check the grams value entered must be correct and make sure to choose a gold karat value for this value
        if (ValidateX.money(goldGrams[i].text) == null &&
            goldCarats.asMap()[i] != null) {
          /// Multiply the number of grams by the value of gold for this caliber and add it to the total of the division
          totalGold +=
              (int.parse(goldGrams[i].text) * goldCaratsPrice[goldCarats[i]]!)
                  .ceil();
        }
      }

      /// Calculating the value of general zakat
      calculateTotal();
    }
  }

  calculateSilver() {
    if (isSilver.value && ValidateX.money(silver.text) == null) {
      totalSilver = (int.parse(silver.text) * silverPrice).ceil();
      calculateTotal();
    }
  }

  calculateShare() {
    if (isShares.value) {
      totalShare = 0;
      for (int i = 0; i < stockNumbers.length; i++) {
        if (ValidateX.money(stockValues[i].text) == null &&
            stockNumbers[i] >= 1) {
          totalShare += int.parse(stockValues[i].text) * stockNumbers[i];
        }
      }
      calculateTotal();
    }
  }

  calculateOther() {
    if (isOther.value && ValidateX.money(others.text) == null) {
      totalOther = int.parse(others.text);
      calculateTotal();
    }
  }

  calculateAdditionalAmount() {
    if (additionalAmount.text.isNotEmpty &&
        ValidateX.money(additionalAmount.text) == null) {
      totalAdditionalAmount = int.parse(additionalAmount.text);
      calculateTotal();
    }
  }

  //----------------------------------------------------------------------------
  // Calculate Total
  /// Calculating the total public funds with the value of zakat

  calculateTotal() {
    /// The gold price must have been successfully fetched to calculate the zakat value
    if (goldCaratsPrice.isNotEmpty) {
      /// Zero the value to start a new calculation
      totalMoney.value = 0;

      /// Only active departments' funds are added
      if (isCashMoney.value) totalMoney.value += totalCash;
      if (isGold.value) totalMoney.value += totalGold;
      if (isSilver.value) totalMoney.value += totalSilver;
      if (isShares.value) totalMoney.value += totalShare;
      if (isOther.value) totalMoney.value += totalOther;
      totalMoney.value += totalAdditionalAmount;

      /// The total amount of money must be more than or equal to 85 grams of 24 karat gold in order for him to pay zakat on it.
      if (totalMoney / goldCaratsPrice[24]! >= 85) {
        /// The value of 2.5% of the total value of the funds is calculated, with the intervals rounded to the top for safety
        totalZakat.value = (totalMoney * 0.025).ceil();
      } else {
        /// If the total funds do not achieve the value of the zakat quorum, the value is zeroed
        totalZakat.value = 0;
      }
    }
  }

  //----------------------------------------------------------------------------
  // Shares

  /// When the number of shares is changed
  onChangeShareNumber(double val, int index) {
    stockNumbers[index] = val.toInt();
    calculateShare();
  }

  /// When an additional field field is added
  onAddZakatShareRow() {
    stockNames.add(TextEditingController());
    stockValues.add(TextEditingController());
    stockNumbers.add(1);
  }

  /// When a Share field is removed
  onRemoveZakatShareRow(int i) {
    /// There must be more than one field
    if (stockNames.length > 1) {
      stockNames.removeAt(i);
      stockValues.removeAt(i);
      stockNumbers.removeAt(i);
      calculateShare();
    }
  }

  //===============================================================
  // Clear Data
  /// Reset all values after paying zakat

  clearData() {
    caskMoney.text = "";
    goldCarats.value = [];
    goldGrams.value = [TextEditingController()];
    silver.text = "";
    stockNames.value = [TextEditingController()];
    stockNumbers.value = [1];
    stockValues.value = [TextEditingController()];
    others.text = "";

    isCashMoney.value = false;
    isGold.value = false;
    isSilver.value = false;
    isShares.value = false;
    isOther.value = false;

    totalZakat.value = 0;
    totalMoney.value = 0;
    totalCash = 0;
    totalGold = 0;
    totalSilver = 0;
    totalShare = 0;
    totalOther = 0;
    totalAdditionalAmount = 0;
    additionalAmount.text = "";

    autoValidate = AutovalidateMode.disabled;
  }

  //===============================================================
  // Main processors

  onPayZakat() async {
    /// Mandatory login before paying zakat
    if (!app.isLogin.value) {
      mandatoryAuthSheetX();
    } else if (isLoading.isFalse) {
      /// Check all input fields
      if (formKey.currentState!.validate() &
          formKeyAdditionalAmount.currentState!.validate()) {
        /// Check input fields for gold
        if (!validateGold()) {
          return ToastX.error(
              message:
                  "There are gold karats that have not yet been determined");
        } else {
          isLoading.value = true;
          buttonState.value = ButtonStateEX.loading;
          try {
            // TODO: Database >>> Create a connection to start the payment process
            // TODO: Payment >>> Go to the payment screen
            // TODO: Database >>> Send a response from the payment screen and complete the process
            await Future.delayed(const Duration(seconds: 1)); // delete this

            /// The time delay here is aesthetically beneficial
            buttonState.value = ButtonStateEX.success;
            await Future.delayed(
              const Duration(seconds: StyleX.successButtonSecond),
            );

            ToastX.success(message: "Zakat has been paid successfully");

            /// clear date on controller
            clearData();
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
        }
      } else {
        ToastX.error(
          message: "Check the input fields, there are incorrect values entered",
        );
        autoValidate = AutovalidateMode.always;
      }
    }
  }
}
