import 'package:ataa/Data/Enum/payment_status_status.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VerificationUrlController extends GetxController {
  String verificationUrl = Get.arguments[0];
  String callbackUrl = Get.arguments[1];
  late WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return checkVerification(request);
        },
      ),
    )
    ..loadRequest(Uri.parse(Get.arguments[0]));

  NavigationDecision checkVerification(NavigationRequest request) {
    // final Uri currentUri = Uri.parse(request.url);
    // final Uri verificationUri = Uri.parse(verificationUrl);

    // Check if the domain is the same as the original verification domain
    print(request.url);
    print(callbackUrl);
    if (request.url.contains(callbackUrl)) {
      Uri uri = Uri.parse(request.url);
      String? result = uri.queryParameters['status'];
      Get.back(result: result);
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }
}