part of '../../widget.dart';

class ButtonX extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final Widget? icon;
  final double marginHorizontal;
  final double marginVertical;
  final double? width;
  final Function onTap;
  final bool halfWidth;
  final bool disabled;
  final double? height;
  Color? borderColor;
  Color? colorButton;
  Color? colorText;
  ButtonX({
    required this.onTap,
    this.text,
    colorButton,
    this.disabled = false,
    this.iconData,
    this.icon,
    this.width,
    this.marginVertical = 4,
    this.halfWidth = false,
    this.borderColor = Colors.transparent,
    this.marginHorizontal = 0,
    this.colorText = Colors.white,
    super.key, this.height,
  }) {
    this.colorButton = colorButton ?? ColorX.primary;
  }
  ButtonX.second({
    required this.onTap,
    this.text,
    this.colorButton,
    this.disabled = false,
    this.iconData,
    this.icon,
    this.width,
    this.marginVertical = 5,
    this.halfWidth = false,
    this.marginHorizontal = 0,
    super.key, this.height,
  }) {
    colorText = ColorX.primary;
    borderColor = ColorX.primary;
  }
  ButtonX.gray({
    required this.onTap,
    this.text,
    this.disabled = false,
    this.iconData,
    this.icon,
    this.width,
    Color? colorText,
    this.marginVertical = 5,
    this.halfWidth = false,
    this.marginHorizontal = 0,
    super.key, this.height,
  }) {
    this.colorText =  colorText??Get.theme.colorScheme.secondary;
    borderColor = ColorX.grey.shade300;
  }

  ButtonX.dangerous(
      {required this.onTap,
      this.disabled = false,
      this.text,
      this.iconData,
        this.icon,
      this.width,
      this.halfWidth = false,
      this.marginVertical = 5,
      this.marginHorizontal = 0,
      super.key, this.height,
      }) {
    colorText = ColorX.danger;
    borderColor = ColorX.danger;
  }
  @override
  Widget build(BuildContext context) {
    if(borderColor==ColorX.primary && colorText==ColorX.primary){
      colorText=Theme.of(context).primaryColor;
      borderColor=Theme.of(context).primaryColor;
    }
    return GestureDetector(
      onTap: () {
        if (!disabled) {
          onTap();
        }
      },
      child: Container(
        height: height??StyleX.buttonHeight,
        width: width ?? double.maxFinite,
        margin: EdgeInsets.symmetric(
          vertical: marginVertical,
          horizontal: marginHorizontal,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(StyleX.radius),
          color: disabled ? ColorX.grey : colorButton,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon!=null)
              icon!,
            if(iconData != null && icon==null)
           Icon(iconData, color: colorText,size: text != null?20:24,),
            if((iconData != null || icon!=null) && text != null)
              const SizedBox(width: 8),
            if(text != null)
            TextX(text!, color: colorText),
          ],
        ),
      ),
    );
  }
}
