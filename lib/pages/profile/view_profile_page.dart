import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/divider_with_text.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/widgets/profile/get_from_linkedin_button.dart';
import 'package:ytnkio/widgets/profile/profile_certificates.dart';
import 'package:ytnkio/widgets/profile/profile_educations.dart';
import 'package:ytnkio/widgets/profile/profile_floating_menu_button.dart';
import 'package:ytnkio/widgets/profile/profile_header.dart';
import 'package:ytnkio/widgets/profile/profile_personal_info.dart';
import 'package:ytnkio/widgets/profile/profile_skills.dart';
import 'package:ytnkio/widgets/profile/profile_summary.dart';
import 'package:ytnkio/widgets/profile/profile_work_experiences.dart';

class ViewProfilePage extends StatelessWidget {
  static const id = "/pages/profile/view_profile_page";

  const ViewProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: GlobalTexts.current.VIEWPROFILE_PAGE_title,
      floatingActionButton: const ProfileFloatingMenuButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            switch (state.lastOperation) {
              case Operations.saveProfile:
                state.isSuccessful
                    ? EasyLoading.showSuccess(GlobalTexts.current.VIEWPROFILE_PAGE_profileSavedSuccessfully,
                        duration: const Duration(seconds: 2))
                    : EasyLoading.showError(state.infoMessage);

                break;
              case Operations.fillProfileFromResume:
                state.isSuccessful
                    ? EasyLoading.showSuccess(
                        GlobalTexts.current.VIEWPROFILE_PAGE_profileFetchedSuccessfullyFromResume,
                        duration: const Duration(seconds: 2))
                    : EasyLoading.showError(state.infoMessage);

                break;
              case Operations.editProfileAvatar:
                state.isSuccessful
                    ? EasyLoading.showSuccess(GlobalTexts.current.VIEWPROFILE_PAGE_avatarSavedSuccessfully,
                        duration: const Duration(seconds: 2))
                    : EasyLoading.showError(state.infoMessage);

                break;
              default:
            }
          }
        },
        builder: (context, state) => Column(
          children: [
            state.isProfileDirty
                ? Card.filled(
                    color: Colors.red,
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        GlobalTexts.current.VIEWPROFILE_PAGE_profileDirty,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: ListView(
                children: [
                  const ProfileHeader(),
                  const GetProfileFromLinkedinResumeButton(),
                  DividerWithText(
                      text: GlobalTexts.current.VIEWPROFILE_PAGE_fillManually),
                  const ProfilePersonalInfo(),
                  const ProfileSummary(),
                  const ProfileWorkExperiences(),
                  const ProfileEducations(),
                  const ProfileCertificates(),
                  const ProfileSkills(),
                  SizedBox.fromSize(size: const Size.fromHeight(10)),
                  DefaultElevatedButton(
                    isProcessing: state.isProcessing,
                    icon: GlobalIcons.GENERAL_saveIcon,
                    label: GlobalTexts.current.VIEWPROFILE_PAGE_saveProfileText,
                    onPressed: () {
                      context.read<GlobalBloc>().add(
                            SaveFullProfileEvent(state.profile),
                          );
                    },
                  ),
                  SizedBox.fromSize(size: const Size.fromHeight(20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
