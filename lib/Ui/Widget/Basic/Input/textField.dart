part of '../../widget.dart';

class TextFieldX extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool disabled;
  final bool? onlyRead;
  final bool autofocus;
  final EdgeInsets margin;
  final IconData? icon;
  final Color? color;
  final bool isPassword;
  late int maxLines;
  late int minLines;
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
    this.hint,
    this.validate,
    this.autofocus = false,
    this.textInputType,
    this.textInputAction,
    this.isPassword = false,
    this.onlyRead,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
    this.icon,
    this.disabled = false,
    this.color,
    this.onChanged,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength, this.suffixWidget, this.inputFormatters,
  }){
    if(minLines> maxLines){
      maxLines=minLines;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) LabelInputX(widget.label!),
        ContainerX(
          margin: widget.margin,
          padding: widget.icon != null
              ? const EdgeInsets.symmetric(vertical: 1,horizontal: 4)
              : const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          isBorder: true,
          color: widget.disabled
              ? Theme.of(context).disabledColor
              : widget.color??Theme.of(context).cardTheme.color,
          child: TextFormField(
            maxLength: widget.maxLength,
            minLines: widget.minLines,
            style: TextStyleX.titleSmall,
            autofocus: widget.autofocus,
            onChanged: widget.onChanged,
            validator: widget.validate,
            readOnly: widget.onlyRead??widget.disabled,
            obscureText: passwordVisible,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            maxLines: widget.maxLines,
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              prefixIcon:
                  widget.icon != null ? Icon(widget.icon, size: 24.0,color: ColorX.grey.shade400,) : null,
              suffixIcon: widget.suffixWidget??(widget.isPassword
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
      ],
    );
  }
}
