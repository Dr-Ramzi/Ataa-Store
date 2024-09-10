import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../UI/Widget/widget.dart';
import '../../../../Widget/Basic/Utils/future_builder.dart';
import '../controller/Controller.dart';

class LoadingView extends GetView<LoadingController> {
  const LoadingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilderX(
        future: controller.init,
        onSuccess: controller.finish,
        loading: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoX(),
            SizedBox(height: 70, width: double.maxFinite),
            CircularProgressIndicator(),
          ],
        ),
        child: (_)=> const SizedBox(),
      ),
    );
  }
}