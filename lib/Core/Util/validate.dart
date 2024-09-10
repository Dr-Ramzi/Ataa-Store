part of '../core.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this Util }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Entry field validations
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class ValidateX{

  /// Verify names
  static String? name(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z]+$';
    if (value!.trim().isEmpty) {
      return 'Name Required'.tr;
    } else if (value.trim().length < 2) {
      return 'It must be at least two characters'.tr;
    }else if (value.trim().length > 20) {
      return 'It must be no more than 20 characters'.tr;
    } else if (!RegExp(pattern).hasMatch(value.trim())) {
        return 'The name must consist of letters only'.tr;
    }
    return null;
  }

  /// Verify names
  static String? nameNoRequired(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z]+$';
    if (value!.trim().isEmpty) {
      return null;
    } else if (value.trim().length < 2) {
      return 'It must be at least two characters'.tr;
    }else if (value.trim().length > 20) {
      return 'It must be no more than 20 characters'.tr;
    } else if (!RegExp(pattern).hasMatch(value.trim())) {
        return 'The name must consist of letters only'.tr;
    }
    return null;
  }

  /// Verify long titles
  static String? title(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z0-9 -.]+$';
    if (value!.trim().isEmpty) {
      return 'Title Required'.tr;
    } else if (value.trim().length < 10) {
      return 'It must be at least 10 characters'.tr;
    }else if (value.trim().length > 100) {
      return 'It must be no more than 100 characters'.tr;
    } else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'It must consist of letters and numbers only'.tr;
    }
    return null;
  }

  /// Verify dates
  static String? date(String? value) {
    if (value!.trim().isEmpty) {
      return 'Date Required'.tr;
    }
    return null;
  }

  /// Verify street names
  static String? street(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z0-9 ,-.]+$';
    if (value!.trim().isEmpty) {
      return 'Street Required'.tr;
    } else if (value.trim().length < 2) {
      return 'It must be at least two characters'.tr;
    }else if (value.trim().length > 30) {
      return 'It must be no more than 30 characters'.tr;
    } else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter a valid street name'.tr;
    }
    return null;
  }

  /// Verify the district address
  static String? district(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z0-9 ,-.]+$';
    if (value!.trim().isEmpty) {
      return 'District Required'.tr;
    } else if (value.trim().length < 2) {
      return 'It must be at least two characters'.tr;
    }else if (value.trim().length > 30) {
      return 'It must be no more than 30 characters'.tr;
    } else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter a valid district address'.tr;
    }
    return null;
  }

  /// Verify the address
  static String? address(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z0-9 ,-.]+$';
    if (value!.trim().isEmpty) {
      return null;
    } else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter a valid address'.tr;
    }
    return null;
  }

  /// Verify the gram weight
  static String? gram(String? value) {
    String pattern = r'^[0-9]+$';
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return "Gram Required".tr;
    }else if (!regExp.hasMatch(value.trim())) {
      return 'It should contain gram only'.tr;
    }else if (double.parse(value)==0) {
      return 'The gram should not be 0'.tr;
    }
    return null;
  }

  /// Verify funds
  static String? money(String? value) {
    String pattern = r'^[0-9]+$';
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return "Money Required".tr;
    }else if (!regExp.hasMatch(value.trim())) {
      return 'It should contain money only'.tr;
    }else if (double.parse(value)==0) {
      return 'The money should not be 0'.tr;
    }
    return null;
  }

  /// Verify optional funds
  static String? moneyOptional(String? value) {
    String pattern = r'^[0-9]+$';
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return null;
    }else if (!regExp.hasMatch(value.trim())) {
      return 'It should contain money only'.tr;
    }else if (double.parse(value)==0) {
      return 'The money should not be 0'.tr;
    }
    return null;
  }

  /// Verify the phone number
  static String? phone(String? value) {
    String pattern = r'(^(?:[+0]9|00)?[0-9]{8,12}$)';
    if (value!.trim().isEmpty) {
      return 'Phone Required'.tr;
    }
    else if (!RegExp(pattern).hasMatch(value.trim().arabicToEnglishNumbers)) {
      return 'Enter a valid phone number'.tr;
    }
    return null;
  }

  /// Verify the phone number or email verification code
  static String? otp(String? value) {
    String pattern = r'^[0-9]+$';
    if (value!.trim().isEmpty) {
      return 'Code Required'.tr;
    } else if (value.trim().length != 4) {
      return 'It must consist of 4 numbers'.tr;
    }
    else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter a valid code'.tr;
    }
    return null;
  }

  /// Verify Email
  static String? email(String? value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value!.trim().isEmpty) {
      return 'Email Required'.tr;
    }
    else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter Valid Email'.tr;
    }
      return null;
  }
  static String? emailNoRequired(String? value) {
    if (value!.trim().isEmpty) {
      return null;
    }
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value.trim().isEmpty) {
      return 'Email Required'.tr;
    }
    else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter Valid Email'.tr;
    }
    return null;
  }

  /// Verify the CVV code
  static String? cvv(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required".tr;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid".tr;
    }
    return null;
  }

  /// Check bank card history
  static String? creditCardDate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required".tr;
    }
    int year;
    int month;
    // The value contains a forward slash if the month and year has been entered.
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = CreditCardUtilsX.convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!CreditCardUtilsX.hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

}