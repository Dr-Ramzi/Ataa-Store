part of '../../widget.dart';

class LabelInputX extends StatelessWidget {
  const LabelInputX(this.label,{super.key, this.marginTop = 6,this.marginBottom = 6, this.isOptional=false });
  final String label;
  final double marginTop;
  final double marginBottom;
  final bool isOptional;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: marginBottom,top: marginTop),
          child: TextX(label),
        ),
        const SizedBox(width: 5),
        if(isOptional)
          TextX("(${"optional".tr})",style: TextStyleX.supTitleLarge,)
      ],
    );
  }
}
