import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Data/data.dart';
import '../../../Basic/Root/controller/Controller.dart';

class MoreSectionsController extends GetxController {
  //============================================================================
  // Injection of required controls

  RootController root = Get.find();


  //============================================================================
  // Functions

  Future<List<PageX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    try {
      List<PageX> results = await DatabaseX.getDynamicPages(
        page: data.page,
        perPage: data.perPage,
      );
      return results;
    } catch (e) {
      return Future.error(e);
    }
  }

  onDynamicPage(PageX page) => Get.toNamed(RouteNameX.dynamicPage,arguments: page);

  onAssociationPrograms() => Get.toNamed(RouteNameX.allOrganizations);

  onSponsorships() => Get.toNamed(RouteNameX.typesSponsorships);

  onGifting() => Get.toNamed(RouteNameX.gift);

  onDeductions() => Get.toNamed(RouteNameX.allDeductions);

  onZakat() => Get.toNamed(RouteNameX.zakat);

  onUserCampaigns() => Get.toNamed(RouteNameX.allCampaigns);

  onStore() => Get.toNamed(RouteNameX.store);

}