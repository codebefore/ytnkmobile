import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/auth/auth_user_info.dart';
import 'package:ytnkio/pages/common/dashboard_page.dart';
import 'package:ytnkio/pages/profile/view_profile_page.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';
import 'package:ytnkio/core_module.dart';

class EmailVerificationPage extends StatefulWidget {
  static const id = "/pages/auth/email_verification_page";

  final AuthUserInfo user;

  const EmailVerificationPage({required this.user, super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final verificationCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GlobalBloc>().add(SendVerificationEmailEvent(widget.user));
    });
  }

  void verifyEmail(syncCode) {
    if (verificationCodeController.text.isEmpty) {
      EasyLoading.showToast(
          GlobalTexts.current.EMAIL_VERIFICATION_PAGE_verificationCodeEmpty);
      return;
    }

    context.read<GlobalBloc>().add(VerifyEmailEvent(
        syncCode,
        verificationCodeController.text,
        widget.user.email,
        widget.user.userId));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isNaked: true,
      title: GlobalTexts.current.EMAIL_VERIFICATION_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.isFailure) {
              EasyLoading.showError(state.infoMessage);

              return;
            }

            if (state.isSuccessful) {
              if (state.user!.isEmailVerified) {
                EasyLoading.showSuccess(GlobalTexts
                    .current.EMAIL_VERIFICATION_PAGE_emailVerificationSuccess);

                Future.delayed(Duration.zero, () {
                  if (context.mounted) {
                    if (state.profile.completeness > 30) {
                      context.go(DashboardPage.id);
                    } else {
                      context.go(ViewProfilePage.id);
                    }
                  }
                });
              } else {
                EasyLoading.showSuccess(GlobalTexts
                    .current.EMAIL_VERIFICATION_PAGE_emailSentSuccessfully);
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
              (state.isSuccessful &&
                      state.verificationSentEmail?.isNotEmpty == true)
                  ? Text(
                      "${GlobalTexts.current.EMAIL_VERIFICATION_PAGE_verificationSentTo} ${state.verificationSentEmail!}",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    )
                  : const SizedBox(
                      height: 20,
                    ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                controller: verificationCodeController,
                helperText: GlobalTexts
                    .current.EMAIL_VERIFICATION_PAGE_verificationCodeHelper,
                labelText: GlobalTexts
                    .current.EMAIL_VERIFICATION_PAGE_verificationCodeLabel,
                icon: GlobalIcons.EMAIL_VERIFICATION_PAGE_verificationCodeIcon,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultElevatedButton(
                  isProcessing: state.isProcessing,
                  icon: GlobalIcons.GENERAL_emailIcon,
                  label:
                      GlobalTexts.current.EMAIL_VERIFICATION_PAGE_verifyEmail,
                  onPressed: () {
                    verifyEmail(state.verificationSyncCode);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
