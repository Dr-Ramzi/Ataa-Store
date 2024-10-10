import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VerificationUrlController extends GetxController {
  String verificationUrl = Get.arguments;
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
    ..loadRequest(Uri.parse(Get.arguments));

  NavigationDecision checkVerification(NavigationRequest request) {
    final Uri currentUri = Uri.parse(request.url);
    final Uri verificationUri = Uri.parse(verificationUrl);

    // Check if the domain is the same as the original verification domain
    if (currentUri.host != verificationUri.host) {
      Get.back(result: true);
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }
}