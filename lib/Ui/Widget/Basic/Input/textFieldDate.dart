part of '../../widget.dart';

class TextFieldDateX extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final bool disabled;
  final EdgeInsets margin;
  final IconData? icon;
  final Color? color;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final String? Function(String?)? validate;
  final Function(DateTime?)? onChange;
  const TextFieldDateX({
    super.key,
    required this.controller,
    required this.hint,
    this.validate,
    this.initialDate,
    this.color,
    this.lastDate,
    this.firstDate,
    this.label,
    this.disabled = false,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.icon,
    this.onChange,
  });

  @override
  State<TextFieldDateX> createState() => _TextFieldDateXState();
}

class _TextFieldDateXState extends State<TextFieldDateX> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null) LabelInputX(widget.label!),
        ContainerX(
          margin: widget.margin,
          padding: widget.icon != null
              ? const EdgeInsets.symmetric(vertical: 1, horizontal: 4)
              : const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          isBorder: true,
          color: widget.disabled
              ? Theme.of(context).disabledColor
              : widget.color ?? Theme.of(context).cardTheme.color,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validate,
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.done,
            style: TextStyleX.titleSmall,
            focusNode: AlwaysDisabledFocusNode(),
            readOnly: true,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: widget.icon != null
                  ? Icon(
                      widget.icon,
                      size: 22.0,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : null,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: InputBorder.none,
              hintText: widget.hint.tr,
              isCollapsed: true,
              helperStyle: TextStyleX.supTitleMedium,
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());

              DateTime? date;
              await bottomSheetX(
                child: Column(
                  children: [
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        currentDate: widget.initialDate ??
                            widget.lastDate ??
                            DateTime.now(),
                        calendarType: CalendarDatePicker2Type.single,
                        firstDate: widget.firstDate ?? DateTime(1900),
                        lastDate: widget.lastDate ?? DateTime(2100),
                        selectedMonthTextStyle: TextStyleX.titleSmall.copyWith(color: context.isDarkMode?ColorX.primary.shade100:Colors.white),
                        selectedYearTextStyle: TextStyleX.titleSmall.copyWith(color: context.isDarkMode?ColorX.primary.shade100:Colors.white),
                        selectedDayTextStyle: TextStyleX.titleSmall.copyWith(color: context.isDarkMode?ColorX.primary.shade100:Colors.white)
                      ),
                      value: [widget.initialDate],
                      onValueChanged: (dates) {
                        date = dates[0];
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: ButtonX(
                            text: "Ok",
                            onTap: () {
                              widget.controller.text = date != null
                                  ? intl.DateFormat.yMMMMEEEEd().format(date!)
                                  : '';
                              if (widget.onChange != null) {
                                widget.onChange!(date);
                              }
                              Get.back();
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: ButtonX.gray(
                            text: "Clear",
                            onTap: () {
                              widget.controller.text = '';
                              widget.onChange!(null);
                              Get.back();
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
