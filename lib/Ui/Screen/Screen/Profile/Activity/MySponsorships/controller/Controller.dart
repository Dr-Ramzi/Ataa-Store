import 'package:get/get.dart';
import '../../../../../../../Data/data.dart';

class MySponsorshipsController extends GetxController {
  //============================================================================
  // Variables

  List<SponsorshipX> sponsorships =[];

  //============================================================================
  // Functions

  getData() async {
    try {
      /// TODO: Database >> Fetch All my Sponsorships
      await Future.delayed(const Duration(seconds: 1)); // delete this

      sponsorships=TestDataX.sponsorships;
    } catch (e) {
      return Future.error(e);
    }
  }
}