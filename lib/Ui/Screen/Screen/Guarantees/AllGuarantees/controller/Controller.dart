import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/Controller/Basket/basketGeneralController.dart';
import '../../../../../../Core/Controller/Filter/guaranteeFilterController.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../ScreenSheet/Filter/GuaranteeFilter/guaranteeFilterSheet.dart';
import '../../../../../ScreenSheet/Other/MandatoryAuth/mandatoryAuth.dart';

class AllGuaranteesController extends GetxController {
  //============================================================================
  // Injection of required controls

  AppControllerX app = Get.find();
  BasketGeneralControllerX basketController = Get.find();
  GuaranteeFilterControllerX guaranteeFilterController =
      Get.put(GuaranteeFilterControllerX());

  //============================================================================
  // Variables

  List<GuaranteeX> guarantees = [];
  RxList<GuaranteeX> guaranteesResult = <GuaranteeX>[].obs;

  TextEditingController search = TextEditingController();

  RxBool isLoading = false.obs;
  Map<String, ButtonStateEX> donationButtonsState = <String, ButtonStateEX>{};
  Map<String, ButtonStateEX> addToCartButtonsState = <String, ButtonStateEX>{};

  /// Bring the type of guarantees selected from the previous page
  bool isNewMuslim = Get.arguments[NameX.isNewMuslim] ?? false;
  bool isPreachers = Get.arguments[NameX.isPreachers] ?? false;
  bool isEducationQuran = Get.arguments[NameX.isEducationQuran] ?? false;
  bool isEducationNewMuslim =
      Get.arguments[NameX.isEducationNewMuslim] ?? false;

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch all guarantees
      await Future.delayed(const Duration(seconds: 1)); // delete this

      /// Fetch data according to the type of guarantees selected from the previous page
      if (isNewMuslim) {
        guarantees = TestDataX.guarantees
            .where((x) => x.previousReligion != null)
            .toList();
      } else if (isEducationNewMuslim) {
        guarantees =
            TestDataX.guarantees.where((x) => x.courseName != null).toList();
      } else if (isEducationQuran) {
        guarantees = TestDataX.guarantees
            .where((x) =>
                x.muslimNum != null &&
                x.courseName == null &&
                x.previousReligion == null)
            .toList();
      } else if (isPreachers) {
        guarantees =
            TestDataX.guarantees.where((x) => x.muslimNum == null).toList();
      }

      /// Data initialization
      guaranteesResult.value = guarantees;
      for (int i = 0; i < guarantees.length; i++) {
        /// Create special button controllers for each card and link them to an identifier
        donationButtonsState[guarantees[i].id] = ButtonStateEX.normal;
        addToCartButtonsState[guarantees[i].id] = ButtonStateEX.normal;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Display texts on screen

  getTitle() {
    if (isNewMuslim) {
      return "Supporting a new Muslim's Islamization";
    } else if (isEducationNewMuslim) {
      return "Sponsoring the education of a new Muslim";
    } else if (isEducationQuran) {
      return "Supporting Quranic education";
    } else if (isPreachers) {
      return "Sponsoring preachers";
    }
  }

  getDescription() {
    if (isNewMuslim) {
      return "Sponsor the expenses of converting a new person to Islam";
    } else if (isEducationNewMuslim) {
      return "Sponsor the expenses for teaching a new Muslim the fundamentals of his religion";
    } else if (isEducationQuran) {
      return "Sponsor the expenses for teaching a new Muslim the Quran";
    } else if (isPreachers) {
      return "Sponsor the expenses of those who call to God";
    }
  }

  //----------------------------------------------------------------------------
  // Main processors

  onAddToCart(GuaranteeX guarantee) async {
    /// Mandatory login before add to cart
    if (!app.isLogin.value) {
      mandatoryAuthSheetX();
    } else if (isLoading.isFalse) {
      try {
        isLoading.value = true;
        addToCartButtonsState[guarantee.id] = ButtonStateEX.loading;

        /// Connect to basket Controller to add to cart in database
        await basketController.addGuarantee(guarantee);

        /// The time delay here is aesthetically beneficial
        addToCartButtonsState[guarantee.id] = ButtonStateEX.success;
        await Future.delayed(const Duration(seconds: 1));
        ToastX.success(message: "Added to cart successfully");
      } catch (error) {
        ToastX.error(message: error.toString());
        addToCartButtonsState[guarantee.id] = ButtonStateEX.failed;
        update();
      }

      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          addToCartButtonsState[guarantee.id] = ButtonStateEX.normal;
          update();
        },
      );
    }
  }

  onDonation(GuaranteeX guarantee) async {
    /// Mandatory login before donation
    if (!app.isLogin.value) {
      mandatoryAuthSheetX();
    } else if (isLoading.isFalse) {
      try {
        isLoading.value = true;
        donationButtonsState[guarantee.id] = ButtonStateEX.loading;

        /// TODO: Connect to the database to complete payment
        /// TODO: Go to the payment screen
        /// TODO: Connect to the database to add the donation to the account records
        await Future.delayed(const Duration(seconds: 1)); // delete this

        /// The time delay here is aesthetically beneficial
        donationButtonsState[guarantee.id] = ButtonStateEX.success;
        await Future.delayed(
          const Duration(seconds: StyleX.successButtonSecond),
        );

        ToastX.success(message: "Payment completed successfully");
      } catch (error) {
        ToastX.error(message: error.toString());
        donationButtonsState[guarantee.id] = ButtonStateEX.failed;
        update();
      }

      isLoading.value = false;

      /// Reset the button state
      Timer(
        const Duration(seconds: StyleX.returnButtonToNormalStateSecond),
        () {
          donationButtonsState[guarantee.id] = ButtonStateEX.normal;
          update();
        },
      );
    }
  }

  //----------------------------------------------------------------------------
  // Search & Filter

  onFilter() async {
    bool? result = await guaranteeFilterSheetX(
        controller: guaranteeFilterController);
    if (result == true) {
      /// TODO: Database >>> Add a guarantee filter
      /// TODO: Algorithm >>> Add a guarantee filter
      onSearching(search.text);
    }
  }

  onSearching(String search) async {
    /// TODO: Expected Condition >>> Change the search code if you want to retrieve search results from the database
    try {
      /// clean search text from withe space and convert all char to lower case for contains with guarantee data
      search = search.toLowerCase().trimLeft().trimRight();

      /// Bring all guarantees that partially or completely match the all data
      guaranteesResult.value = guarantees
          .where((guarantee) =>
              guarantee.language.toLowerCase().contains(search) ||
              guarantee.country.toLowerCase().contains(search) ||
              guarantee.gender.toLowerCase().contains(search) ||
              guarantee.donationAmount.toString().contains(search) ||
              (guarantee.courseName != null
                  ? guarantee.courseName!.toLowerCase().contains(search)
                  : false) ||
              (guarantee.previousReligion != null
                  ? guarantee.previousReligion!.toLowerCase().contains(search)
                  : false) ||
              (guarantee.muslimNum != null
                  ? guarantee.muslimNum!.toString().contains(search)
                  : false))
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }
  //===================================================================
}
