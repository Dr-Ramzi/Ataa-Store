part of '../../widget.dart';

class MessageCardX extends StatelessWidget {
  const MessageCardX({
    super.key,
    this.message,
    this.maxLine = 2,
    this.child,
    this.icon,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.isError=false,
  });
  final String? message;
  final int maxLine;
  final Widget? child;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      color: backgroundColor??(isError?context.isDarkMode?ColorX.danger.shade900.withOpacity(0.05):Theme.of(context).colorScheme.onError:Theme.of(context).colorScheme.onPrimary),
      isBorder: true,
      borderColor: borderColor??(isError?context.isDarkMode?ColorX.danger.shade400:ColorX.danger.shade300:ColorX.primary.shade300),
      child: Row(
        children: [
          Icon(
            icon??(isError?Icons.warning_amber_rounded:Icons.info_rounded),
            color: color??(isError?Theme.of(context).colorScheme.error:ColorX.primary),
            size: 28,
          ),
          const SizedBox(width: 10),
          if(message!=null)
          Expanded(
            child: TextX(
              message!,
              maxLines: maxLine,
              style: TextStyleX.titleSmall,
              color: color??(isError?ColorX.danger.shade500:ColorX.primary),
            ),
          ),
          if(child != null)
            child!
        ],
      ),
    );
  }
}
