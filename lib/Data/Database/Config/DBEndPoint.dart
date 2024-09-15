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
  static const String postResendOtp = '${mainAPI}re-send';
  static const String putCompleteDataSingUp = '${mainAPI}register/complete';
  static const String postLogout = '${mainAPI}logout';

  //============================================================================
  // Profile

  static const String getProfile = '${mainAPI}profile';
  static const String putUpdateProfile = '${mainAPI}profile';
  static const String postResendOTPUpdateProfile = '${mainAPI}profile/re-send';
  static const String postVerifyUpdateProfile = '${mainAPI}profile/verify';
  static const String deleteProfileImage = '${mainAPI}profile/image';

  //============================================================================
  // Statistics

  static const String getDonationStatistics = '${mainAPI}payments/statics';
  static const String getCampaignStatistics = '${mainAPI}1 --------Add Here----------';
  static const String getOrderStatistics = '${mainAPI}1 --------Add Here----------';
  static const String getGiftStatistics = '${mainAPI}gift/statics';
  static const String getDeductionStatistics = '${mainAPI}donations/recurring-donations/donation-subscriptions/statistic';
  static const String getSponsorshipStatistics = '${mainAPI}3 --------Add Here----------';
  static const String getShareLinkStatistics = '${mainAPI}4 --------Add Here----------';

  //============================================================================
  // Ads

  static const String getAds = '${mainAPI}portal-settings/banner';

  //============================================================================
  // Pages

  static const String getDynamicPages = '${mainAPI}portal-settings/site-pages';
  static const String getAboutPage = '${mainAPI}portal-settings/site-pages';
  static const String getContactUsPage = '${mainAPI}portal-settings/site-pages';
  static const String getPrivacyPolicyPage = '${mainAPI}portal-settings/site-pages';
  static const String getTermsAndConditionsPage = '${mainAPI}portal-settings/site-pages';

  //============================================================================
  // General

  static const String getGeneralSettings = '${mainAPI}portal-settings/general';
  static const String getGeneralStatistics = '${mainAPI}portal-settings/statistics';

  //============================================================================
  // Testimonials

  static const String getTestimonials = '${mainAPI}portal-settings/testimonial';

  //============================================================================
  // Partners

  static const String getPartners = '${mainAPI}portal-settings/partner';

  //============================================================================
  // Bank Account

  static const String getAllBanks = '${mainAPI}organization/banks';
  static const String getBankDetails = '${mainAPI}organization/bank-accounts/{id}';

  //============================================================================
  // Organization

  static const String getAllOrganizations = '${mainAPI}donations/categories';
  static const String getOrganizationDetails = '${mainAPI}donations/categories/{id}';

  //============================================================================
  // Donation

  static const String getAllDeductions = '${mainAPI}donations/recurring-donations';
  static const String getDeductionsBySearch = '${mainAPI}donations/recurring-donations/search';
  static const String getDeductionDetails = '${mainAPI}donations/recurring-donations/{id}';

  //============================================================================
  // Donation

  static const String getAllDonations = '${mainAPI}projects';
  static const String getDonationsBySearch = '${mainAPI}projects/search';
  static const String getDonationDetails = '${mainAPI}projects/{code}';
  static const String getDefaultZakat = '${mainAPI}projects/default_zakat';
  static const String getProjectIsShowInQuickDonation = '${mainAPI}projects/show_quick_donation';

  //============================================================================
  // Cart

  static const String postAssignCart = '${mainAPI}carts/{cart_id}/assign-my-cart';
  static const String getCreateCartID = '${mainAPI}carts/items/';
  static const String getAllCartItems = '${mainAPI}carts/items/{cart_id}';
  static const String postCreateCartItem = '${mainAPI}carts/items/{cart_id}';
  static const String putUpdateCartItem = '${mainAPI}carts/items/{cart_id}';
  static const String deleteCartItem = '${mainAPI}carts/items/{item_id}';
  static const String deleteAllCartItems = '${mainAPI}carts/items/delete-all/{cart_id}';

  //============================================================================
  // Gift

  static const String getAllGiftCategories = '${mainAPI}gift/categories';
  static const String getGiftCategoryDetails = '${mainAPI}gift/categories/{id}';
  static const String postCreateGiftOrder = '${mainAPI}gift/orders';
  static const String getAllMyGiftOrders = '${mainAPI}gift/orders';
  static const String getMyGiftOrderDetails = '${mainAPI}gift/orders/{id}';
  static const String getGiftMessageTemplate = '${mainAPI}portal-settings/notification-templates/gift';

}
