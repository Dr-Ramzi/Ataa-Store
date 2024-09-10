part of '../../widget.dart';

// ignore: must_be_immutable
class TextFieldX extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool disabled;
  final bool? onlyRead;
  final bool autofocus;
  final EdgeInsets margin;
  final IconData? icon;
  final double iconSize;
  final Color? color;
  final Color? borderColor;
  final BorderSide? border;
  final BorderRadius? borderRadius;
  final BorderSide? borderError;
  final BorderRadius? borderErrorRadius;
  final bool isPassword;
  final bool? isRequired;
  late int maxLines;
  late int minLines;
  late TextAlign? textAlign;
  final int? maxLength;
  final Widget? suffixWidget;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  TextFieldX({
    super.key,
    required this.controller,
    this.label,
    this.isRequired,
    this.hint,
    this.validate,
    this.autofocus = false,
    this.textInputType,
    this.textInputAction,
    this.isPassword = false,
    this.onlyRead,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.icon,
    this.iconSize = 24.0,
    this.disabled = false,
    this.color,
    this.borderColor,
    this.border,
    this.borderRadius,
    this.borderError,
    this.borderErrorRadius,
    this.textAlign,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.suffixWidget,
    this.inputFormatters,
  }) {
    if (minLines > maxLines) {
      maxLines = minLines;
    }
  }

  @override
  State<TextFieldX> createState() => _TextFieldXState();
}

class _TextFieldXState extends State<TextFieldX> {
  late bool passwordVisible;
  @override
  void initState() {
    passwordVisible = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: widget.border?? BorderSide(
        width: StyleX.borderWidth,
        color: widget.borderColor ?? Theme.of(context).dividerColor,
      ),
      borderRadius: widget.borderRadius??BorderRadius.circular(StyleX.radius),
    );
    OutlineInputBorder borderError = OutlineInputBorder(
      borderSide: widget.borderError??BorderSide(
        width: StyleX.borderWidth,
        color: Theme.of(context).colorScheme.error,
      ),
      borderRadius: widget.borderErrorRadius??BorderRadius.circular(StyleX.radius),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) LabelInputX(widget.label!,isRequired:widget.isRequired),
        Padding(
          padding: widget.margin,
          child: TextFormField(
            textAlign: widget.textAlign?? TextAlign.start,
            maxLength: widget.maxLength,
            minLines: widget.minLines,
            style: TextStyleX.titleSmall,
            autofocus: widget.autofocus,
            onChanged: widget.onChanged,
            validator: widget.validate,
            readOnly: widget.onlyRead ?? widget.disabled,
            obscureText: passwordVisible,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            maxLines: widget.maxLines,
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            inputFormatters: widget.inputFormatters,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.disabled
                  ? Theme.of(context).disabledColor
                  : widget.color ?? Theme.of(context).cardTheme.color,

              contentPadding: widget.icon != null
                  ? const EdgeInsets.symmetric(vertical: 1, horizontal: 4)
                  : const EdgeInsetsDirectional.only(start: 0,end: 16, top: 12,bottom: 12),
              enabledBorder: border,
              focusedBorder: border,
              disabledBorder: border,
              errorBorder: borderError,
              focusedErrorBorder: borderError,
              prefixIcon: widget.icon != null
                  ? Icon(
                      widget.icon,
                      size: widget.iconSize,
                      color: ColorX.grey.shade400,
                    )
                  : const SizedBox(),
              prefixIconConstraints:widget.icon != null?null:
              BoxConstraints.tight(
                  const Size(16, StyleX.inputHeight),
              ),
              suffixIcon: widget.suffixWidget!=null?Padding(padding:
                  const EdgeInsetsDirectional.only(end: 16)
                  ,child:widget.suffixWidget):
                  (widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            passwordVisible ? Iconsax.eye : Iconsax.eye_slash,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        )
                      : null),
              suffixIconConstraints:
                  const BoxConstraints(maxWidth: StyleX.inputHeight),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: InputBorder.none,
              isCollapsed: true,
              errorStyle: TextStyleX.titleSmall,
              alignLabelWithHint: true,
              hintText: (widget.hint ?? "").tr,
              hintStyle: TextStyleX.titleSmall.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
        ),
      ],
    );
  }
}
