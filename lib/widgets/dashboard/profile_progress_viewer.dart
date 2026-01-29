import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/profile/profile_activity_short_definition.dart';
import 'package:ytnkio/widgets/dashboard/progress_definition.dart';
import 'package:ytnkio/widgets/dashboard/progress_viewer.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/pages/profile/view_profile_page.dart';

class ProfileProgressViewer extends StatelessWidget {
  const ProfileProgressViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Card(
          surfaceTintColor: Colors.white,
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProgressViewer(
                      percent: state.profile.completeness / 100.0,
                      level: state.profile.activityLevel),
                  Expanded(
                    child: ProfileActivityShortDefinition(
                        profileName:
                            "${state.profile.firstName} ${state.profile.lastName}",
                        lastActivityDate: DateTime.now(),
                        activityDefinition: "Immediate Joiner"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ProgressDefinition(
                  percent: state.profile.completeness / 100.0,
                  level: state.profile.activityLevel),
              //const ProfileImprovementHelper(),
              SizedBox(
                height: 10,
              ),
              Center(
                child: DefaultElevatedButton(
                  isProcessing: state.isProcessing,
                  icon: Icons.person_pin_rounded,
                  label: GlobalTexts.current.DASHBOARD_PAGE_updateProfile,
                  onPressed: () {
                    context.push(ViewProfilePage.id);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
