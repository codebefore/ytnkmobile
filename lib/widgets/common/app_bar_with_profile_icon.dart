import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/pages/auth/login_page.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/pages/profile/view_profile_page.dart';

class AppBarWithProfileIcon extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const AppBarWithProfileIcon(
      {this.actions, this.backgroundColor, super.key, required this.title});

  @override
  AppBarWithProfileIconState createState() => AppBarWithProfileIconState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarWithProfileIconState extends State<AppBarWithProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalBloc, GlobalState>(listener: (context, state) {
      if (state.isAuthenticated == false) {
        context.go(LoginPage.id);
      }
    }, builder: (context, state) {
      return DefaultAppBar(
        backgroundColor: widget.backgroundColor,
        actions: [
          ...?widget.actions,
          state.user == null
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    context.go(ViewProfilePage.id);
                  },
                  icon: const Icon(Icons.account_circle_outlined),
                )
        ],
      );
    });
  }
}
