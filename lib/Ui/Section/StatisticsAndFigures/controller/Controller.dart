import 'package:get/get.dart';

import '../../../../Data/data.dart';

class StatisticsAndFiguresController extends GetxController {
  Future<List<GeneralStatisticX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    try {
      List<GeneralStatisticX> results = await DatabaseX.getGeneralStatistics(
        page: data.page,
        perPage: data.perPage,
      );
      return results;
    } catch (e) {
      return Future.error(e);
    }
  }
}