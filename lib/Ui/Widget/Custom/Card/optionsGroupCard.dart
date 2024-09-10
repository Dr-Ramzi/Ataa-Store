part of '../../widget.dart';

class OptionsGroupCardX extends StatelessWidget {
  final String? title;
  final List<Widget> options;

  const OptionsGroupCardX({
    this.title,
    required this.options,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          TextX(
            title!,
            color: Theme.of(context).primaryColor,
            style: TextStyleX.titleMedium,
            fontWeight: FontWeight.w700,
          ).fadeAnimation300,
        if (title != null) const SizedBox(height: 12),
        ContainerX(
          padding: EdgeInsets.zero,
          child: Column(
            children: options,
          ),
        ).fadeAnimation300,
      ],
    );
  }
}
