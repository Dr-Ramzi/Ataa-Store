part of "../../widget.dart";

class StatisticCardX extends StatelessWidget {
  const StatisticCardX(
      {super.key,
      this.color,
      required this.icon,
      required this.statistic,
      required this.subtitle,
      this.isMoney=false,
      });
  final Color? color;
  final IconData icon;
  final num statistic;
  final String subtitle;
  final bool isMoney;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      height: StyleX.statisticCardHeight,
      width: double.maxFinite,
      color: color ?? Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerX(
            width: 50,
            height: 50,
            color: Theme.of(context).colorScheme.onPrimary,
            padding: EdgeInsets.zero,
            child: Center(
              child: Icon(
                icon,
                color: ColorX.primary,
                size: 33,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(child: TextX(FunctionX.formatLargeNumber(statistic), style: TextStyleX.headerSmall,fontWeight: FontWeight.w700,)),
           const SizedBox(width: 6),
              if(isMoney)
             TextX("SAR", style: TextStyleX.titleLarge,fontWeight: FontWeight.w600)
            ],
          ),
          Expanded(
            child: AutoSizeText(
              subtitle.tr,
              style: TextStyleX.supTitleLarge,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
