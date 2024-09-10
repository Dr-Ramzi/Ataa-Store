part of '../../widget.dart';

class CreditCardNumberFieldX extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool disabled;
  final bool? onlyRead;
  final bool autofocus;
  final EdgeInsets margin;
  final Color? color;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  const CreditCardNumberFieldX({
    super.key,
    required this.controller,
    this.label,
    this.hint="Card number",
    this.autofocus = false,
    this.textInputAction,
    this.disabled = false,
    this.onlyRead,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.color,
    this.onChanged,
  });

  @override
  State<CreditCardNumberFieldX> createState() => _CreditCardNumberFieldXState();
}

class _CreditCardNumberFieldXState extends State<CreditCardNumberFieldX> {
  CreditCardTypeEX type = CreditCardTypeEX.others;
  @override
  void initState() {
    super.initState();
    type = CreditCardTypeEX.others;
    widget.controller.addListener(_getCardTypeFrmNumber);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) LabelInputX(widget.label!),
        Directionality(
          textDirection: TextDirection.ltr,
          child: ContainerX(
            margin: widget.margin,
            padding:  const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
            isBorder: true,
            color: widget.disabled
                ? Theme.of(context).disabledColor
                : widget.color??Theme.of(context).cardTheme.color,
            child: TextFormField(
              style: TextStyleX.titleSmall,
              autofocus: widget.autofocus,
              onChanged: widget.onChanged,
              validator: CreditCardUtilsX.validateCardNum,
              readOnly: widget.onlyRead??widget.disabled,
              keyboardType: TextInputType.number,
              textInputAction: widget.textInputAction,
              textAlignVertical: TextAlignVertical.center,
              controller: widget.controller,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(19),
                CardNumberInputFormatter(),
              ],
              decoration: InputDecoration(
                prefixIcon: null,
                suffixIcon: CreditCardCompanyX(cardType: type,width: 30,),
                suffixIconConstraints: const BoxConstraints(
                    maxWidth: StyleX.inputHeight
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
                isCollapsed: true,
                hintText: (widget.hint ?? "").tr,
                hintStyle: TextStyleX.titleSmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    widget.controller.removeListener(_getCardTypeFrmNumber);
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CreditCardUtilsX.getCleanedNumber(widget.controller.text);
    setState(() {
      type = CreditCardUtilsX.getCardTypeFrmNumber(input);
    });
  }

}