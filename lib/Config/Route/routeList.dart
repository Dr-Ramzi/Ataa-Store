import 'package:get/get.dart';
import '../../Core/Controller/Basket/deliveryAddressController.dart';
import '../../Core/Controller/Pay/directZakatPaymentController.dart';
import '../../Ui/Screen/Basic/About/Info/controller/Controller.dart';
import '../../Ui/Screen/Screen/Basket/controller/Controller.dart';
import '../../Ui/Screen/Screen/Basket/view/View.dart';
import '../../Ui/Screen/Screen/Campaigns/AllCampaigns/controller/Controller.dart';
import '../../Ui/Screen/Screen/Campaigns/AllCampaigns/view/View.dart';
import '../../Ui/Screen/Screen/Campaigns/CampaignDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Campaigns/CampaignDetails/view/View.dart';
import '../../Ui/Screen/Screen/Campaigns/CreateCampaign/controller/Controller.dart';
import '../../Ui/Screen/Screen/Campaigns/CreateCampaign/view/View.dart';
import '../../Ui/Screen/Screen/Dedications/controller/Controller.dart';
import '../../Ui/Screen/Screen/Dedications/view/View.dart';
import '../../Ui/Screen/Screen/Deduction/AllDeductions/controller/Controller.dart';
import '../../Ui/Screen/Screen/Deduction/AllDeductions/view/View.dart';
import '../../Ui/Screen/Screen/Deduction/DeductionDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Deduction/DeductionDetails/view/View.dart';
import '../../Ui/Screen/Screen/Guarantees/AllGuarantees/controller/Controller.dart';
import '../../Ui/Screen/Screen/Guarantees/AllGuarantees/view/View.dart';
import '../../Ui/Screen/Screen/Guarantees/TypesGuarantees/controller/Controller.dart';
import '../../Ui/Screen/Screen/Guarantees/TypesGuarantees/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/Activity/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/Activity/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyCampaigns/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyCampaigns/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyDedications/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyDedications/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyDeductions/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyDeductions/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyDonations/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyDonations/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyGuarantees/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyGuarantees/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyOrders/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/MyOrders/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/PaymentCards/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/PaymentCards/view/View.dart';
import '../../Ui/Screen/Screen/Profile/Activity/SharingLinks/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Activity/SharingLinks/view/View.dart';
import '../../Ui/Screen/Screen/Zakat/Zakat/controller/Controller.dart';
import '../../Ui/Screen/Screen/Zakat/Zakat/view/View.dart';
import '../../Ui/Screen/Screen/Zakat/ZakatCalculator/controller/Controller.dart';
import '../../Ui/Screen/Screen/Zakat/ZakatCalculator/view/View.dart';
import '../../Ui/Screen/Screen/Zakat/ZakatDisbursements/controller/Controller.dart';
import '../../Ui/Screen/Screen/Zakat/ZakatDisbursements/view/View.dart';
import '../config.dart';
import '../../Core/Controller/Basket/basketGeneralController.dart';
import '../../Ui/Screen/Screen/Donation/AllDonation/controller/Controller.dart';
import '../../Ui/Screen/Screen/Organization/AllOrganizations/controller/Controller.dart';
import '../../Ui/Screen/Screen/Organization/AllOrganizations/view/View.dart';
import '../../Ui/Screen/Screen/Organization/OrganizationDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Organization/OrganizationDetails/view/View.dart';
import '../../Ui/Screen/Screen/Store/ProductDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Store/ProductDetails/view/View.dart';
import '../../Ui/Screen/Screen/Store/Store/controller/Controller.dart';
import '../../Ui/Screen/Screen/Store/Store/view/View.dart';
import '../../Ui/Screen/Screen/Donation/DonationDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Donation/DonationDetails/view/View.dart';
import '../../Ui/Screen/Auth/CompleteAccountData/controller/Controller.dart';
import '../../Ui/Screen/Auth/CompleteAccountData/view/View.dart';
import '../../Ui/Screen/Auth/OTP/controller/Controller.dart';
import '../../Ui/Screen/Auth/OTP/view/View.dart';
import '../../Ui/Screen/Auth/SignUp/controller/Controller.dart';
import '../../Ui/Screen/Auth/SignUp/view/View.dart';
import '../../Ui/Screen/Basic/About/ContactUs/controller/Controller.dart';
import '../../Ui/Screen/Basic/About/ContactUs/view/View.dart';
import '../../Ui/Screen/Basic/About/Info/View/View.dart';
import '../../Ui/Screen/Basic/About/OurBank/controller/Controller.dart';
import '../../Ui/Screen/Basic/About/OurBank/view/View.dart';
import '../../Ui/Screen/Basic/About/PrivacyPolicy/controller/Controller.dart';
import '../../Ui/Screen/Basic/About/PrivacyPolicy/view/View.dart';
import '../../Ui/Screen/Basic/About/TermsConditions/controller/Controller.dart';
import '../../Ui/Screen/Basic/About/TermsConditions/view/View.dart';
import '../../Ui/Screen/Basic/Notification/controller/Controller.dart';
import '../../Ui/Screen/Basic/Notification/view/View.dart';
import '../../Ui/Screen/Basic/Root/View/View.dart';
import '../../Ui/Screen/Basic/Root/controller/Controller.dart';
import '../../Ui/Screen/Onboarding/controller/Controller.dart';
import '../../Ui/Screen/Onboarding/view/View.dart';
import '../../Ui/Screen/Screen/Home/controller/Controller.dart';
import '../../UI/Screen/Auth/Login/controller/Controller.dart';
import '../../UI/Screen/Auth/Login/view/loginView.dart';
import '../../Ui/Screen/Screen/MoreSections/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/EditProfile/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/EditProfile/view/View.dart';
import '../../Ui/Screen/Screen/Profile/ProfileDetails/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Statistics/controller/Controller.dart';
import '../../Ui/Screen/Screen/Profile/Statistics/view/View.dart';
import '../../../Ui/Screen/Basic/Settings/controller/Controller.dart';
import '../../../Ui/Screen/Basic/Settings/view/View.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Link pages to their controller via the page name
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


