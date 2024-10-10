import '../../../data.dart';
import '../Subclass/donationFamilyAndFriends.dart';

class DonationOrderFormX {
  final String donationId;
  final double price;
  final int sharesQuantity;
  final String? donationOpenPackageId;
  final String? donationSharesPackageId;
  final String? donationDeductionPackageId;
  final bool donationOnBehalfOfFamilyAndFriends;
  final DonationFamilyAndFriendsX? familyAndFriends;

  DonationOrderFormX({
    required this.donationId,
    required this.price,
    this.sharesQuantity = 1,
    this.donationOpenPackageId,
    this.donationSharesPackageId,
    this.donationDeductionPackageId,
    required this.donationOnBehalfOfFamilyAndFriends,
    this.familyAndFriends,
  });

  Map<String, dynamic> toJson() {
    return {
      NameX.projectId: donationId,
      NameX.donationData: {
      NameX.price: price,
      NameX.sharesQuantity: sharesQuantity,
      if(donationOpenPackageId!=null)
      NameX.donationOpenPackageId: donationOpenPackageId,
      if(donationSharesPackageId!=null)
      NameX.donationSharesPackageId: donationSharesPackageId,
      if(donationDeductionPackageId!=null)
      NameX.donationDeductionPackageId: donationDeductionPackageId,
      NameX.donationOnBehalfOfFamilyAndFriends: donationOnBehalfOfFamilyAndFriends,
      if(donationOnBehalfOfFamilyAndFriends)
      NameX.familyAndFriends: familyAndFriends?.toJson(),
      },
    };
  }
}
