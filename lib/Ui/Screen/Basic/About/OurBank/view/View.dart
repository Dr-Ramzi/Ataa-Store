import 'package:ataa/Ui/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../GeneralState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class OurBankView extends GetView<OurBankController> {
  const OurBankView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarX(title: 'Our Bank Accounts'),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            /// Loading State
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: StyleX.hPaddingApp,
                  vertical: StyleX.vPaddingApp,
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < 3; i++)
                      const ShimmerAnimationX(
                        height: 230,
                        margin: EdgeInsets.only(bottom: 14),
                      )
                  ],
                ),
              );
            }
        
            /// Error State
            if (snapshot.hasError) {
              return ErrorView(
                error: snapshot.error.toString(),
              );
            }
        
            /// Main Content
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: StyleX.hPaddingApp,
                vertical: StyleX.vPaddingApp,
              ),
              child: Column(
                children: [
                  ...controller.bankAccounts.map((bank) {
                    return BankAccountCardX(bankAccount: bank).fadeAnimation200;
                  })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
