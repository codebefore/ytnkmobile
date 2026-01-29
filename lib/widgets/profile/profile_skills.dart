import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/common/item.dart';
import 'package:ytnkio/services/common/fuzzy_search_service.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';
import 'package:ytnkio/widgets/preferences/chip_selection_sheet.dart';
import 'package:ytnkio/widgets/profile/profile_section.dart';
import 'package:ytnkio/widgets/profile/skill_card.dart';

class ProfileSkills extends StatelessWidget {
  const ProfileSkills({super.key});

  Future<List<Item>> _fetchChips(String filter) async {
    var skills = await FuzzySearchService().searchWithItem("skills", filter);

    return skills.map((e) => Item(e.key, e.text)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.skills != current.profile.skills ||
            previous.isProcessing != current.isProcessing;
      },
      builder: (context, state) => ProfileSection(
        isProcessing: state.isProcessing,
        cardTitle: GlobalTexts.current.VIEWPROFILE_PAGE_skills,
        body: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          textDirection: TextDirection.ltr,
          crossAxisAlignment: WrapCrossAlignment.start,
          verticalDirection: VerticalDirection.down,
          spacing: 2.0, // gap between adjacent chips
          runSpacing: 2.0, // gap between lines
          children: [
            for (int i = 0; i < state.profile.skills.length; i++)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SkillCard(skill: state.profile.skills[i]),
              ),
            DefaultTextButton(
              icon: GlobalIcons.GENERAL_addIcon,
              label: GlobalTexts.current.VIEWPROFILE_PAGE_addSkill,
              isProcessing: state.isProcessing,
              onPressed: () {
                showModalBottomSheet<List<Item>>(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => ChipSelectionSheet(
                      fetchChips: _fetchChips,
                      maxSelectionCount: 20 - state.profile.skills.length),
                ).then((value) => {
                      if (value != null)
                        {
                          if (context.mounted)
                            {
                              context.read<GlobalBloc>().add(
                                    AddSkillsEvent(
                                      skills: value
                                          .map((e) => Item(e.key, e.text))
                                          .toList(),
                                    ),
                                  )
                            }
                        }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
