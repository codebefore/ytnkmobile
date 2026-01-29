import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const id = "/pages/auth/forgot_password_page";

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  bool successfullyCompleted = false;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isNaked: true,
      title: GlobalTexts.current.FORGOT_PASSWORD_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.isSuccessful) {
              successfullyCompleted = true;
            } else {
              successfullyCompleted = false;

              EasyLoading.showError(state.infoMessage);
            }
          }
        },
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                GlobalTexts.current.FORGOT_PASSWORD_PAGE_title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                GlobalTexts.current.FORGOT_PASSWORD_PAGE_emailHint,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: DefaultTextFormField(
                  labelText: GlobalTexts.current.FORGOT_PASSWORD_PAGE_email,
                  helperText: "",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  icon: GlobalIcons.GENERAL_emailIcon,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return GlobalTexts
                          .current.FORGOT_PASSWORD_PAGE_emailIsNotValid;
                    }
                    return null;
                  },
                ),
              ),
              successfullyCompleted
                  ? const SizedBox(height: 32)
                  : DefaultElevatedButton(
                      isProcessing: state.isProcessing,
                      icon: GlobalIcons.FORGOT_PASSWORD_PAGE_mailLockIcon,
                      label: GlobalTexts
                          .current.FORGOT_PASSWORD_PAGE_resetPassword,
                      onPressed: () {
                        if (emailController.text.isEmpty) {
                          EasyLoading.showInfo(GlobalTexts
                              .current.FORGOT_PASSWORD_PAGE_emailHint);

                          return;
                        }

                        context.read<GlobalBloc>().add(
                              ForgotPasswordEvent(email: emailController.text),
                            );
                      },
                    ),
              SizedBox(height: 32),
              successfullyCompleted
                  ? HyperLink(
                      linkCallBack: null,
                      mode: LaunchMode.externalApplication,
                      textAlign: TextAlign.center,
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 15),
                      linkStyle: const TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      text: GlobalTexts
                          .current.FORGOT_PASSWORD_PAGE_resetLinkGenerated,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
