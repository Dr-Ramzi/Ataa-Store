part of '../../widget.dart';

class RadioButtonX<T> extends StatelessWidget {
  const RadioButtonX(
      {super.key,
      required this.groupValue,
      required this.value,
      required this.onChanged,
      required this.label,
      this.isCardOnly = false,
      this.check,
      this.valueCheck,
      this.color,
      this.margin = const EdgeInsets.symmetric(vertical: 5)});
  final String label;
  final bool isCardOnly;
  final EdgeInsets margin;
  final Color? color;
  final T? groupValue;
  final T value;
  final dynamic valueCheck;
  final bool Function()? check;
  final void Function(T? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: ContainerX(
        margin: margin,
        isBorder: true,
        color: (check!=null?check!():value.hashCode == groupValue.hashCode)
            ? context.isDarkMode
                ? ColorX.primary.shade900.withOpacity(0.3)
                : Theme.of(context).colorScheme.onPrimary
            : color ?? Theme.of(context).cardTheme.color,
        borderColor: (check!=null?check!():value.hashCode == groupValue.hashCode)
            ? Theme.of(context).primaryColor
            : null,
        padding: isCardOnly ? const EdgeInsets.all(14.0) : EdgeInsets.zero,
        height: StyleX.inputHeight,
        child: Row(
          mainAxisAlignment:
              isCardOnly ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (!isCardOnly)
              Radio(
                value: valueCheck??value.hashCode,
                groupValue: groupValue.hashCode,
                fillColor: WidgetStateProperty.all(
                  (check!=null?check!():value.hashCode == groupValue.hashCode)
                      ? Theme.of(context).primaryColor
                      : ColorX.grey.shade300,
                ), // Change the fill color when selected
                splashRadius: 25, // Change the splash radius when clicked
                onChanged: (_) => onChanged(value),
              ),
            Flexible(
              child: TextX(
                label,
                color: (check!=null?check!():value.hashCode == groupValue.hashCode)
                    ? Theme.of(context).primaryColor
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
