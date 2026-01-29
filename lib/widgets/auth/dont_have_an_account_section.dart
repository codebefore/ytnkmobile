import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/bloc_exports.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/auth/signup_options_page.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';

class DontHaveAnAccountSection extends StatelessWidget {
  const DontHaveAnAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(GlobalTexts.current.LOGIN_PAGE_dontHaveAnAccount),
            DefaultTextButton(
              isProcessing: state.isProcessing,
              icon: null,
              label: GlobalTexts.current.LOGIN_PAGE_createAccount,
              onPressed: () {
                context.push(SignupOptionsPage.id);
              },
            ),
          ],
        );
      },
    );
  }
}
