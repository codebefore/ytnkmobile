import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/auth/login_page.dart';

class AlreadyHaveAnAccountSection extends StatelessWidget {
  const AlreadyHaveAnAccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(GlobalTexts.current.SIGNUP_PAGE_alreadyHaveAnAccount),
        TextButton(
            onPressed: () {
              context.read<GlobalBloc>().add(LogoutEvent());

              context.go(LoginPage.id);
            },
            style: const ButtonStyle(
              textStyle: WidgetStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.bold)),
            ),
            child: Text(GlobalTexts.current.SIGNUP_OPTIONS_PAGE_login)),
      ],
    );
  }
}
