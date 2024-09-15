/// Contains links to database connection points
class RemoteEndPointX {
  static String baseUrl = '';
  //============================================================================
  // Main API links
  static const String mainAPI = 'https://ataa-store-backend-testing.edialoguecenter.com/api/v1/';

  //============================================================================
  // Donation

  static const String getAllDonations = '${mainAPI}projects';
  static const String getDonationsBySearch = '${mainAPI}projects/search';
  static const String getDonationDetails = '${mainAPI}projects/{code}';

  //============================================================================
  // Donation Order

  static const String postCreateDonationOrder = '${mainAPI}projects/orders';

  //============================================================================
  // Zakat

  static const String getDefaultZakat = '${mainAPI}projects/default_zakat';
  static const String getAllDonationsZakat = '${mainAPI}projects/zakat';
  static const String getDonationsZakatBySearch = '${mainAPI}projects/search';
  static const String getDonationZakatDetails = '${mainAPI}projects/{code}';


  // ============================================================================
  // Zakat Calculation

  static const String postZakatCalculation = '${mainAPI}calculation/zakat';
  static const String postMetalPrice = '${mainAPI}metal/price';


  //============================================================================
  // Bank Account For Ataa

  static const String getAllActiveBankForAtaa = '${mainAPI}organization/banks';
  static const String getBankAccountDetailsForAtaa = '${mainAPI}organization/bank-accounts/{id}';


  //============================================================================
  // Gift Order

  static const String postCreateGiftOrder = '${mainAPI}gift/orders';
  /// هذا لم يتم إنشاء موديل خاص به
  static const String getAllGiftOrders = '${mainAPI}gift/orders';
  static const String getGiftOrderDetails = '${mainAPI}gift/orders/{id}';
  /// هذا لم يتم إنشاء موديل خاص به
  static const String putUpdateGiftOrderSendStatus = '${mainAPI}notification/gift-order/{id}';

  //============================================================================
  // Gift Category

  static const String getAllGiftCategories = '${mainAPI}gift/categories';
  static const String getGiftCategoryDetails = '${mainAPI}gift/categories/{id}';







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
  static const String postUpdateProfile = '${mainAPI}update-profile';

  //============================================================================
  // Setting

  static const String getGeneralAppSettings = '${mainAPI}portal-settings/general';
  static const String getPaymentMethodsSettings = '${mainAPI}portal-settings/payment-methods';

  //============================================================================
  // Organization

  static const String getAllOrganizations = '${mainAPI}donations/categories';
  static const String getOrganizationDetails = '${mainAPI}donations/categories/{id}';

  //============================================================================
  // Payment Transaction

  /// يمكن هاد الرابط بده حذف
  static const String postCreatePaymentTransactionForOrganization = '${mainAPI}payments/checkout/quick-donation/{id}';
  static const String postCreatePaymentTransactionForCart = '${mainAPI}payments/checkout/cart';
  static const String postCreatePaymentTransactionForDonationOrder = '${mainAPI}payments/checkout/project/{id}';
  static const String postCreatePaymentTransactionForGiftOrder = '${mainAPI}payments/checkout/project/{id}';
  static const String postAssignPaymentTransactionAssign = '${mainAPI}payments/assign/{code}';

  //============================================================================
  // Countries

  static const String getAllCountries = '${mainAPI}countries';
  static const String getAllCities = '${mainAPI}cities';

  //============================================================================
  // Cart

  static const String postAssignCart = '${mainAPI}carts/{cart_id}/assign-my-cart';
  static const String getAllCartItems = '${mainAPI}carts/items/{cart_id}';
  static const String postCreateCartItem = '${mainAPI}carts/items/{cart_id}';
  static const String putUpdateCartItem = '${mainAPI}carts/items/{cart_id}';
  static const String deleteCartItem = '${mainAPI}carts/items/{item_id}';
  static const String deleteAllCartItems = '${mainAPI}carts/items/delete-all/{cart_id}';


  //============================================================================
  // Delivery Location

  static const String postCreateDeliveryLocation = '${mainAPI}carts/location';
  static const String putUpdateDeliveryLocation = '${mainAPI}carts/location/{id}';

  //============================================================================
  // Payment Card

  static const String postPaymentCardValidation = '${mainAPI}payments/cards/validation';
  static const String putSetDefaultPaymentCard = '${mainAPI}payments/cards/{id}/assign-default';
  static const String getAllPaymentCards = '${mainAPI}payments/cards';
  static const String getPaymentCardDetails = '${mainAPI}payments/cards/{id}';
  static const String postCreatePaymentCard = '${mainAPI}payments/cards';
  static const String deletePaymentCard = '${mainAPI}payments/cards/{id}';
  static const String putUpdatePaymentStatusCard = '${mainAPI}payments/cards/status/{gateway_id}';

  //============================================================================
  // Payment Transaction

  static const String getAllPaymentTransactionItem = '${mainAPI}payments/transactions/item';

  //============================================================================
  // Rating

  static const String postCreateRating = '${mainAPI}ratings';


}
