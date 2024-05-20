part of '../../widget.dart';

class MyDeductionCardX extends StatelessWidget {
  const MyDeductionCardX({
    super.key,
    required this.myDeduction,
    required this.onUnsubscribe,
    required this.buttonState,
  });
  final DeductionRecordX myDeduction;
  final ButtonStateEX buttonState;
  final Function() onUnsubscribe;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextX(
            myDeduction.name,
            style: TextStyleX.titleLarge,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    "The amount",
                    style: TextStyleX.supTitleMedium,
                  ),
                  const SizedBox(height: 6),
                  TextX(
                    "${FunctionX.formatLargeNumber(myDeduction.deductionAmount)} ${"SAR".tr} \\ ${myDeduction.deduction.tr}",
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    "Card",
                    style: TextStyleX.supTitleMedium,
                  ),
                  const SizedBox(height: 6),

                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextX(
                      "****${myDeduction.bankCardNumber.substring(myDeduction.bankCardNumber.length - 4)}",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          ButtonStateX.dangerous(
            state: buttonState,
            text: "Unsubscribe",
            onTap: onUnsubscribe,
          ),
        ],
      ),
    );
  }
}
