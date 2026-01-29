import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/common/dashboard_page.dart';
import 'package:ytnkio/pages/auth/login_page.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/pages/profile/preferences_page.dart';
import 'package:ytnkio/pages/profile/settings_page.dart';

class DefaultAppDrawer extends StatelessWidget {
  const DefaultAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) => SafeArea(
        child: Drawer(
          backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
          child: Column(
            children: [
              Center(
                child: Text(
                  GlobalConstants.appTitle,
                  style: GoogleFonts.pacifico(fontSize: 32),
                ),
              ),
              const Divider(),
              state.user == null
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextButton.icon(
                            label: Text(GlobalTexts.current.DRAWER_preferences),
                            icon: const Icon(Icons.settings),
                            onPressed: () {
                              context.push(PreferencesPage.id);
                            },
                          ),
                          const Divider(),
                          TextButton.icon(
                            label: Text(GlobalTexts.current.DRAWER_dashboard),
                            icon: const Icon(Icons.dashboard),
                            onPressed: () {
                              context.go(DashboardPage.id);
                            },
                          ),
                          const Divider(),
                          TextButton.icon(
                            label: Text(GlobalTexts.current.DRAWER_settings),
                            icon: const Icon(Icons.settings),
                            onPressed: () {
                              context.push(SettingsPage.id);
                            },
                          ),
                          const Divider(),
                          TextButton.icon(
                            label: Text(GlobalTexts.current.DRAWER_logout),
                            icon: const Icon(Icons.logout),
                            onPressed: () {
                              context.read<GlobalBloc>().add(LogoutEvent());

                              context.go(LoginPage.id);
                            },
                          ),
                        ],
                      ),
                    ),
              state.isLandingCompleted
                  ? TextButton(
                      child: Text(GlobalTexts.current.DRAWER_uncompleteLanding),
                      onPressed: () {
                        context
                            .read<GlobalBloc>()
                            .add(UncompleteLandingEvent());
                      },
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
