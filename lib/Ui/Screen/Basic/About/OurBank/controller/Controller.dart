import 'package:ataa/Data/data.dart';
import 'package:get/get.dart';

class OurBankController extends GetxController {
  //============================================================================
  // Variables

  List<BankAccountX> bankAccounts=[];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Get bank account data
      await Future.delayed(const Duration(seconds: 1)); // delete this
      bankAccounts = TestDataX.banks;
    } catch (e) {
      return Future.error(e);
    }
  }
}
