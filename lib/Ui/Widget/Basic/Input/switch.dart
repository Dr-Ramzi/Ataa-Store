part of '../../widget.dart';

class SwitchX extends StatefulWidget {
  const SwitchX(
      {super.key,
      this.label,
      required this.value,
      required this.onChange,
      this.isChangeStateInternally = true,
      this.margin = const EdgeInsets.symmetric(vertical: 5),
      this.isSmallTitle = false,
      this.isFittedTitle = true});
  final String? label;
  final bool value;
  final bool isChangeStateInternally;
  final Function(bool val) onChange;
  final EdgeInsetsGeometry margin;
  final bool isSmallTitle;
  final bool isFittedTitle;
  @override
  State<SwitchX> createState() => _SwitchXState();
}

class _SwitchXState extends State<SwitchX> {
  late bool value;
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Switch(
                value: widget.isChangeStateInternally ? value : widget.value,
                onChanged: (bool val) async {
                  setState(() {
                    value = val;
                  });
                  await widget.onChange(val);
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (widget.label != null && widget.isFittedTitle)
            Flexible(
              child: FittedBox(
                fit: BoxFit.fill,
                child: TextX(
                  widget.label!,
                  style: widget.isSmallTitle ? TextStyleX.titleSmall : null,
                ),
              ),
            ),
          if (widget.label != null && !widget.isFittedTitle)
            Flexible(
              child: TextX(
                widget.label!,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).iconTheme.color,
                style: widget.isSmallTitle ? TextStyleX.supTitleMedium : null,
              ),
            ),
        ],
      ),
    );
  }
}
