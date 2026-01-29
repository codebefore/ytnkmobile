import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/pages/auth/signup_page.dart';
import 'package:ytnkio/widgets/auth/already_have_an_account_section.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/auth/google_auth_button.dart';
import 'package:ytnkio/widgets/common/divider_with_text.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/widgets/auth/user_agreement_section.dart';

class SignupOptionsPage extends StatefulWidget {
  static const id = "/pages/auth/signup_options_page";

  const SignupOptionsPage({super.key});

  @override
  State<SignupOptionsPage> createState() => _SignupOptionsPageState();
}

class _SignupOptionsPageState extends State<SignupOptionsPage> {
  AuthUserInfo? authenticatedUser;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isNaked: true,
      title: GlobalTexts.current.LOGIN_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.isFailure) {
              EasyLoading.showError(state.infoMessage);

              return;
            }

            if (state.isSuccessful) {
              if (state.isAuthenticated) {
                authenticatedUser = state.user!;

                context.replace(SignupPage.id, extra: authenticatedUser);
              }
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              DefaultElevatedButton(
                  isProcessing: state.isProcessing,
                  icon: GlobalIcons.GENERAL_emailIcon,
                  label:
                      GlobalTexts.current.SIGNUP_OPTIONS_PAGE_signupWithEmail,
                  onPressed: () {
                    context.push(SignupPage.id);
                  }),
              DividerWithText(text: GlobalTexts.current.SIGNUP_OPTIONS_PAGE_or),
              const GoogleAuthButton(
                isSignup: true,
              ),
              const UserAgreementSection(),
              const AlreadyHaveAnAccountSection(),
            ],
          ),
        ),
      ),
    );
  }
}
