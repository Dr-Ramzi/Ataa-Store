part of '../../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Contains links to database connection points
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class DBEndPointX {
  //============================================================================
  // Main API links

  static const String mainAPI = 'https://ataa-store-backend-testing.edialoguecenter.com/api/v1/';

  //============================================================================
  // Auth

  static const String postSignUp = '${mainAPI}register';
  static const String postLoginByPhone = '${mainAPI}login/mobile';
  static const String postLoginByEmail = '${mainAPI}login/email';
  static const String putCompleteDataSingUp = '${mainAPI}register/complete';
  static const String postLogout = '${mainAPI}logout';

  //============================================================================
  // OTP

  static const String postVerifyOtpPhone = '${mainAPI}verify-otp/mobile';
  static const String postVerifyOtpEmail = '${mainAPI}verify-otp/email';
  static const String postResendOtp = '${mainAPI}re-send';
  static const String postResendOTPUpdateProfile = '${mainAPI}profile/re-send';
  static const String postOtpVerifyUpdateProfile = '${mainAPI}profile/verify';

  //============================================================================
  // Profile

  static const String getProfile = '${mainAPI}profile';
  static const String putUpdateProfile = '${mainAPI}profile';
  static const String putUploadProfileImage = '${mainAPI}profile/image';
  static const String deleteProfileImage = '${mainAPI}profile/image';

  //============================================================================
  // General

  static const String getGeneralSettings = '${mainAPI}portal-settings/general';
  static const String getGeneralStatistics = '${mainAPI}portal-settings/statistics';
  static const String getGeneralPaymentMethodsSettings = '${mainAPI}portal-settings/payment-methods';

  //============================================================================
  // Pages

  static const String getDynamicPages = '${mainAPI}portal-settings/site-pages';

  //============================================================================
  // About

  static const String getAboutPage = '${mainAPI}portal-settings/site-pages';
  static const String getPrivacyPolicyPage = '${mainAPI}portal-settings/site-pages';
  static const String getTermsAndConditionsPage = '${mainAPI}portal-settings/site-pages';

  //============================================================================
  // Content Us

  static const String getContentUs = '${mainAPI}organization/contact';
  static const String getContentUsSocialMedia = '${mainAPI}organization/social-media';
  static const String getContactUsPage = '${mainAPI}portal-settings/site-pages';

  //============================================================================
  // Bank Account

  static const String getAllActiveBanks = '${mainAPI}organization/banks';
  static const String getAllBanks = '${mainAPI}organization/bank-accounts';
  static const String getBankAccountDetails = '${mainAPI}organization/bank-accounts/{id}';

  //============================================================================
  // Gift

  static const String getAllGiftCategories = '${mainAPI}gift/categories';
  static const String getGiftCategoryDetails = '${mainAPI}gift/categories/{id}';
  static const String getGiftMessageTemplate = '${mainAPI}portal-settings/notification-templates/gift';
  // ---  gift order ---
  static const String postCreateGiftOrder = '${mainAPI}gift/orders';
  static const String getAllMyGiftOrders = '${mainAPI}gift/orders';
  static const String getMyGiftOrderDetails = '${mainAPI}gift/orders/{id}';

  //============================================================================
  // Statistics

  /// TODO: Database >>> add statistics end points
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
  // Testimonials

  static const String getTestimonials = '${mainAPI}portal-settings/testimonial';

  //============================================================================
  // Partners

  static const String getPartners = '${mainAPI}portal-settings/partner';

  //============================================================================
  // Organization

  static const String getAllOrganizations = '${mainAPI}donations/categories';
  static const String getOrganizationDetails = '${mainAPI}donations/categories/{id}';

  //============================================================================
  // Deduction

  static const String getAllDeductions = '${mainAPI}donations/recurring-donations';
  static const String getDeductionsBySearch = '${mainAPI}donations/recurring-donations/search';
  static const String getDeductionDetails = '${mainAPI}donations/recurring-donations/{id}';

  //============================================================================
  // Subscription

  static const String getAllMyDeductionSubscription= '${mainAPI}donations/recurring-donations/donation-subscriptions';
  static const String getMyDeductionSubscriptionDetails= '${mainAPI}donations/recurring-donations/donation-subscriptions/{id}';
  static const String putUpdateMyDeductionSubscriptionStatus= '${mainAPI}donations/recurring-donations/donation-subscriptions/{donation_subscription_id}/update-status';

  //============================================================================
  // Donation

  static const String getAllDonations = '${mainAPI}projects';
  static const String getDonationsBySearch = '${mainAPI}projects/search';
  static const String getDonationDetails = '${mainAPI}projects/{code}';
  static const String getDonationIsShowInQuickDonation = '${mainAPI}projects/show_quick_donation';
  static const String postCreateDonationOrder = '${mainAPI}projects/orders';

  //============================================================================
  // Zakat

  static const String getAllDonationOfZakat = '${mainAPI}projects/zakat';
  static const String getDefaultZakat = '${mainAPI}projects/default_zakat';

  //============================================================================
  // Zakat Calculation Management

  static const String postMetalPrice = '${mainAPI}metal/price';
  static const String postZakatCalculation = '${mainAPI}calculation/zakat';

  //============================================================================
  // Payment Transaction

  static const String getAllPaymentTransaction= '${mainAPI}payments/transactions';
  static const String getPaymentTransactionDetails= '${mainAPI}payments/transactions/{id}';
  static const String postCreatePaymentTransactionForQuickDonation = '${mainAPI}payments/checkout/quick-donation/{category_id}';
  static const String postCreatePaymentTransactionForCart = '${mainAPI}payments/checkout/cart';
  // static const String postCreatePaymentTransactionDonation = '${mainAPI}payments/checkout/project/{project_id}';
  static const String postCreatePaymentTransactionForDeduction = '${mainAPI}payments/checkout/recurring-donation/{recurring_donation_id}';
  // static const String postCreatePaymentTransactionGiftOrder = '${mainAPI}payments/checkout/{gift_id}';
  static const String postAssignPaymentTransaction = '${mainAPI}payments/assign/{payment_transactions_code}';

  //============================================================================
  // Location

  static const String getAllCountries = '${mainAPI}countries';
  static const String getAllCities = '${mainAPI}cities';
  static const String postCreateLocation = '${mainAPI}carts/location';
  static const String putUpdateLocation = '${mainAPI}carts/location/{id}';

  //============================================================================
  // Cart

  static const String getAllCartItems = '${mainAPI}carts/items/{cart_id}';
  static const String getCreateCartID = '${mainAPI}carts/items/';
  static const String postCreateCartItem = '${mainAPI}carts/items/{cart_id}';
  static const String putUpdateCartItem = '${mainAPI}carts/items/{item_id}';
  static const String postAssignCart = '${mainAPI}carts/{cart_id}/assign-my-cart';
  static const String deleteCartItem = '${mainAPI}carts/items/{item_id}';
  // static const String deleteAllCartItems = '${mainAPI}carts/items/delete-all/{cart_id}';

  //============================================================================
  // Payment Card

  // static const String postPaymentCardValidation = '${mainAPI}payments/cards/validation';
  static const String putUpdatePaymentCardAsDefault = '${mainAPI}payments/cards/{card_id}/assign-default';
  // static const String putUpdatePaymentCardStatus = '${mainAPI}payments/cards/status/{card_payment_gateway_card_id}';
  static const String getAllPaymentCards = '${mainAPI}payments/cards';
  static const String getPaymentCardDetails = '${mainAPI}payments/cards/{card_id}';
  static const String postCreatePaymentCard = '${mainAPI}payments/cards';
  static const String deletePaymentCard = '${mainAPI}payments/cards/{card_id}';

  //============================================================================
  // Rating

  static const String postRating= '${mainAPI}ratings';

  //============================================================================
  // Payment Transaction Item

  static const String getAllPaymentTransactionItemByModelType= '${mainAPI}payments/transactions/item';
  static const String getAllPaymentTransactionItemByModelTypeWithoutPaginated= '${mainAPI}payments/transactions/item/all';
  static const String getAllPaymentTransactionItemByModelId= '${mainAPI}payments/transactions/item/all';

}
