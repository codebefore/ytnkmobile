import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/auth/forgot_password_page.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';

class LoginWithEmailPassword extends StatefulWidget {
  const LoginWithEmailPassword({super.key});

  @override
  State<LoginWithEmailPassword> createState() => _LoginWithEmailPasswordState();
}

class _LoginWithEmailPasswordState extends State<LoginWithEmailPassword> {
  TextEditingController emailController =
      TextEditingController(text: GlobalTexts.current.LOGIN_PAGE_emailExample);
  TextEditingController passwordController = TextEditingController(
      text: GlobalTexts.current.LOGIN_PAGE_passwordExample);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
        builder: (BuildContext context, GlobalState state) {
      return Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DefaultTextFormField(
                  controller: emailController,
                  helperText: GlobalTexts.current.LOGIN_PAGE_emailHint,
                  labelText: GlobalTexts.current.LOGIN_PAGE_email,
                  icon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                controller: passwordController,
                helperText: "",
                labelText: GlobalTexts.current.LOGIN_PAGE_password,
                icon: Icons.password_rounded,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DefaultElevatedButton(
                        isProcessing: state.isProcessing,
                        icon: Icons.login_rounded,
                        label: GlobalTexts.current.LOGIN_PAGE_login,
                        onPressed: () {
                          context.read<GlobalBloc>().add(
                              LoginWithEmailPasswordEvent(emailController.text,
                                  passwordController.text));
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextButton(
                onPressed: () {
                  context.push(ForgotPasswordPage.id);
                },
                label: GlobalTexts.current.LOGIN_PAGE_forgotPassword,
                isProcessing: state.isProcessing,
                icon: null,
              ),
            ],
          ),
        ),
      );
    });
  }
}
