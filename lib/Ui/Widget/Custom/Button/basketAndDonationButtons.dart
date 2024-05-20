part of "../../widget.dart";

class AddToCartAndDonationButtonsX extends StatelessWidget {
  const AddToCartAndDonationButtonsX(
      {super.key,
      required this.onDonation,
      this.onAddToCart,
      this.isSubscribe = false,
      this.sameSize = true,
      required this.payDonationButtonState, this.addToCartButtonState=ButtonStateEX.normal,
      });
  final bool isSubscribe;
  final bool sameSize;
  final ButtonStateEX payDonationButtonState;
  final ButtonStateEX addToCartButtonState;
  final Function()? onDonation;
  final Function()? onAddToCart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (onDonation != null)
        Flexible(
          flex: sameSize?2:7,
          child: ButtonStateX(
            state: payDonationButtonState,
            onTap: onDonation!,
            text: isSubscribe ? "Subscribe Now" : "Donate Now",
            iconData: Icons.payments_rounded,
          ),
        ),
        if (onAddToCart != null && onDonation !=null)
          const SizedBox(
            width: 8,
          ),
        if (onAddToCart != null)
          Flexible(
            flex: 2,
            child: ButtonStateX.second(
              state: addToCartButtonState,
              onTap: onAddToCart!,
              iconData: Icons.shopping_cart_rounded,
              text: sameSize?"Add to cart":null,
            ),
          ),
      ],
    );
  }
}
