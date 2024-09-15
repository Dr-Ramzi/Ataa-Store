import 'package:ataa/Ui/Animation/animation.dart';
import 'package:ataa/Ui/Widget/Basic/Other/scrollRefreshLoadMore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class OurBankView extends GetView<OurBankController> {
  const OurBankView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: 'Our Bank Accounts',
        actions: [CartIconButtonsX()],
      ),
      body: SafeArea(
        child: ScrollRefreshLoadMoreX<BankX>(
          fetchData: controller.getData,
          initLoading: Column(
            children: [
              for (int i = 0; i < 3; i++)
                const ShimmerAnimationX(
                  height: 340,
                  margin: EdgeInsets.only(bottom: 14),
                )
            ],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
            vertical: StyleX.vPaddingApp,
          ),
          itemBuilder: (data, index) => BankCardX(bank: data).fadeAnimation200,
        ),
      ),
    );
  }
}