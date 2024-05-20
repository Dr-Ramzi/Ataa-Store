part of '../../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Contains links to database connection points
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class DBEndPointX {
  //============================================================================
  // Main API links
  static const String mainAPI = 'https://ataa-store-backend-testing.edialoguecenter.com/api/v1/';

  //============================================================================
  // Metal prices

  static const String gold = 'https://api.gold-api.com/price/XAU';
  static const String silver = 'https://api.gold-api.com/price/XAG';

  //============================================================================
  // Auth

  static const String postSignUp = '${mainAPI}register';
  static const String postLoginByPhone = '${mainAPI}login/mobile';
  static const String postLoginByEmail = '${mainAPI}login/email';
  static const String postVerifyOtpPhone = '${mainAPI}verify-otp/mobile';
  static const String postVerifyOtpEmail = '${mainAPI}verify-otp/email';
  static const String putCompleteDataSingUp = '${mainAPI}register/complete';
  static const String postLogout = '${mainAPI}logout';

  //============================================================================
  // Profile

  static const String getProfile = '${mainAPI}profile';
  static const String postUpdateProfile = '${mainAPI}update-profile';

}
