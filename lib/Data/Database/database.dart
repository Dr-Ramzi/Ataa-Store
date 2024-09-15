part of '../data.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Manage all database connections
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class DatabaseX {
  static init() async {
    try {
      /// Here codes are added to configure anything within this section when the application starts
    } catch (e) {
      return Future.error(e);
    }
  }

  //============================================================================
  // Auth

  static Future<String?> signUp({
    required String name,
    required int phone,
    required int countryCode,
  }) async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postSignUp,
      body: {
        NameX.name: name,
        NameX.phone: phone,
        NameX.countryCode: countryCode
      },
    );
    return data.$2;
  }

  static Future<String?> loginByPhone({
    required int phone,
    required int countryCode,
  }) async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postLoginByPhone,
      body: {NameX.phone: phone, NameX.countryCode: countryCode},
    );
    return data.$2;
  }

  static Future<String?> loginByEmail({required String email}) async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postLoginByEmail,
      body: {NameX.email: email},
    );
    return data.$2;
  }

  static Future<UserX> otpByPhone({
    required int otp,
    required int phone,
    required int countryCode,
  }) async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postVerifyOtpPhone,
      body: {
        NameX.phone: phone,
        NameX.countryCode: countryCode,
        NameX.otp: otp
      },
    );
    return UserX.fromJson(data.$1[NameX.data], data.$1[NameX.token]);
  }

  static Future<UserX> otpByEmail({
    required int otp,
    required String email,
  }) async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postVerifyOtpEmail,
      body: {NameX.email: email, NameX.otp: otp.toString()},
    );
    return UserX.fromJson(data.$1[NameX.data], data.$1[NameX.token]);
  }

  static Future<UserX?> completeDataSingUp({
    required String gender,
    required String email,
  }) async {
    var data = await RemoteDataSourceX.put(DBEndPointX.putCompleteDataSingUp,
        param: DataSourceParamX(authToken: LocalDataX.token),
        body: {
          NameX.email: email.toLowerCase().trim(),
          NameX.gender: gender.toLowerCase().trim()
        });
    try {
      return UserX.fromJson(data.$1[NameX.data], LocalDataX.token);
    } catch (_) {
      return null;
    }
  }

  static Future<UserX?> otpUpdateProfile({required int otp}) async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postVerifyUpdateProfile,
      param: DataSourceParamX(
        authToken: LocalDataX.token,
        requestBody: {NameX.otp: otp},
      ),
    );
    try {
      return UserX.fromJson(data.$1[NameX.data], LocalDataX.token);
    } catch (e) {
      return null;
    }
  }

  static Future<String?> resendOtpUpdateProfile() async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postResendOTPUpdateProfile,
      param: DataSourceParamX(authToken: LocalDataX.token),
    );
    return data.$2;
  }

  static Future<String?> resendOtpByPhone({
    required int phone,
    required int countryCode,
  }) async {
    var data = await RemoteDataSourceX.post(
      DBEndPointX.postResendOtp,
      body: {
        NameX.phone: phone,
        NameX.countryCode: countryCode,
      },
    );
    return data.$2;
  }

  static Future<void> logout() async {
    await RemoteDataSourceX.post(
      DBEndPointX.postLogout,
      param: DataSourceParamX(
        authToken: LocalDataX.token,
        ignoreUnauthorized: true,
        ignoreError: true,
      ),
    );
  }

  //============================================================================
  // Profile

  static Future<UserX?> getProfile() async {
    try {
      var data = await RemoteDataSourceX.get(
        DBEndPointX.getProfile,
        param: DataSourceParamX(
          maxRetries: 3,
          localCacheKey: 'profile',
          localCacheMaxAge: const Duration(days: 3),
          authToken: LocalDataX.token,
        ),
      );
      return UserX.fromJson(
          Map<String, dynamic>.from(data.$1[NameX.data]), LocalDataX.token);
    } catch (error) {
      error.toErrorX.log();
      if (error.toErrorX.errorCode == ErrorCodesX.unauthorized) {
        AppControllerX app = Get.find();
        await app.logOut();
      } else {
        rethrow;
      }
    }
    return null;
  }

  static Future<(UserX?, String?)> updateProfile({
    required String gender,
    required int phone,
    required int countryCode,
    required String? name,
    required String? email,
    required File? image,
  }) async {
    try {
      var requestBody = {
        NameX.name: name?.trim(),
        NameX.phone: phone,
        NameX.countryCode: countryCode,
        NameX.gender: gender.toLowerCase().trim(),
        NameX.email: email?.toLowerCase().trim(),
      };
      (dynamic, String?) data;
      if (image != null) {
        data = await RemoteDataSourceX.putFiles(
          DBEndPointX.putUpdateProfile,
          {NameX.imageFile: image},
          param: DataSourceParamX(
            requestBody: requestBody,
            authToken: LocalDataX.token,
            requestTimeout: const Duration(seconds: 20),
          ),
        );
      } else {
        data = await RemoteDataSourceX.put(
          DBEndPointX.putUpdateProfile,
          param: DataSourceParamX(
            authToken: LocalDataX.token,
            requestBody: requestBody,
          ),
        );
      }
      try {
        return (UserX.fromJson(data.$1[NameX.data], LocalDataX.token), data.$2);
      } catch (e) {
        return (null, data.$2);
      }
    } catch (e) {
      e.toErrorX.log();
      rethrow;
    }
  }

  static Future<void> deleteProfileImage() async {
    await RemoteDataSourceX.delete(
      DBEndPointX.deleteProfileImage,
      param: DataSourceParamX(authToken: LocalDataX.token),
    );
  }

  //============================================================================
  // General Settings

  static Future<GeneralAppSettingsX> getGeneralSettings() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getGeneralSettings,
      param: DataSourceParamX(
        maxRetries: 3,
        localCacheKey: 'general_settings',
        localCacheMaxAge: const Duration(days: 3),
      ),
    );
    return GeneralAppSettingsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  //============================================================================
  // Ads

  static Future<List<AdsX>> getAds() async {
    try {
      var data = await RemoteDataSourceX.get(
        DBEndPointX.getAds,
        param: DataSourceParamX(
          localCacheKey: 'ads',
          localCacheMaxAge: const Duration(days: 1),
          authToken: LocalDataX.token,
        ),
      );
      return ModelUtilX.generateItems<AdsX>(data.$1[NameX.data], AdsX.fromJson);
    } catch (error) {
      return Future.error(error);
    }
  }

  //============================================================================
  // General Statistics

  static Future<List<GeneralStatisticX>> getGeneralStatistics({
    int page = 1,
    int perPage = 20,
  }) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getGeneralStatistics,
      param: DataSourceParamX(
        localCacheKey: 'general_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return ModelUtilX.generateItems<GeneralStatisticX>(
        data.$1[NameX.data], GeneralStatisticX.fromJson);
  }

  //============================================================================
  // Testimonials

  static Future<List<TestimonialX>> getTestimonials({
    int page = 1,
    int perPage = 20,
  }) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getTestimonials,
      param: DataSourceParamX(
        localCacheKey: 'testimonials',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return ModelUtilX.generateItems<TestimonialX>(
      data.$1[NameX.data],
      TestimonialX.fromJson,
    );
  }
  //============================================================================
  // Partners

  static Future<List<PartnerX>> getPartners({
    int page = 1,
    int perPage = 20,
  }) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getPartners,
      param: DataSourceParamX(
        localCacheKey: 'partners',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return ModelUtilX.generateItems<PartnerX>(
      data.$1[NameX.data],
      PartnerX.fromJson,
    );
  }

  //============================================================================
  // Pages

  static Future<List<PageX>> getDynamicPages({
    int page = 1,
    int perPage = 20,
  }) async {
    List<String> exclude = [
      NameX.aboutPage,
      NameX.contactUsPage,
      NameX.termsAndConditionsPage,
      NameX.privacyPolicyPage,
    ];
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getDynamicPages,
      param: DataSourceParamX(
        page: page,
        limit: perPage,
        localCacheKey: 'dynamic_pages',
        localCacheMaxAge: const Duration(days: 1),
        authToken: LocalDataX.token,
      ),
    );
    return ModelUtilX.generateItems<PageX>(data.$1[NameX.data], PageX.fromJson)
        .where(
          (page) => !exclude.contains(page.tag),
        )
        .toList();
  }

  static Future<PageX> getAboutPage() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getAboutPage,
      param: DataSourceParamX(
        localCacheKey: 'about_page',
        localCacheMaxAge: const Duration(days: 3),
      ),
    );
    var aboutData = List.from(data.$1[NameX.data] ?? [])
        .firstWhereOrNull((page) => page[NameX.tag] == NameX.aboutPage);
    return PageX.fromJson(Map<String, dynamic>.from(aboutData ?? {}));
  }

  static Future<PageX> getContactUsPage() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getContactUsPage,
      param: DataSourceParamX(
        localCacheKey: 'contact_us_page',
        localCacheMaxAge: const Duration(days: 3),
      ),
    );
    var contactUsData = List.from(data.$1[NameX.data] ?? [])
        .firstWhereOrNull((page) => page[NameX.tag] == NameX.contactUsPage);
    return PageX.fromJson(Map<String, dynamic>.from(contactUsData ?? {}));
  }

  static Future<PageX> getTermsAndConditionsPage() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getTermsAndConditionsPage,
      param: DataSourceParamX(
        localCacheKey: 'terms_and_conditions_page',
        localCacheMaxAge: const Duration(days: 3),
      ),
    );
    var termsAndConditionsData = List.from(data.$1[NameX.data] ?? [])
        .firstWhereOrNull(
            (page) => page[NameX.tag] == NameX.termsAndConditionsPage);
    return PageX.fromJson(
        Map<String, dynamic>.from(termsAndConditionsData ?? {}));
  }

  static Future<PageX> getPrivacyPolicyPage() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getPrivacyPolicyPage,
      param: DataSourceParamX(
        localCacheKey: 'privacy_policy_page',
        localCacheMaxAge: const Duration(days: 3),
      ),
    );
    var privacyPolicyData = List.from(data.$1[NameX.data] ?? [])
        .firstWhereOrNull((page) => page[NameX.tag] == NameX.privacyPolicyPage);
    return PageX.fromJson(Map<String, dynamic>.from(privacyPolicyData ?? {}));
  }

  //============================================================================
  // Bank Accounts

  static Future<List<BankX>> getAllBanks({
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      var data = await RemoteDataSourceX.get(
        DBEndPointX.getAllBanks,
        param: DataSourceParamX(
          page: page,
          limit: perPage,
          localCacheKey: 'all-banks',
          localCacheMaxAge: const Duration(days: 3),
        ),
      );
      return ModelUtilX.generateItems<BankX>(
        data.$1[NameX.data],
        BankX.fromJson,
      );
    } catch (error) {
      return Future.error(error);
    }
  }

  //============================================================================
  // Deduction

  static Future<DeductionX> getDeductionDetails({required String id}) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getDeductionDetails,
      param: DataSourceParamX(
        localCacheKey: 'deduction_details_$id',
        localCacheMaxAge: const Duration(days: 1),
        authToken: LocalDataX.token,
        pathParams: {NameX.id: id},
      ),
    );
    return DeductionX.fromJson(
      Map<String, dynamic>.from(
        data.$1[NameX.data],
      ),
    );
  }

  static Future<List<DeductionX>> getAllDeductions({
    bool? isHome,
    String? categoryID,
    int page = 1,
    int perPage = 20,
  }) async {
    Map<String, dynamic>? filterParams = {
      NameX.isShowHome: isHome.toIntNullableX,
      NameX.donationCategoryId: categoryID,
    };
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getAllDeductions,
      param: DataSourceParamX(
        localCacheKey: 'deduction_$filterParams',
        localCacheMaxAge: const Duration(days: 3),
        page: page,
        limit: perPage,
        filterParams: filterParams,
      ),
    );
    List<DeductionX> result =
        ModelUtilX.generateItems(data.$1[NameX.data], DeductionX.fromJson);
    return result;
  }

  static Future<List<DeductionX>> getDeductionsBySearch({
    String? sortType,
    String? recurring,
    String? categoryID,
    String? searchQuery,
    int page = 1,
    int perPage = 20,
  }) async {
    Map<String, dynamic>? filterParams = {
      NameX.sortType: sortType,
      if (recurring != null) NameX.manyRecurring: [recurring],
      NameX.donationCategoryId: categoryID,
    };
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getDeductionsBySearch,
      param: DataSourceParamX(
        localCacheKey: 'deductions_by_search_$filterParams',
        localCacheMaxAge: const Duration(days: 3),
        page: page,
        limit: perPage,
        filterParams: filterParams,
        search: searchQuery,
        searchKey: NameX.search,
      ),
    );
    List<DeductionX> result =
        ModelUtilX.generateItems(data.$1[NameX.data], DeductionX.fromJson);
    return result;
  }

  //============================================================================
  // Donations

  static Future<List<DonationX>> getAllDonations({
    bool? isHome,
    bool? isZakat,
    String? categoryID,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      Map<String, dynamic>? filterParams = {
        NameX.isShowHome: isHome.toIntNullableX,
        NameX.isZakat: isZakat.toIntNullableX,
        NameX.donationCategoryId: categoryID,
      };
      var data = await RemoteDataSourceX.get(
        DBEndPointX.getAllDonations,
        param: DataSourceParamX(
          localCacheKey: 'donations_$filterParams',
          localCacheMaxAge: const Duration(days: 3),
          page: page,
          limit: perPage,
          filterParams: filterParams,
        ),
      );
      List<DonationX> result =
          ModelUtilX.generateItems(data.$1[NameX.data], DonationX.fromJson);
      if (result.isEmpty && isZakat == true) {
        result = [await getDefaultZakat()];
      }
      return result;
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<List<DonationX>> getDonationsBySearch({
    bool? isZakat,
    String? sortType,
    String? categoryID,
    String? searchQuery,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      Map<String, dynamic>? filterParams = {
        NameX.isZakat: isZakat.toIntNullableX,
        NameX.donationCategoryId: categoryID,
        NameX.sortType: sortType,
      };
      var data = await RemoteDataSourceX.get(
        DBEndPointX.getDonationsBySearch,
        param: DataSourceParamX(
          localCacheKey: 'donations_by_search_$filterParams',
          localCacheMaxAge: const Duration(days: 3),
          page: page,
          limit: perPage,
          filterParams: filterParams,
          search: searchQuery,
          searchKey: NameX.search,
        ),
      );
      List<DonationX> result =
          ModelUtilX.generateItems(data.$1[NameX.data], DonationX.fromJson);
      if (result.isEmpty &&
          isZakat == true &&
          (searchQuery == null || searchQuery.isEmpty)) {
        result = [await getDefaultZakat()];
      }
      return result;
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<DonationX> getDonationDetails({required int code}) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getDonationDetails,
      param: DataSourceParamX(
        localCacheKey: 'donation_details_$code',
        localCacheMaxAge: const Duration(days: 1),
        authToken: LocalDataX.token,
        pathParams: {NameX.code: code},
      ),
    );
    return DonationX.fromJson(
      Map<String, dynamic>.from(
        data.$1[NameX.data],
      ),
    );
  }

  static Future<DonationX> getDefaultZakat() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getDefaultZakat,
      param: DataSourceParamX(
        localCacheKey: 'default_zakat',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return DonationX.fromJson(Map<String, dynamic>.from(data.$1[NameX.data]));
  }
  //============================================================================
  // Organizations

  static Future<List<OrganizationX>> getAllOrganizations({
    bool? isHome,
    bool? isQuickDonation,
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      Map<String, dynamic>? filterParams = {
        NameX.isShowHome: isHome.toIntNullableX,
        NameX.isQuickDonation: isQuickDonation.toIntNullableX,
      };
      var data = await RemoteDataSourceX.get(
        DBEndPointX.getAllOrganizations,
        param: DataSourceParamX(
          localCacheKey: 'all_organizations$filterParams',
          localCacheMaxAge: const Duration(days: 3),
          page: page,
          limit: perPage,
          filterParams: filterParams,
        ),
      );
      return ModelUtilX.generateItems(
          data.$1[NameX.data], OrganizationX.fromJson);
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future<OrganizationX> getOrganizationDetails({
    required String id,
  }) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getOrganizationDetails,
      param: DataSourceParamX(
        localCacheKey: 'organization_details_$id',
        localCacheMaxAge: const Duration(days: 1),
        authToken: LocalDataX.token,
        pathParams: {NameX.id: id},
      ),
    );
    return OrganizationX.fromJson(
      Map<String, dynamic>.from(
        data.$1[NameX.data],
      ),
    );
  }

  //============================================================================
  // Gift

  static Future<List<GiftCategoryX>> getAllGiftCategories({
    int page = 1,
    int perPage = 20,
  }) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getAllGiftCategories,
      param: DataSourceParamX(
        localCacheKey: 'all_gift_categories',
        localCacheMaxAge: const Duration(days: 3),
        page: page,
        limit: perPage,
      ),
    );
    return ModelUtilX.generateItems(
      data.$1[NameX.data],
      GiftCategoryX.fromJson,
    );
  }

  static Future<GiftCategoryX> getGiftCategoryDetails({
    required String id,
  }) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getGiftCategoryDetails,
      param: DataSourceParamX(
        localCacheKey: 'gift_category_details_$id',
        localCacheMaxAge: const Duration(days: 1),
        authToken: LocalDataX.token,
        pathParams: {NameX.id: id},
      ),
    );
    return GiftCategoryX.fromJson(
      Map<String, dynamic>.from(
        data.$1[NameX.data],
      ),
    );
  }

  static Future<GiftMessageX> getGiftMessageTemplate() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getGiftMessageTemplate,
      param: DataSourceParamX(
        localCacheKey: 'get_gift_message_template',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return GiftMessageX.fromJson(
      Map<String, dynamic>.from(
        data.$1[NameX.data],
      ),
    );
  }

  //============================================================================
  // Cart

  static Future assignCart(String cartId) async {
    try {
      return await RemoteDataSourceX.post(
        DBEndPointX.postAssignCart,
        param: DataSourceParamX(
          maxRetries: 3,
          authToken: LocalDataX.token,
          pathParams: {NameX.cartId: cartId},
        ),
      );
    } catch (e) {
      if (e.toErrorX.errorCode == ErrorCodesX.notFound) {
        return;
      } else {
        rethrow;
      }
    }
  }

  static Future<CartX> createCart() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getCreateCartID,
      param: DataSourceParamX(
        authToken: LocalDataX.token,
      ),
    );
    return CartX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future<CartX> getAllCartItems(String cartId) async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getAllCartItems,
      param: DataSourceParamX(
        authToken: LocalDataX.token,
        pathParams: {NameX.cartId: cartId},
      ),
    );
    return CartX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future createCartItem(
    String cartId,
    String modelType,
    String modelId, {
    int quantity = 1,
  }) async {
    try {
      var data = await RemoteDataSourceX.post(
        DBEndPointX.postCreateCartItem,
        param: DataSourceParamX(
          authToken: LocalDataX.token,
          pathParams: {NameX.cartId: cartId},
          requestBody: {
            NameX.cartId:cartId,
            NameX.modelType:modelType,
            NameX.modelId:modelId,
          }
        ),
      );
    } catch (error) {
      return Future.error(error);
    }
  }
  // postCreateCartItem
  // putUpdateCartItem
  // deleteCartItem
  // deleteAllCartItems
  //============================================================================
  // Gold & Silver Price

  static Future<DonationStatisticsX> getDonationStatistics() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getDonationStatistics,
      param: DataSourceParamX(
        localCacheKey: 'donation_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return DonationStatisticsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future<CampaignStatisticsX> getCampaignStatistics() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getCampaignStatistics,
      param: DataSourceParamX(
        localCacheKey: 'campaign_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return CampaignStatisticsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future<OrderStatisticsX> getOrderStatistics() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getOrderStatistics,
      param: DataSourceParamX(
        localCacheKey: 'order_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return OrderStatisticsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future<GiftStatisticsX> getGiftStatistics() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getGiftStatistics,
      param: DataSourceParamX(
        localCacheKey: 'gift_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return GiftStatisticsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future<DeductionStatisticsX> getDeductionStatistics() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getDeductionStatistics,
      param: DataSourceParamX(
        localCacheKey: 'deduction_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return DeductionStatisticsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future<SponsorshipStatisticsX> getSponsorshipStatistics() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getSponsorshipStatistics,
      param: DataSourceParamX(
        localCacheKey: 'sponsorship_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return SponsorshipStatisticsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  static Future<ShareLinkStatisticsX> getShareLinkStatistics() async {
    var data = await RemoteDataSourceX.get(
      DBEndPointX.getShareLinkStatistics,
      param: DataSourceParamX(
        localCacheKey: 'share_link_statistics',
        localCacheMaxAge: const Duration(days: 3),
        authToken: LocalDataX.token,
      ),
    );
    return ShareLinkStatisticsX.fromJson(
      Map<String, dynamic>.from(data.$1[NameX.data]),
    );
  }

  //============================================================================
  // Gold & Silver Price

  static Future getGoldPrice() async {
    try {
      var data = await RemoteDataSourceX.get(DBEndPointX.gold);
      if (data.$1 != null) {
        return data.$1[NameX.price];
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  static Future getSilverPrice() async {
    var data = await RemoteDataSourceX.get(DBEndPointX.silver);
    if (data.$1 != null) {
      return data.$1[NameX.price];
    }
  }
}
