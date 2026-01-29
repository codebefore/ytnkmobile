import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';

class GoogleAuthButton extends StatelessWidget {
  final bool isSignup;

  const GoogleAuthButton({required this.isSignup, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(builder: (context, state) {
      return Shimmer(
        color: Colors.white,
        colorOpacity: 0.8,
        enabled: state.isProcessing,
        duration: const Duration(seconds: 4),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            onPressed: state.isProcessing
                ? null
                : () async {
                    if (isSignup) {
                      // context.read<GlobalBloc>().add(LogoutEvent());

                      // await Future.delayed(const Duration(seconds: 1))
                      //     .then((value) {
                      //   if (context.mounted) {
                      //     context.read<GlobalBloc>().add(
                      //           SignupWithGoogleEvent(),
                      //         );
                      //   }
                      // });

                      context.read<GlobalBloc>().add(SignupWithGoogleEvent());
                    } else {
                      context.read<GlobalBloc>().add(LoginWithGoogleEvent());
                    }
                  },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    GlobalConstants.googleLogoPath,
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      isSignup
                          ? GlobalTexts
                              .current.SIGNUP_OPTIONS_PAGE_signupWithGoogle
                          : GlobalTexts.current.LOGIN_PAGE_loginWithGoogle,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
