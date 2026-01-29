import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/models/profile/certificate.dart';
import 'package:ytnkio/models/profile/education.dart';
import 'package:ytnkio/models/profile/profile.dart';
import 'package:ytnkio/models/profile/skill.dart';
import 'package:ytnkio/models/profile/work_experience.dart';
import 'package:ytnkio/pages/auth/email_verification_page.dart';
import 'package:ytnkio/pages/common/dashboard_page.dart';
import 'package:ytnkio/pages/profile/edit_avatar_page.dart';
import 'package:ytnkio/pages/profile/edit_certificate_page.dart';
import 'package:ytnkio/pages/profile/edit_education_page.dart';
import 'package:ytnkio/pages/profile/edit_headline_page.dart';
import 'package:ytnkio/pages/profile/edit_personal_info_page.dart';
import 'package:ytnkio/pages/profile/edit_skill_page.dart';
import 'package:ytnkio/pages/profile/edit_summary_page.dart';
import 'package:ytnkio/pages/profile/edit_work_experience_page.dart';
import 'package:ytnkio/pages/auth/forgot_password_page.dart';
import 'package:ytnkio/pages/common/landing_page.dart';
import 'package:ytnkio/pages/auth/login_page.dart';
import 'package:ytnkio/pages/match/match_page.dart';
import 'package:ytnkio/pages/match/matches_page.dart';
import 'package:ytnkio/pages/profile/parse_pdf_page.dart';
import 'package:ytnkio/pages/profile/preferences_page.dart';
import 'package:ytnkio/pages/auth/signup_options_page.dart';
import 'package:ytnkio/pages/auth/signup_page.dart';
import 'package:ytnkio/pages/common/splash_page.dart';
import 'package:ytnkio/pages/profile/settings_page.dart';
import 'package:ytnkio/pages/survey/complete_survey_page.dart';
import 'package:ytnkio/pages/survey/start_survey_page.dart';
import 'package:ytnkio/pages/survey/take_survey_page.dart';
import 'package:ytnkio/pages/profile/view_profile_page.dart';
import 'package:ytnkio/widgets/common/connectivity_checker.dart';
import 'package:ytnkio/models/match/match.dart';

class GoRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: ServiceDownPage.id,
        builder: (context, state) => const ServiceDownPage(),
      ),
      GoRoute(
        path: SplashPage.id,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: LandingPage.id,
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: LoginPage.id,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: EmailVerificationPage.id,
        builder: (context, state) => EmailVerificationPage(
          user: state.extra != null
              ? state.extra as AuthUserInfo
              : AuthUserInfo.initial(),
        ),
      ),
      GoRoute(
        path: SignupOptionsPage.id,
        builder: (context, state) => const SignupOptionsPage(),
      ),
      GoRoute(
        path: SignupPage.id,
        builder: (context, state) => SignupPage(
          user: state.extra != null ? state.extra as AuthUserInfo : null,
        ),
      ),
      GoRoute(
        path: ForgotPasswordPage.id,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: DashboardPage.id,
        builder: (context, state) =>
            PopScope(canPop: context.canPop(), child: const DashboardPage()),
      ),
      GoRoute(
        path: ViewProfilePage.id,
        builder: (context, state) =>
            PopScope(canPop: context.canPop(), child: const ViewProfilePage()),
      ),
      GoRoute(
        path: SettingsPage.id,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: ParsePdfPage.id,
        builder: (context, state) => const ParsePdfPage(),
      ),
      GoRoute(
        path: StartSurveyPage.id,
        builder: (context, state) => const StartSurveyPage(),
      ),
      GoRoute(
        path: CompleteSurveyPage.id,
        builder: (context, state) => const CompleteSurveyPage(),
      ),
      GoRoute(
        path: TakeSurveyPage.id,
        builder: (context, state) =>
            TakeSurveyPage(profile: (state.extra as Profile)),
      ),
      GoRoute(
        path: MatchesPage.id,
        builder: (context, state) =>
            PopScope(canPop: context.canPop(), child: const MatchesPage()),
      ),
      GoRoute(
        path: EditSummaryPage.id,
        builder: (context, state) => const EditSummaryPage(),
      ),
      GoRoute(
        path: EditHeadlinePage.id,
        builder: (context, state) => const EditHeadlinePage(),
      ),
      GoRoute(
        path: EditEducationPage.id,
        builder: (context, state) => EditEducationPage(
          education: state.extra != null
              ? state.extra as Education
              : Education.initial(),
        ),
      ),
      GoRoute(
        path: EditWorkExperiencePage.id,
        builder: (context, state) => EditWorkExperiencePage(
          workExperience: state.extra != null
              ? state.extra as WorkExperience
              : WorkExperience.initial(),
        ),
      ),
      GoRoute(
        path: EditAvatarPage.id,
        builder: (context, state) => const EditAvatarPage(),
      ),
      GoRoute(
          path: EditPersonalInfoPage.id,
          builder: (context, state) {
            return const EditPersonalInfoPage();
          }),
      GoRoute(
        path: EditCertificatePage.id,
        builder: (context, state) => EditCertificatePage(
          certificate: state.extra != null
              ? state.extra as Certificate
              : Certificate.initial(),
        ),
      ),
      GoRoute(
        path: EditSkillPage.id,
        builder: (context, state) => EditSkillPage(
          skill: state.extra != null ? state.extra as Skill : Skill.initial(),
        ),
      ),
      GoRoute(
        path: PreferencesPage.id,
        builder: (context, state) => const PreferencesPage(),
      ),
      GoRoute(
        path: MatchPage.id,
        builder: (context, state) => MatchPage(
          match: (state.extra as Match),
        ),
      ),
    ],
    redirect: (context, state) {
      // if (state.path == '/') {
      //   return state.uri.toString();
      // }

      if (state.path != null) {
        if (!context.canPop()) {
          return state.uri.toString();
        }
      }

      return null;
    },
  );
}

class CustomNavigatorObserver extends NavigatorObserver {
  final List<Route> _routeStack = [];

  bool get isLastPage => _routeStack.length == 1;

  @override
  void didPush(Route route, Route? previousRoute) {
    _routeStack.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _routeStack.remove(route);
    super.didPop(route, previousRoute);
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    final tweenDouble = Tween<double>(begin: 1.2, end: 1.0);

    if (route.settings.name == LandingPage.id ||
        route.settings.name == LoginPage.id ||
        route.settings.name == SplashPage.id) {
      return ScaleTransition(
          scale: tweenDouble.animate(curvedAnimation), child: child);
    }

    final tweenOffset = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);

    return SlideTransition(
      position: tweenOffset.animate(curvedAnimation),
      child: child,
    );
  }
}
