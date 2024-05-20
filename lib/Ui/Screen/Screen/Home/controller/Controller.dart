import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Data/data.dart';
import '../../../../ScreenSheet/Other/ProductAddToCart/productAddToCart.dart';
import '../../../../ScreenSheet/Pay/PayDonation/payDonationSheet.dart';
import '../../../../ScreenSheet/Pay/SubscriptionDeduction/subscriptionDeductionSheet.dart';
import '../../../Basic/Root/controller/Controller.dart';

class HomeController extends GetxController {
  //============================================================================
  // Injection of required controls

  RootController root =Get.find();

  //============================================================================
  // Variables

  List<AdsX> ads = [];
  List<DonationX> donations = [];
  List<OrganizationX> organizations = [];
  List<DeductionX> deductions = [];
  List<DonationX> zakat = [];
  List<ProductX> products = [];

  //============================================================================
  // Functions

  //----------------------------------------------------------------------------
  // Get Data form Database

  getAds() async {
    try {
      /// TODO: Database >>> Fetch All ads
      await Future.delayed(const Duration(seconds: 1)); // delete this

      ads = TestDataX.ads;
    } catch (e) {
      return Future.error(e);
    }
  }
  getDonations() async {
    try {
      /// TODO: Database >>> Fetch All donations
      await Future.delayed(const Duration(seconds: 1)); // delete this

      donations = TestDataX.donations.where((x) => x.isZakat!=true).toList();
    } catch (e) {
      return Future.error(e);
    }
  }
  getOrganizations() async {
    try {
      /// TODO: Database >>> Fetch All organizations
      await Future.delayed(const Duration(seconds: 1)); // delete this

      organizations = TestDataX.organizations;
    } catch (e) {
      return Future.error(e);
    }
  }
  getDeductions() async {
    try {
      /// TODO: Database >>> Fetch All deductions
      await Future.delayed(const Duration(seconds: 1)); // delete this

      deductions = TestDataX.deductions;
    } catch (e) {
      return Future.error(e);
    }
  }
  getZakat() async {
    try {
      /// TODO: Database >>> Fetch All zakat
      await Future.delayed(const Duration(seconds: 1)); // delete this

      zakat = TestDataX.donations.where((x) => x.isZakat==true).toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  getProducts() async {
    try {
      /// TODO: Database >>> Fetch All products
      await Future.delayed(const Duration(seconds: 1)); // delete this

      products = TestDataX.products;
    } catch (e) {
      return Future.error(e);
    }
  }

  //----------------------------------------------------------------------------
  // Ads

  /// TODO: Algorithm >>> Add code for open ads link from database
  onAdsLink(int index) => root.openDonations(); //Get.toNamed(ads[index].goToLink);

  //----------------------------------------------------------------------------
  // Donation

  onTapDonation (String id) => Get.toNamed(RouteNameX.donationDetails,arguments: id);
  onPayDonation (donation) async => await payDonationSheet(donation);
  onDonationAddToCart (donation) async => await payDonationSheet(donation,onlyAddToCart:true);
  onDonationsMore() => root.openDonations();

  //----------------------------------------------------------------------------
  // Product

  onTapProduct (String id) => Get.toNamed(RouteNameX.productDetails,arguments: id);
  onProductAddToCart (ProductX product) async =>  await productAddToCartSheetX(product);
  onShopMore() => Get.toNamed(RouteNameX.store);

  //----------------------------------------------------------------------------
  // Zakat

  onZakatMore() => Get.toNamed(RouteNameX.zakatDisbursements);

  //----------------------------------------------------------------------------
  // Deduction

  onTapDeduction (String id) => Get.toNamed(RouteNameX.deductionDetails,arguments: id);
  onSubscriptionDeduction (deduction) async => await subscriptionDeductionSheetX(deduction);
  onDeductionsMore() => Get.toNamed(RouteNameX.allDeductions);

  //----------------------------------------------------------------------------
  // Organization

  onTapOrganization (OrganizationX org) => Get.toNamed(RouteNameX.organizationDetails,arguments: org);

}
