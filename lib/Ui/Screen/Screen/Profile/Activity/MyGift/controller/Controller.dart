import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';
import '../../../../../../../Data/Enum/model_type_status.dart';
import '../../../../../../../Data/Model/Gift/Order/giftOrder.dart';
import '../../../../../../../Data/Model/PaymentTransaction/paymentTransactionItem.dart';

class MyGiftingController extends GetxController {
  //============================================================================
  // Variables

  bool isShowMore = false;

  //============================================================================
  // Functions

  Future<List<PaymentTransactionItemX<GiftOrderX>>> getData(ScrollRefreshLoadMoreParametersX data) async {
    return await DatabaseX.getAllMyRecords<GiftOrderX>(
      type: ModelTypeStatusX.gift,
      orderModelFromJson: GiftOrderX.fromJson,
      page: data.page,
      perPage: data.perPage,
    );
  }

  onShowMore(){
    isShowMore=true;
    update();
  }
}