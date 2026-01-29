import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/profile/edit_work_experience_page.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';
import 'package:ytnkio/widgets/profile/profile_section.dart';
import 'package:ytnkio/widgets/profile/work_experience_card.dart';

class ProfileWorkExperiences extends StatelessWidget {
  const ProfileWorkExperiences({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.workExperiences !=
            current.profile.workExperiences;
      },
      builder: (context, state) => ProfileSection(
          isProcessing: state.isProcessing,
          cardTitle: GlobalTexts.current.VIEWPROFILE_PAGE_workExperiences,
          body: Column(
            children: [
              for (int i = 0; i < state.profile.workExperiences.length; i++)
                WorkExperienceCard(
                    experience: state.profile.workExperiences[i],
                    isLast: state.profile.workExperiences.length - 1 == i),
              DefaultTextButton(
                  icon: GlobalIcons.GENERAL_addIcon,
                  label: GlobalTexts.current.VIEWPROFILE_PAGE_addWorkExperience,
                  isProcessing: state.isProcessing,
                  onPressed: () {
                    context.push(EditWorkExperiencePage.id);
                  }),
            ],
          )),
    );
  }
}
