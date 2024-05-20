part of '../../widget.dart';

class ScrollCardsHorizontallyX extends StatelessWidget {
  const ScrollCardsHorizontallyX({super.key, required this.title, required this.icon, required this.cards, this.onShowMore, required this.height});
  final String title;
  final IconData icon;
  final List<Widget> cards;
  final Function()? onShowMore;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleX(
          icon: icon,
          title: title,
          showMore: onShowMore,
        ),
        SizedBox(
          height: height+24,// this 24 for padding bottom and top in listView
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: StyleX.hPaddingApp,
              right: StyleX.hPaddingApp,
              bottom: 16,
              top: 8,
            ),
            scrollDirection: Axis.horizontal,
            children: cards,
          ),
        ),
      ],
    );
  }
}
