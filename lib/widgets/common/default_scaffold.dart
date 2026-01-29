import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/widgets/common/alternate_navigation_bar.dart';

class DefaultScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool isNaked;
  final bool isOnlyBack;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? navigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const DefaultScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.isOnlyBack = false,
      this.appBar,
      this.drawer,
      this.navigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.isNaked = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          DefaultAppBar(
            title: title,
          ),
      drawer: drawer ??
          (isNaked ? null : (isOnlyBack ? null : const DefaultAppDrawer())),
      bottomNavigationBar: navigationBar ??
          (isNaked
              ? null
              : (isOnlyBack ? null : const AlternateNavigationBar())),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: body,
      ),
    );
  }
}
