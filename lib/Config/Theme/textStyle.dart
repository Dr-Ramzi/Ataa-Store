part of '../config.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Manage text style and sizes
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class TextStyleX {

  /// Header
  static TextStyle headerLarge = const TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headerMedium = const TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headerSmall = const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
  );

  /// Title
  static TextStyle titleLarge = const TextStyle(
    fontSize: 19.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle titleMedium = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle titleSmall = const TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
  );


  /// SupTitle
  static TextStyle supTitleLarge = TextStyle(
    fontSize: 14.0,
    color: Get.theme.colorScheme.secondary,
    fontWeight: FontWeight.w500,
  );
  static TextStyle supTitleMedium = TextStyle(
    fontSize: 12.0,
    color: Get.theme.colorScheme.secondary,
    fontWeight: FontWeight.w400,
  );
  static TextStyle supTitleSmall = TextStyle(
    fontSize: 10.0,
    color: ColorX.grey.shade300,
  );

}
