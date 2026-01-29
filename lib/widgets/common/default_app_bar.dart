import 'package:ytnkio/core_module.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final String? title;

  const DefaultAppBar(
      {this.actions,
      this.title,
      this.backgroundColor,
      this.titleColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? GlobalConstants.defaultBarColor,
      title: Text(title ?? GlobalConstants.appTitle),
      centerTitle: true,
      actions: actions,
      iconTheme: const IconThemeData(color: GlobalConstants.defaultTitleColor),
      titleTextStyle: GoogleFonts.jost(
          fontSize: 20, color: titleColor ?? GlobalConstants.defaultTitleColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
