part of '../../widget.dart';

class ZakatCalculatorCardX extends StatelessWidget {
  const ZakatCalculatorCardX({
    super.key,
    required this.isOpen,
    required this.onChangeOpen,
    required this.child,
    required this.title,
  });
  final String title;
  final bool isOpen;
  final Function(bool val) onChangeOpen;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          SwitchX(
            isChangeStateInternally:false,
            value: isOpen,
            onChange: onChangeOpen,
            label: title,
          ),
            SizedBox(
              child: isOpen?ContainerX(
              color: Theme.of(context).cardTheme.color,
                child: child,
              ):null,
            ).sizeAnimation300,
        ],
      ),
    );
  }
}
