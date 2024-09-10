import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class OurBankController extends GetxController {
  //============================================================================
  // Functions

  Future<List<BankX>> getData(
    ScrollRefreshLoadMoreParametersX data,
  ) async {
    return await DatabaseX.getAllBanks(
      perPage: data.perPage,
      page: data.page,
    );
  }
}
