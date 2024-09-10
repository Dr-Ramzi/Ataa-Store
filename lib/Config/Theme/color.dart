part of '../config.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Manage all application colors and color tones
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class ColorX {
  /// Primary
  static MaterialColor primary =const MaterialColor(0xff127973, {
    50:Color(0xffE1F2F3),
    100:Color(0xffB3DEDF),
    200:Color(0xff8ac7c9),
    300:Color(0xff50afab),
    400:Color(0xff40a29e),
    500:Color(0xff0F9591),
    600:Color(0xff0C8583),
    700:Color(0xff127973),
    800:Color(0xff0E6863),
    900:Color(0xff074D49),
  });

  /// Results Cases
  static final MaterialColor success =
  ColorHelperX.toMaterial(const Color(0xff12B76A));
  static final MaterialColor warning =
  ColorHelperX.toMaterial(const Color(0xffFFF8F1));
  static const MaterialColor danger = MaterialColor(0xffe52c2c, {
    50:Color(0xfffceded),
    100:Color(0xffFDE8E8),
    200:Color(0xffeec9c9),
    300:Color(0xfff1a9a9),
    400:Color(0xffee6d6d),
    500:Color(0xffF05252),
    600:Color(0xffe52c2c),
    700:Color(0xffC81E1E),
    800:Color(0xffa91616),
    900:Color(0xFF8A2C0D),
  });

  /// Url Text
  static final MaterialColor url =
  ColorHelperX.toMaterial(const Color(0xff1A5BBB));

  /// Grey
  static const MaterialColor grey =MaterialColor(0xff6B7280, {
  50:Color(0xffF9FAFB),
  100:Color(0xffF3F4F6),
  200:Color(0xffE5E7EB),
  300:Color(0xffc2c6cc),
  400:Color(0xffa6acb7),
  500:Color(0xff6B7280),
  600:Color(0xff5c6069),
  700:Color(0xff2e2f3b),
  800:Color(0xff252631),
  900:Color(0xff20212a),
  });

  /// Background
  static const Color backgroundLight = Color(0xffF9FAFB);
  static const Color backgroundDark = Color(0xff20212a);

  /// Gradients
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primary.shade100],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
