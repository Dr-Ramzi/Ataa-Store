part of '../../widget.dart';

class MyDeductionCardX extends StatelessWidget {
  const MyDeductionCardX({
    super.key,
    required this.myDeduction,
    required this.onUnsubscribe,
    required this.onTransactionHistory,
    required this.buttonState,
  });
  final PaymentTransactionItemX<DeductionOrderX> myDeduction;
  final ButtonStateEX buttonState;
  final Function() onUnsubscribe;
  final Function() onTransactionHistory;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextX(
                  myDeduction.name,
                  style: TextStyleX.titleLarge,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 16),
              ContainerX(
                radius: StyleX.radiusSm,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                color: myDeduction.orderModel.deduction.status
                    ? myDeduction.orderModel.deduction.isSubscribed
                        ? (context.isDarkMode?ColorX.green.shade200:ColorX.green.shade100)
                        : (context.isDarkMode?ColorX.red.shade200:ColorX.red.shade100)
                    : Theme.of(context).dividerColor,
                child: TextX(
                  myDeduction.orderModel.deduction.status
                      ? myDeduction.orderModel.deduction.isSubscribed
                          ? 'Active'
                          : 'Disabled'
                      : 'Expired',
                  color: myDeduction.orderModel.deduction.status
                      ? myDeduction.orderModel.deduction.isSubscribed
                          ? ColorX.green.shade800
                          : ColorX.red.shade800
                      : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          TextX(
            "${FunctionX.formatLargeNumber(myDeduction.price)} ${"SAR".tr} / ${myDeduction.orderModel.deduction.recurringLocalized ?? myDeduction.orderModel.deduction.recurring.name.tr}",
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          TextX(
            '${'Next discount in'.tr} ${intl.DateFormat('yyyy/MM/dd').format(myDeduction.orderModel.nextSubscriptionDiscountDate)}',
            style: TextStyleX.supTitleLarge,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ImageNetworkX(
                imageUrl: myDeduction
                        .paymentTransaction.paymentTransactionCard?.iconUrl ??
                    '',
                height: 26,
                width: 26,
              ),
              TextX(
                myDeduction.paymentTransaction.paymentTransactionCard
                        ?.paymentCardCompany ??
                    '',
              ).marginSymmetric(horizontal: 8),
              Directionality(
                textDirection: TextDirection.ltr,
                child: TextX(
                  "****${myDeduction.paymentTransaction.paymentTransactionCard?.lastFourDigits}",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Flexible(
                child: ButtonX(
                  text: "Transaction history",
                  colorText: Theme.of(context).textTheme.titleLarge?.color,
                  colorButton: Theme.of(context).dividerColor,
                  onTap: onTransactionHistory,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: AbsorbPointer(
                  absorbing: !(myDeduction.orderModel.deduction.status && myDeduction.orderModel.deduction.isSubscribed),
                  child: Opacity(
                    opacity: myDeduction.orderModel.deduction.status && myDeduction.orderModel.deduction.isSubscribed?1: context.isDarkMode?0.55:0.4,
                    child: myDeduction.orderModel.deduction.status?ButtonStateX.dangerous(
                      state: buttonState,
                      text: "Unsubscribe",
                      onTap: onUnsubscribe,
                    ):ButtonX.gray(
                      text: 'Subscription expired',
                      onTap: (){},
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
