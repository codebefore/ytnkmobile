import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/profile/edit_summary_page.dart';
import 'package:ytnkio/widgets/common/expandable_text.dart';
import 'package:ytnkio/widgets/profile/profile_section.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.summary != current.profile.summary ||
            previous.isProcessing != current.isProcessing;
      },
      builder: (context, state) {
        return ProfileSection(
            isProcessing: state.isProcessing,
            cardTitle: GlobalTexts.current.VIEWPROFILE_PAGE_summary,
            body: ExpandableText(
              text: state.profile.summary.isEmpty
                  ? GlobalTexts.current.VIEWPROFILE_PAGE_emptySummary
                  : state.profile.summary,
              maxLines: 8,
              fontSize: 14,
              expandFontSize: 14,
            ),
            onEditCallback: () {
              context.push(EditSummaryPage.id);
            });
      },
    );
  }
}
