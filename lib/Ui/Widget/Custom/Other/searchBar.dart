part of '../../widget.dart';

class SearchBarX extends StatelessWidget {
  const SearchBarX(
      {super.key, required this.search, required this.onTapFilter, required this.onSearching});
  final TextEditingController search;
  final Function onTapFilter;
  final Function(String val) onSearching;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp, vertical: 10),
      child: Row(
        children: [
          Flexible(
            child: TextFieldX(
              color: Theme.of(context).cardColor,
              icon: Icons.search_rounded,
              controller: search,
              hint: "search",
              textInputAction: TextInputAction.search,
              textInputType: TextInputType.text,
              onChanged: onSearching,
            ),
          ),
          const SizedBox(width: 10),
          ButtonX(
            onTap: onTapFilter,
            iconData: Icons.filter_list_alt,
            width: StyleX.buttonHeight,
          )
        ],
      ),
    );
  }
}
