import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/profile/edit_education_page.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';
import 'package:ytnkio/widgets/profile/education_card.dart';
import 'package:ytnkio/widgets/profile/profile_section.dart';

class ProfileEducations extends StatelessWidget {
  const ProfileEducations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.educations != current.profile.educations ||
            previous.isProcessing != current.isProcessing;
      },
      builder: (context, state) => ProfileSection(
        isProcessing: state.isProcessing,
        cardTitle: GlobalTexts.current.VIEWPROFILE_PAGE_educations,
        body: Column(
          children: [
            for (int i = 0; i < state.profile.educations.length; i++)
              EducationCard(
                  education: state.profile.educations[i],
                  isLast: state.profile.educations.length - 1 == i),
            DefaultTextButton(
                icon: GlobalIcons.GENERAL_addIcon,
                label: GlobalTexts.current.VIEWPROFILE_PAGE_addEducation,
                isProcessing: state.isProcessing,
                onPressed: () {
                  context.push(EditEducationPage.id);
                }),
          ],
        ),
      ),
    );
  }
}
