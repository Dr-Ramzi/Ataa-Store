part of '../../widget.dart';

class AppBarX extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  final List<Widget>? actions;
  final bool isBack;
  final Color? color;
  final Color? backgroundColor;

  const AppBarX({
    super.key,
    this.title,
    this.height = StyleX.appBarHeight,
    this.actions,
    this.isBack = true,
    this.color,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeX.dark,
      child: AppBar(
        title: title != null
            ? TextX(
                title!,
                style: TextStyleX.titleLarge,
                color: Colors.white,
              ).fadeAnimation100
            : null,
        surfaceTintColor: Colors.transparent,
        actions: actions,
        leadingWidth: 100,
        leading: isBack
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: StyleX.hPaddingApp),
                    child: InkWell(
                      onTap: () => Get.back(),
                      borderRadius: BorderRadius.circular(StyleX.radius),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(StyleX.radius),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).fadeAnimation100
            : const SizedBox(),
        centerTitle: true,
        backgroundColor: ColorX.primary,
        toolbarHeight: StyleX.appBarPaddingTop,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(StyleX.radiusAppBar),
          ),
        ),
      ),
    );
  }
}
