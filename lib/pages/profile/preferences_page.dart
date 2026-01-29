import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/preferences/prefs_company_size_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_company_type_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_how_urgent_your_hiring_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_legal_country_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_salary_expectation_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_sector_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_seniority_level_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_types_of_positions_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_wanted_country_question.dart';
import 'package:ytnkio/widgets/preferences/prefs_working_method_question.dart';

class PreferencesPage extends StatefulWidget {
  static const id = "/pages/profile/preferences_page";

  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => PreferencesPageState();
}

class PreferencesPageState extends State<PreferencesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.PREFERENCES_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            switch (state.lastOperation) {
              case Operations.savePreferences:
                state.isSuccessful
                    ? EasyLoading.showSuccess("Preferences saved successfully",
                        duration: const Duration(seconds: 2))
                    : EasyLoading.showError(state.infoMessage);

                break;
              default:
                break;
            }
          }
        },
        builder: (context, state) => Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            state.isPreferencesDirty
                ? Card.filled(
                    color: Colors.red,
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        GlobalTexts.current.VIEWPROFILE_PAGE_preferencesDirty,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Expanded(
                child: ListView(
              children: [
                const SizedBox(height: 10),
                const PrefsCompanySizeQuestion(),
                const SizedBox(height: 10),
                const PrefsCompanyTypeQuestion(),
                const SizedBox(height: 10),
                const PrefsSectorQuestion(),
                const SizedBox(height: 10),
                const PrefsTypesOfPositionsQuestion(),
                const SizedBox(height: 10),
                const PrefsHowUrgentYourHiringQuestion(),
                const SizedBox(height: 10),
                const PrefsSeniorityLevelQuestion(),
                const SizedBox(height: 10),
                const PrefsSalaryExpectationQuestion(),
                const SizedBox(height: 10),
                const PrefsLegalCountryQuestion(),
                const SizedBox(height: 10),
                const PrefsWantedCountryQuestion(),
                const SizedBox(height: 10),
                const PrefsWorkingMethodQuestion(),
                const SizedBox(height: 10),
              ],
            )),
            Center(
              child: ElevatedButton.icon(
                  icon: const Icon(GlobalIcons.GENERAL_saveIcon),
                  onPressed: () {
                    context.read<GlobalBloc>().add(
                          SavePreferencesEvent(
                              profileId: state.profile.id,
                              preferences: state.profile.preferences),
                        );
                  },
                  style: const ButtonStyle(
                    textStyle: WidgetStatePropertyAll(
                        TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  label: const Text("Save Preferences")),
            ),
          ],
        ),
      ),
    );
  }
}
