part of '../../widget.dart';

class CreditCardCardX extends StatelessWidget {
  const CreditCardCardX(
      {super.key,
      required this.bankCard,
      required this.onSetDefault,
      required this.onDelete, required this.isLoadingSetDefault, required this.isLoadingDelete});
  final PaymentCardX bankCard;
  final bool isLoadingSetDefault;
  final bool isLoadingDelete;
  final Function() onSetDefault;
  final Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return ContainerX(
      margin: const EdgeInsets.only(bottom: 10),
      height: 80,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CreditCardCompanyX(
                    cardType: CreditCardUtilsX.getCardTypeFrmNumber(bankCard.cardNum),
                    margin: const EdgeInsets.all(5),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: isLoadingSetDefault?CrossAxisAlignment.center:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextX(
                      FunctionX.addSpaceBeforeUpperCase(CreditCardUtilsX.getCardTypeFrmNumber(bankCard.cardNum).name),
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 4),
                    if (bankCard.isDefault)
                      TextX(
                        "Default",
                        style: TextStyleX.supTitleLarge,
                      ),
                    if (!bankCard.isDefault && !isLoadingSetDefault)
                      InkWell(
                        onTap: onSetDefault,
                        child: TextX(
                          "Select as default card",
                          style: TextStyleX.supTitleLarge,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    if(isLoadingSetDefault)
                      const SizedBox(
                        height: 17,
                        width: 17,
                        child: CircularProgressIndicator(strokeWidth: 2.5,),
                      ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: isLoadingDelete?CrossAxisAlignment.center:CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextX(
                    "****${bankCard.cardNum.substring(bankCard.cardNum.length - 4)}",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                if(!isLoadingDelete)
                InkWell(
                  onTap: onDelete,
                  child: TextX(
                    "delete",
                    style: TextStyleX.supTitleLarge,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                if(isLoadingDelete)
                  const SizedBox(
                    height: 17,
                    width: 17,
                    child: CircularProgressIndicator(strokeWidth: 2.5,),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
