import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/pages/auth/email_verification_page.dart';
import 'package:ytnkio/pages/common/dashboard_page.dart';
import 'package:ytnkio/pages/profile/view_profile_page.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/auth/dont_have_an_account_section.dart';
import 'package:ytnkio/widgets/auth/login_with_email_password.dart';
import 'package:ytnkio/widgets/auth/google_auth_button.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';
import 'package:ytnkio/widgets/common/divider_with_text.dart';
import 'package:ytnkio/core_module.dart';

class LoginPage extends StatefulWidget {
  static const id = "/pages/auth/login_page";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthUserInfo? authenticatedUser;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalBloc, GlobalState>(
      listener: (context, state) {
        if (!state.isProcessing) {
          if (state.isFailure) {
            EasyLoading.showError(state.infoMessage);

            return;
          }

          if (state.isSuccessful) {
            switch (state.lastOperation) {
              case Operations.login:
                GlobalTexts.changeLanguage(state.profile.languageCode);

                EasyLoading.showSuccess(GlobalTexts.current.LOGIN_PAGE_loginSuccessful,
                    duration: const Duration(seconds: 2));

                break;
              default:
            }

            if (state.isAuthenticated) {
              authenticatedUser = state.user!;

              if (state.profileStatus == ProfileStatus.unknown) {
                context
                    .read<GlobalBloc>()
                    .add(GetProfileFromEmailEvent(email: state.user!.email));
              } else if (state.profileStatus == ProfileStatus.noProfile) {
                //BU DURUMUN OLUŞMAMASI LAZIM HATALI BİR DURUM
                //PROFİLİ OLMAYAN KULLANICI OLMAMALI
              } else if (state.profileStatus ==
                  ProfileStatus.generatingNewProfile) {
                //PROFİL OLUŞTURULUYOR
              } else {
                if (state.user!.isEmailVerified) {
                  if (state.profile.completeness > 30) {
                    context.go(DashboardPage.id);
                  } else {
                    context.go(ViewProfilePage.id);
                  }
                } else {
                  context.go(EmailVerificationPage.id,
                      extra: authenticatedUser);
                }
              }
            }
          }
        }
      },
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return DefaultScaffold(
            isNaked: true,
            title: GlobalTexts.current.LOGIN_PAGE_title,
            body: state.isAuthenticated
                ? state.profileStatus == ProfileStatus.unknown
                    ? state.isFailure
                        ? Center(
                            child: ListView(
                            children: [
                              Text(GlobalTexts.current.LOGIN_PAGE_noProfile),
                              DefaultTextButton(
                                isProcessing: state.isProcessing,
                                icon: GlobalIcons.LOGINPAGE_logoutIcon,
                                label: GlobalTexts
                                    .current.LOGIN_PAGE_returnToLoginPage,
                                onPressed: () {
                                  context.read<GlobalBloc>().add(LogoutEvent());
                                },
                              )
                            ],
                          ))
                        : Center(
                            child: ListView(children: [
                              Text(GlobalTexts
                                  .current.LOGIN_PAGE_retreivingProfileInfo),
                              LinearProgressIndicator()
                            ]),
                          )
                    : Center(
                        child: ListView(
                        children: [
                          Text(GlobalTexts.current.LOGIN_PAGE_noProfile),
                          DefaultTextButton(
                            isProcessing: state.isProcessing,
                            icon: GlobalIcons.LOGINPAGE_logoutIcon,
                            label: "Return to login page",
                            onPressed: () {
                              context.read<GlobalBloc>().add(LogoutEvent());
                            },
                          )
                        ],
                      ))
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image.asset(
                            GlobalConstants.appLogoPath,
                            height: 96,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const LoginWithEmailPassword(),
                        const SizedBox(
                          height: 10,
                        ),
                        DividerWithText(
                            text: GlobalTexts.current.LOGIN_PAGE_or),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(
                            child: GoogleAuthButton(
                          isSignup: false,
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        const DontHaveAnAccountSection(),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
