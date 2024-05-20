part of '../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// All enums that are used throughout the project
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


//============================================================================
// Basic

enum DeviceTypeEX { mobile, tablet, desktop, web }

enum PlatformTypeEX { android, ios, web, mac, windows, linux, fuchsia }

enum SizeTypeEX { small, medium, large }

enum ButtonStateEX { normal, loading, success, failed }

//============================================================================
// Custom

enum ProductSortEX {
  all('All'),
  seller("Best seller"),
  rated("Highest rated"),
  priceHigh("Price from high to low"),
  priceLow("Price from lowest to highest");

  final String name;
  const ProductSortEX(this.name);
}

enum GeneralSortEX {
  all('All'),
  latestAddition("Latest addition"),
  oldestAddition("Oldest addition"),
  remainingAmountHigh("The remaining amount is from most to least"),
  remainingAmountLow("The remaining amount is from least to most");

  final String name;
  const GeneralSortEX(this.name);
}

enum FrequencySortEX { All, Daily, Weekly, Monthly }

enum CreditCardTypeEX {
  Master,
  Visa,
  Verve,
  Discover,
  AmericanExpress,
  DinersClub,
  Jcb,
  Mada,
  Others,
  Invalid
}
