import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:ytnkio/blocs/bloc_exports.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/common/dashboard_page.dart';
import 'package:ytnkio/pages/match/matches_page.dart';
import 'package:ytnkio/pages/profile/view_profile_page.dart';

class AlternateNavigationBar extends StatelessWidget {
  const AlternateNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var router = GoRouter.of(context);

    return BlocBuilder<GlobalBloc, GlobalState>(builder: (context, state) {
      return StylishBottomBar(
        option: AnimatedBarOptions(
          opacity: 0.3,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.Default,
          inkEffect: true,
          inkColor: Colors.indigo.shade100,
        ),
        iconSpace: 2.0,
        elevation: 50,
        items: [
          BottomBarItem(
            icon: const Icon(Icons.location_history_outlined),
            title: Text(GlobalTexts.current.NAVIGATION_BAR_profile),
            selectedColor: Colors.indigo,
            backgroundColor: Colors.indigo,
          ),
          BottomBarItem(
            icon: const Icon(Icons.dashboard_outlined),
            title: Text(GlobalTexts.current.NAVIGATION_BAR_dashboard),
            selectedColor: Colors.indigo,
            backgroundColor: Colors.indigo,
          ),
          BottomBarItem(
            icon: const Icon(Icons.compare_arrows_sharp),
            title: Text(GlobalTexts.current.NAVIGATION_BAR_matches),
            selectedColor: Colors.indigo,
            backgroundColor: Colors.indigo,
            // badgeColor: Colors.indigo,
            // badge: const Text('3+'),
            // showBadge: true,
          ),
        ],
        currentIndex: router.state.path == ViewProfilePage.id
            ? 0
            : router.state.path == DashboardPage.id
                ? 1
                : router.state.path == MatchesPage.id
                    ? 2
                    : 0,
        onTap: (index) {
          if (index == 0) {
            context.go(ViewProfilePage.id);
          } else if (index == 1) {
            context.go(DashboardPage.id);
          } else if (index == 2) {
            context
                .read<GlobalBloc>()
                .add(RetrieveUsersMatchesEvent(profileId: state.profile.id));

            context.go(MatchesPage.id);
          }
        },
      );
    });
  }
}
