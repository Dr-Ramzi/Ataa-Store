import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/Model/Deduction/deduction.dart';
import '../../../../../Data/Model/Donation/donation.dart';
import '../../../../../Data/data.dart';
import '../../../../ScreenSheet/Other/ProductAddToCart/productAddToCart.dart';
import '../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';
import '../../../../ScreenSheet/Pay/SubscriptionDeduction/subscriptionDeductionSheet.dart';
import '../../../Basic/Root/controller/Controller.dart';

class HomeController extends GetxController {
  //============================================================================
  // Injection of required controls

  RootController root = Get.find();
  AppControllerX app = Get.find();

  //============================================================================
  // Variables

  ScrollController scrollController = ScrollController();

  List<AdsX> ads = [];
  List<DonationX> donations = [];
  List<OrganizationX> organizations = [];
  List<DeductionX> deductions = [];
  List<DonationX> zakat = [];
  List<ProductX> products = [];

  RxBool isHasErrorInDonations = false.obs;
  RxBool isHasErrorInOrganizations = false.obs;
  RxBool isHasErrorInDeductions = false.obs;
  RxBool isHasErrorInZakat = false.obs;
  RxBool isHasErrorInProducts = false.obs;

  //============================================================================
  // Functions

  //----------------------------------------------------------------------------
  // Get Data form Database

  getAds() async {
    try {
      ads = await DatabaseX.getAds();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<DonationX>> getDonations(
      ScrollRefreshLoadMoreParametersX data) async {
    try {
      var result = await DatabaseX.getAllDonations(
        isHome: true,
        isZakat: false,
        perPage: data.perPage,
        page: data.page,
      );
      isHasErrorInDonations.value = false;
      donations += result;
      return result;
    } catch (e) {
      isHasErrorInDonations.value = donations.isNotEmpty;
      return Future.error(e);
    }
  }

  Future<List<OrganizationX>> getOrganizations(
      ScrollRefreshLoadMoreParametersX data) async {
    try {
      var result = await DatabaseX.getAllOrganizations(
        isHome: true,
        perPage: data.perPage,
        page: data.page,
      );
      isHasErrorInOrganizations.value = false;
      organizations += result;
      return result;
    } catch (e) {
      isHasErrorInOrganizations.value = organizations.isNotEmpty;
      return Future.error(e);
    }
  }

  Future<List<DeductionX>> getDeductions(
      ScrollRefreshLoadMoreParametersX data) async {
    try {
      var result = await DatabaseX.getAllDeductions(
        perPage: data.perPage,
        page: data.page,
      );
      isHasErrorInDeductions.value = false;
      deductions += result;
      return result;
    } catch (e) {
      isHasErrorInDeductions.value = deductions.isNotEmpty;
      return Future.error(e);
    }
  }

  Future<List<DonationX>> getZakat(
      ScrollRefreshLoadMoreParametersX data) async {
    try {
      var result = await DatabaseX.getAllDonations(
        isHome: true,
        isZakat: true,
        perPage: data.perPage,
        page: data.page,
      );
      isHasErrorInZakat.value = false;
      zakat += result;
      return result;
    } catch (e) {
      isHasErrorInZakat.value = zakat.isNotEmpty;
      return Future.error(e);
    }
  }

  getProducts() async {
    try {
      // var result = await DatabaseX.getAllProducts(
      //   isHome: true,
      //   perPage: data.perPage,
      //   page: data.page,
      // );
      // isHasErrorInProducts.value = false;
      // products += result;
      // return result;

      /// TODO: Database >>> Fetch All products
      await Future.delayed(const Duration(seconds: 1)); // delete this

      products = TestDataX.products;
    } catch (e) {
      isHasErrorInProducts.value = products.isNotEmpty;
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Ads

  onAdsLink(AdsX ad) async {
    try {
      await launchUrl(
          Uri.parse(ad.externalUrl.isNotEmpty ? ad.externalUrl : ad.buttonUrl));
    } catch (_) {}
  }

  onAdsLinkButton(AdsX ad) async {
    try {
      await launchUrl(
          Uri.parse(ad.buttonUrl.isNotEmpty ? ad.buttonUrl : ad.externalUrl));
    } catch (_) {}
  }
  //----------------------------------------------------------------------------
  // Donation

  onPayDonation(donation) async => await payDonationSheet(donation);
  onDonationAddToCart(donation) async =>
      await payDonationSheet(donation, onlyAddToCart: true);
  onDonationsMore() => root.openDonations();

  //----------------------------------------------------------------------------
  // Product

  onTapProduct(String id) =>
      Get.toNamed(RouteNameX.productDetails, arguments: id);
  onProductAddToCart(ProductX product) async =>
      await productAddToCartSheetX(product);
  onShopMore() => Get.toNamed(RouteNameX.store);

  //----------------------------------------------------------------------------
  // Zakat

  onZakatMore() => Get.toNamed(RouteNameX.zakatDisbursements);

  //----------------------------------------------------------------------------
  // Deduction

  onTapDeduction(String id) =>
      Get.toNamed(RouteNameX.deductionDetails, arguments: id);
  onSubscriptionDeduction(deduction) async =>
      await subscriptionDeductionSheetX(deduction);
  onDeductionsMore() => Get.toNamed(RouteNameX.allDeductions);

  //----------------------------------------------------------------------------
  // Organization

  onTapOrganization(OrganizationX org) => Get.toNamed(
        RouteNameX.organizationDetails,
        arguments: org,
      );

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
