library data;

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../Config/Translation/translation.dart';
import '../Config/config.dart';
import 'package:http/http.dart' as http;

part 'Constant/constant.dart';
part 'Constant/enum.dart';
part 'Constant/name.dart';
part 'Database/database.dart';
part 'Local/Config/defaultData.dart';
part 'Local/Config/localKey.dart';
part 'Local/localData.dart';
part 'Local/Storage/hive.dart';
part 'Local/Storage/cookies.dart';
part 'Model/User/user.dart';
part 'Model/Auth/otp.dart';
part 'Model/Basic/notification.dart';
part 'Model/Basic/settings.dart';
part 'API/API.dart';
part 'Model/Basic/rootPage.dart';
part "Database/Config/DBEndPoint.dart";
part 'Model/Bank/bankAccount.dart';
part 'Model/Other/ads.dart';
part 'Model/CharitableProject/deduction.dart';
part 'Model/CharitableProject/donation.dart';
part 'Model/Other/organization.dart';
part 'Model/Other/product.dart';
part "Model/CharitableProject/charitableProject.dart";
part "Model/Basket/deliveryAddress.dart";
part 'Model/Basket/donationRecord.dart';
part 'Model/Basket/orderProduct.dart';
part 'Model/Basket/deductionRecord.dart';
part 'Model/Other/contactUs.dart';
part 'Model/Dedication/dedication.dart';
part 'Model/Dedication/dedicationType.dart';
part 'Model/Dedication/dedicationCard.dart';
part 'API/ApiKeys.dart';
part 'Model/User/statistics.dart';
part 'Model/Other/guarantee.dart';
part 'Model/Bank/bankCard.dart';
part 'Model/Basket/order.dart';
part 'Model/Other/shareLink.dart';
part 'Model/Other/campaign.dart';
part "TestData.dart";

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
