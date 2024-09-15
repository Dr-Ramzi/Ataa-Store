library data;

import 'dart:async';
import 'package:ataa/Core/Extension/convert/convert.dart';
import 'package:ataa/Core/core.dart';
import 'package:ataa/Data/Model/Basic/data_source_param.dart';
import 'package:ataa/Data/Model/Gifting/giftCategory.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../Config/Translation/translation.dart';
import '../Config/config.dart';

import '../Core/Error/error.dart';
import '../Core/Helper/model/model.dart';
import 'Model/Cart/cart.dart';
import 'Model/Gifting/giftMessage.dart';
import 'Model/Statistics/campaignStatistics.dart';
import 'Model/Statistics/deductionStatistics.dart';
import 'Model/Statistics/donationStatistics.dart';
import 'Model/Statistics/giftStatistics.dart';
import 'Model/Statistics/orderStatistics.dart';
import 'Model/Statistics/shareLinkStatistics.dart';
import 'Model/Statistics/sponsorshipStatistics.dart';
import 'Remote/remote_data.dart';

part 'Constant/constant.dart';
part 'Enum/enum.dart';
part 'Constant/name.dart';
part 'Database/database.dart';
part 'Local/Config/defaultData.dart';
part 'Local/Config/localKey.dart';
part 'Local/localData.dart';
part 'Local/Storage/hive.dart';
part 'Model/User/user.dart';
part 'Model/Auth/otp.dart';
part 'Model/Basic/notification.dart';
part 'Model/Basic/settings.dart';
part 'API/config.dart';
part "Model/Cart/deliveryLocation.dart";
part 'Model/Cart/donationRecord.dart';
part 'Model/Cart/orderProduct.dart';
part 'Model/Cart/deductionRecord.dart';
part 'Model/Cart/order.dart';
part 'Model/Basic/rootPage.dart';
part "Database/Config/DBEndPoint.dart";
part 'Model/Bank/bankAccount.dart';
part 'Model/Bank/bank.dart';
part 'Model/Other/ads.dart';
part 'Model/Deduction/deduction.dart';
part 'Model/Donation/donation.dart';
part 'Model/Donation/donationOpenPackage.dart';
part 'Model/Donation/donationCategory.dart';
part 'Model/Donation/donationType.dart';
part 'Model/Donation/donationShares.dart';
part 'Model/Donation/donationSharesPackage.dart';
part 'Model/Donation/donationDeductionPackage.dart';
part 'Model/Other/organization.dart';
part 'Model/Other/product.dart';
part 'Model/Other/partner.dart';
part 'Model/Other/contactUs.dart';
part 'Model/gifting/gifting.dart';
part 'API/keys.dart';
part 'Model/Other/sponsorship.dart';
part 'Model/Bank/paymentCard.dart';
part 'Model/Other/shareLink.dart';
part 'Model/Other/campaign.dart';
part 'Model/Other/generalSettings.dart';
part "TestData.dart";
part 'Model/Basic/scrollRefreshLoadMoreParameters.dart';
part 'Model/Other/page.dart';
part 'Model/Other/generalStatistic.dart';
part 'Model/Other/testimonial.dart';
part 'Model/Other/country.dart';


// ~~~~~~~~~~~~~~~~~~~~~~~{{ Why this section }}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/// Control all types of data within the application, including static data,
/// managing data stored on the device, database connections, data models, etc.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class DataX {
  static init() async {
    /// Formatting and retrieving data stored on the device
    await LocalDataX.init();

    /// Configure database connections
    await DatabaseX.init();
  }
}