class RouteListX {
  /// List Routes
  static final List<GetPage<dynamic>> routes = [
    /// Root
    GetPage(
      name: RouteNameX.root,
      page: () => const RootView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(
            () => RootController(),
          );
          Get.lazyPut(
            () => HomeController(), fenix: true,
          );
          Get.lazyPut(
            () => AllDonationController(),
          );
          Get.lazyPut(
            () => MoreSectionsController(),
          );
          Get.lazyPut(
            () => ProfileDetailsController(),
          );
          Get.lazyPut(() => BasketGeneralControllerX(), fenix: true);
        },
      ),
    ),
    //========================================================
    ///Auth
    GetPage(
        name: RouteNameX.login,
        page: () => LoginView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => LoginController());
        })),
    GetPage(
        name: RouteNameX.signUp,
        page: () => SignUpView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignUpController());
        })),
    GetPage(
        name: RouteNameX.otp,
        page: () => OTPView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OTPController());
        })),
    GetPage(
        name: RouteNameX.completeAccountData,
        page: () => const CompleteAccountDataView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => CompleteAccountDataController());
        })),
    //========================================================
    /// Onboarding
    GetPage(
        name: RouteNameX.onboarding,
        page: () => const OnboardingView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                () => OnboardingController(),
            fenix: true,
          );
        })),
    //========================================================
    /// Profile
    GetPage(
        name: RouteNameX.editProfile,
        page: () => const EditProfileView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => EditProfileController());
        })),
    GetPage(
        name: RouteNameX.notifications,
        page: () => const NotificationsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => NotificationsController(),
          );
        })),
    GetPage(
        name: RouteNameX.statistics,
        page: () => const StatisticsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => StatisticsController());
        })),
    //========================================================
    /// Activity
    GetPage(
        name: RouteNameX.activity,
        page: () => const ActivityView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ActivityController());
        })),
    GetPage(
        name: RouteNameX.myDonations,
        page: () => const MyDonationsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MyDonationsController());
        })),
    GetPage(
        name: RouteNameX.myOrders,
        page: () => const MyOrdersView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MyOrdersController());
        })),
    GetPage(
        name: RouteNameX.myDedications,
        page: () => const MyDedicationsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MyDedicationsController());
        })),
    GetPage(
        name: RouteNameX.myCampaigns,
        page: () => const MyCampaignsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MyCampaignsController());
        })),
    GetPage(
        name: RouteNameX.myDeductions,
        page: () => const MyDeductionsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MyDeductionsController());
        })),
    GetPage(
        name: RouteNameX.myGuarantees,
        page: () => const MyGuaranteesView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => MyGuaranteesController());
        })),
    GetPage(
        name: RouteNameX.sharingLinks,
        page: () => const SharingLinksView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SharingLinksController());
        })),
    GetPage(
        name: RouteNameX.paymentCards,
        page: () => const PaymentCardsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => PaymentCardsController());
        })),
    //========================================================
    /// Info
    GetPage(
        name: RouteNameX.settings,
        page: () => const SettingsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => SettingsController(),
            fenix: true,
          );
        })),
    GetPage(
        name: RouteNameX.contactUs,
        page: () => const ContactUsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => ContactUsController(),
          );
        })),
    GetPage(
        name: RouteNameX.info,
        page: () => const InfoView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => InfoController(),
          );
        })),
    GetPage(
        name: RouteNameX.ourBank,
        page: () => const OurBankView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OurBankController());
        })),
    GetPage(
        name: RouteNameX.privacyPolicy,
        page: () => const PrivacyPolicyView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => PrivacyPolicyController(),
          );
        })),
    GetPage(
        name: RouteNameX.termsConditions,
        page: () => const TermsConditionsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
            () => TermsConditionsController(),
          );
        })),
    //========================================================
    /// Store
    GetPage(
        name: RouteNameX.store,
        page: () => const StoreView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => StoreController());
        })),
    GetPage(
        name: RouteNameX.productDetails,
        page: () => const ProductDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ProductDetailsController());
        })),
    //========================================================
    /// Organization
    GetPage(
        name: RouteNameX.allOrganizations,
        page: () => const AllOrganizationsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => AllOrganizationsController());
        })),
    GetPage(
        name: RouteNameX.organizationDetails,
        page: () => const OrganizationDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OrganizationDetailsController());
        })),
    //========================================================
    /// Deduction
    GetPage(
        name: RouteNameX.allDeductions,
        page: () => const AllDeductionsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => AllDeductionsController());
        })),
    GetPage(
        name: RouteNameX.deductionDetails,
        page: () => const DeductionDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DeductionDetailsController());
        })),
    //========================================================
    /// Dedications
    GetPage(
        name: RouteNameX.dedications,
        page: () => const DedicationsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DedicationsController());
        })),
    //========================================================
    /// Basket
    GetPage(
      name: RouteNameX.basket,
      page: () => const BasketView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => BasketController());
          Get.lazyPut(() => DeliveryAddressControllerX());
        },
      ),
    ),
    //========================================================
    /// Guarantees
    GetPage(
        name: RouteNameX.typesGuarantees,
        page: () => const TypesGuaranteesView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => TypesGuaranteesController());
        })),
    GetPage(
        name: RouteNameX.allGuarantees,
        page: () => const AllGuaranteesView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => AllGuaranteesController());
        })),
    //========================================================
    /// Zakat
    GetPage(
        name: RouteNameX.zakat,
        page: () => const ZakatView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ZakatController());
          Get.lazyPut(() => DirectZakatPaymentControllerX());
        })),
    GetPage(
        name: RouteNameX.zakatDisbursements,
        page: () => const ZakatDisbursementsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ZakatDisbursementsController());
        })),
    GetPage(
        name: RouteNameX.zakatCalculator,
        page: () => const ZakatCalculatorView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ZakatCalculatorController());
        })),
    //========================================================
    /// Donation
    GetPage(
        name: RouteNameX.donationDetails,
        page: () => const DonationDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DonationDetailsController());
        })),
    //========================================================
    /// Campaign
    GetPage(
        name: RouteNameX.allCampaigns,
        page: () => const AllCampaignsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => AllCampaignsController());
        })),
    GetPage(
        name: RouteNameX.createCampaign,
        page: () => const CreateCampaignView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => CreateCampaignController());
        })),
    GetPage(
        name: RouteNameX.campaignDetails,
        page: () => const CampaignDetailsView(),
        binding: BindingsBuilder(() {
          Get.lazyPut(
                  () => CampaignDetailsController());
        })),
    //========================================================
     /// Template
     // GetPage(
     //    name: RouteNameX.,
     //    page: () => const View(),
     //    binding: BindingsBuilder(() {
     //      Get.lazyPut(
     //              () => Controller());
     //    })),
     //
  ];
}
