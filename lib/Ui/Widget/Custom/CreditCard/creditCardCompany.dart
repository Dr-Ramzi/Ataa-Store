part of '../../widget.dart';

class CreditCardCompanyX extends StatelessWidget {
  const CreditCardCompanyX({super.key, required this.cardType,this.height,this.width, this.margin});
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final CreditCardTypeEX cardType;
  @override
  Widget build(BuildContext context) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CreditCardTypeEX.Master:
        img = ImageX.masterCreditCard;
        break;
      case CreditCardTypeEX.Visa:
        img = ImageX.visaCreditCard;
        break;
      case CreditCardTypeEX.Verve:
        img = ImageX.verveCreditCard;
        break;
      case CreditCardTypeEX.AmericanExpress:
        img = ImageX.americanExpressCreditCard;
        break;
      case CreditCardTypeEX.Discover:
        img = ImageX.discoverCreditCard;
        break;
      case CreditCardTypeEX.DinersClub:
        img = ImageX.dinersClubCreditCard;
        break;
      case CreditCardTypeEX.Jcb:
        img = ImageX.jcbCreditCard;
        break;
      case CreditCardTypeEX.Mada:
        img = ImageX.madaCreditCard;
        break;
      case CreditCardTypeEX.Others:
        icon =  Icon(
          Icons.credit_card,
          size: width??40.0,
          color: ColorX.grey,
        );
        break;
      default:
        icon =  Icon(
          Icons.warning,
          size: width??40.0,
          color: ColorX.grey,
        );
        break;
    }
    late Widget widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        img,
        width: width??40,
      );
    } else {
      widget = icon!;
    }

    return Padding(
      padding: margin??EdgeInsets.zero,
      child: widget,
    );
  }
}
