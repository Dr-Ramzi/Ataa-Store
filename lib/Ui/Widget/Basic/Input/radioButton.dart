part of '../../widget.dart';

class RadioButtonX<T> extends StatelessWidget {
  const RadioButtonX({super.key,required this.groupValue,required this.value, required this.onChanged, required this.label, this.isCardOnly=false, this.color});
  final String label;
  final bool isCardOnly;
  final Color? color;
  final T groupValue;
  final T value;
  final void Function(T? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: ContainerX(
        margin: const EdgeInsets.symmetric(vertical: 5),
        isBorder: true,
        color: value==groupValue?context.isDarkMode?ColorX.primary.shade900.withOpacity(0.3):Theme.of(context).colorScheme.onPrimary:color??Theme.of(context).cardTheme.color,
        borderColor: value==groupValue?Theme.of(context).primaryColor:null,
        padding: isCardOnly?null:EdgeInsets.zero,
        height: StyleX.inputHeight,
        child: Row(
          mainAxisAlignment: isCardOnly?MainAxisAlignment.center:MainAxisAlignment.start,
          children: [
            if(!isCardOnly)
            Radio<T>(
              value: value,
              groupValue: groupValue,
              fillColor: WidgetStateProperty.all(value==groupValue?Theme.of(context).primaryColor:ColorX.grey.shade300,), // Change the fill color when selected
              splashRadius: 25, // Change the splash radius when clicked
              onChanged: onChanged,
            ),
            Flexible(child: TextX(label))
          ],
        ),
      ),
    );
  }
}
