import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/common/item.dart';
import 'package:ytnkio/services/common/fuzzy_search_service.dart';
import 'package:ytnkio/widgets/preferences/chip_selection_sheet.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';
import 'package:ytnkio/widgets/preferences/prefs_question_text.dart';

class PrefsWantedCountryQuestion extends StatelessWidget {
  const PrefsWantedCountryQuestion({super.key});

  Future<List<Item>> _fetchChips(String filter) async {
    return FuzzySearchService().searchWithItem("countries", filter);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalBloc, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrefsQuestionText(
              text: GlobalTexts.current.PREFERENCES_PAGE_wantedCountryQuestion),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 8.0, // gap
            children: [
              ...state.profile.preferences.wantedCountries.map
                  // Display selected sectors
                  ((country) => Chip(
                        label: Text(country.text),
                        onDeleted: () {
                          context.read<GlobalBloc>().add(UpdatePreferencesEvent(
                                preferences: state.profile.preferences.copyWith(
                                  wantedCountries: state
                                      .profile.preferences.wantedCountries
                                      .where((element) => element != country)
                                      .toList(),
                                ),
                              ));
                        },
                      )),
              DefaultTextButton(
                icon: GlobalIcons.GENERAL_addIcon,
                label: "Add Country",
                isProcessing: state.isProcessing,
                onPressed: () {
                  showModalBottomSheet<List<Item>>(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => ChipSelectionSheet(
                        fetchChips: _fetchChips,
                        maxSelectionCount: 5 -
                            state.profile.preferences.wantedCountries.length),
                  ).then((value) => {
                        if (value != null)
                          {
                            if (context.mounted)
                              {
                                context
                                    .read<GlobalBloc>()
                                    .add(UpdatePreferencesEvent(
                                      preferences:
                                          state.profile.preferences.copyWith(
                                        wantedCountries: <Item>{
                                          ...state.profile.preferences
                                              .wantedCountries,
                                          ...value.map((e) => e),
                                        }.toList(),
                                      ),
                                    ))
                              }
                          }
                      });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
