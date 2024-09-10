import 'package:get/get.dart';

import '../../../../Data/data.dart';

class TestimonialsController extends GetxController {
  Future<List<TestimonialX>> getData(ScrollRefreshLoadMoreParametersX data) async {
    try {
      List<TestimonialX> results = await DatabaseX.getTestimonials(
        page: data.page,
        perPage: data.perPage,
      );
      return results;
    } catch (e) {
      return Future.error(e);
    }
  }
}