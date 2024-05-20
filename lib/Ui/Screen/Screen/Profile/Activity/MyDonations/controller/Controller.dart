import 'package:get/get.dart';
import '../../../../../../../Data/data.dart';

class MyDonationsController extends GetxController {
  //============================================================================
  // Variables

  List<DonationX> donations =[];
  List<DonationRecordX> myDonations =[];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >>> Fetch All Donations
      await Future.delayed(const Duration(seconds: 1)); // delete this

      myDonations=TestDataX.donationsRecords;

      /// TODO: Database >>> Fetch All My Donations
      for(int i=0; i<myDonations.length;i++) {
        donations.add(TestDataX.donations.firstWhere((x) => x.id==myDonations[i].donationID));
      }

    } catch (e) {
      return Future.error(e);
    }
  }
}