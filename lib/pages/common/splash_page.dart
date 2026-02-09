// ignore_for_file: library_prefixes

import 'dart:math' as Math;

import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/pages/auth/login_page.dart';
import 'package:ytnkio/pages/common/landing_page.dart';
import 'package:ytnkio/pages/common/dashboard_page.dart';
import 'package:ytnkio/pages/profile/view_profile_page.dart';
import 'package:ytnkio/pages/auth/email_verification_page.dart';

import '../../core_module.dart';

class SplashPage extends StatefulWidget {
  static const id = "pages/auth/splash_page";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 2 * Math.pi).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubicEmphasized),
    );

    _sizeAnimation = Tween<double>(begin: 20, end: 100).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateAfterSplash();
      }
    });
  }

  void _navigateAfterSplash() {
    final state = context.read<GlobalBloc>().state;

    // If restore is still processing, wait a bit and retry.
    if (state.isProcessing && state.lastOperation == Operations.restoreSession) {
      Future.delayed(const Duration(milliseconds: 200), _navigateAfterSplash);
      return;
    }

    if (state.isAuthenticated) {
      if (state.profileStatus == ProfileStatus.unknown) {
        context.push(LoginPage.id);
        return;
      }

      if (state.user != null && state.user!.isEmailVerified) {
        if (state.profile.completeness > 30) {
          context.go(DashboardPage.id);
        } else {
          context.go(ViewProfilePage.id);
        }
      } else {
        context.go(EmailVerificationPage.id, extra: state.user);
      }
      return;
    }

    final isLandingComplete = state.isLandingCompleted;
    if (isLandingComplete) {
      context.push(LoginPage.id);
    } else {
      context.push(LandingPage.id);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
        Center(
          child: AnimatedBuilder(
            animation: _sizeAnimation,
            builder: (context, child) {
              return AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                GlobalConstants.splashLogoPath,
                height: _sizeAnimation.value, 
              ),
            );
            },
          ),
        ),
    );
  }
}
