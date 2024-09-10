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
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: AutoSizeText(
                  FunctionX.formatLargeNumber(statistic),
                  style: TextStyleX.headerSmall.copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                ),
              ),
             const SizedBox(width: 6),
              if(isMoney)
             TextX("SAR", style: TextStyleX.titleLarge,fontWeight: FontWeight.w600)
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: AutoSizeText(
                    subtitle.tr,
                    style: TextStyleX.titleMedium.copyWith(color: Theme.of(context).colorScheme.secondary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
