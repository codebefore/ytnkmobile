import 'package:go_router/go_router.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/auth/login_page.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/widgets/landing/landing_page_presenter.dart';

class LandingPage extends StatelessWidget {
  static const id = "/pages/landing/landing_page";

  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return !current.isLandingCompleted;
      },
      builder: (context, state) {
        return BlocListener<GlobalBloc, GlobalState>(
          listener: (context, state) {
            if (state.isLandingCompleted) {
              context.go(LoginPage.id);
            }
          },
          child: LandingPagePresenter(
              onSkip: () {
                context.go(LoginPage.id);
              },
              onFinish: () {
                context.read<GlobalBloc>().add(CompleteLandingEvent());
              },
              pages: [
                LandingPageModel(
                  title: GlobalTexts.current.LANDING_PAGE_landing1Title,
                  description:
                      GlobalTexts.current.LANDING_PAGE_landing1Description,
                  imageUrl: 'lib/assets/images/landing1.png',
                  bgColor: Colors.white,
                  textColor: Colors.deepPurple,
                ),
                LandingPageModel(
                  title: GlobalTexts.current.LANDING_PAGE_landing2Title,
                  description:
                      GlobalTexts.current.LANDING_PAGE_landing2Description,
                  imageUrl: 'lib/assets/images/landing2.png',
                  bgColor: Colors.white,
                  textColor: const Color(0xff1eb090),
                ),
                LandingPageModel(
                  title: GlobalTexts.current.LANDING_PAGE_landing3Title,
                  description:
                      GlobalTexts.current.LANDING_PAGE_landing3Description,
                  imageUrl: 'lib/assets/images/landing3.png',
                  bgColor: Colors.white,
                  textColor: const Color(0xfffeae4f),
                ),
                LandingPageModel(
                  title: GlobalTexts.current.LANDING_PAGE_landing4Title,
                  description:
                      GlobalTexts.current.LANDING_PAGE_landing4Description,
                  imageUrl: 'lib/assets/images/landing4.png',
                  bgColor: Colors.white,
                  textColor: Colors.redAccent,
                ),
              ]),
        );
      },
    );
  }
}

class LandingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  LandingPageModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white});
}
