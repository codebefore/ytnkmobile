import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/globals/helpers.dart';
import 'package:ytnkio/widgets/preferences/prefs_question_text.dart';

class PrefsSalaryExpectationQuestion extends StatelessWidget {
  const PrefsSalaryExpectationQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalBloc>().state;

    final expectedSalaryController = TextEditingController(
        text: state.profile.preferences.salaryExpectation);

    final currentSalaryController =
        TextEditingController(text: state.profile.preferences.salaryCurrent);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrefsQuestionText(
            text:
                GlobalTexts.current.PREFERENCES_PAGE_salaryExpectationQuestion),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              child: SizedBox(
                width: 80,
                child: DropdownButton(
                    itemHeight:
                        null, //dropdown menu item height fills the content
                    isExpanded: true,
                    value: state.profile.preferences.salaryCurrentCurrency,
                    items: const [
                      DropdownMenuItem(
                        value: "",
                        child: Text(""),
                      ),
                      DropdownMenuItem(
                        value: "usd",
                        child: Text("USD"),
                      ),
                      DropdownMenuItem(
                        value: "try",
                        child: Text("TRY"),
                      ),
                      DropdownMenuItem(
                        value: "eur",
                        child: Text("EUR"),
                      ),
                      DropdownMenuItem(
                        value: "gbp",
                        child: Text("GBP"),
                      ),
                      DropdownMenuItem(
                        value: "cad",
                        child: Text("CAD"),
                      ),
                    ],
                    onChanged: (value) {
                      context.read<GlobalBloc>().add(UpdatePreferencesEvent(
                            preferences: state.profile.preferences
                                .copyWith(salaryCurrentCurrency: value),
                          ));
                    }),
              ),
            ),
            const Expanded(child: Text("")),
            Flexible(
              flex: 6,
              child: TextField(
                textAlign: TextAlign.right,
                inputFormatters: [
                  ThousandsFormatter(),
                ],
                keyboardType: TextInputType.number,
                controller: currentSalaryController,
                decoration: InputDecoration(
                  hintText:
                      GlobalTexts.current.PREFERENCES_PAGE_currentSalaryHint,
                ),
                onSubmitted: (value) {
                  submit(context, state, currentSalaryController.text,
                      expectedSalaryController.text);
                },
                onTapOutside: (event) {
                  submit(context, state, currentSalaryController.text,
                      expectedSalaryController.text);
                },
                onEditingComplete: () {
                  submit(context, state, currentSalaryController.text,
                      expectedSalaryController.text);
                },
              ),
            ),
          ],
        ),
        Row(mainAxisSize: MainAxisSize.max, children: [
          Flexible(
            flex: 2,
            child: SizedBox(
              width: 80,
              child: Text(""),
            ),
          ),
          const Expanded(child: Text("")),
          Flexible(
            flex: 6,
            child: TextField(
              textAlign: TextAlign.right,
              inputFormatters: [
                ThousandsFormatter(),
              ],
              keyboardType: TextInputType.number,
              controller: expectedSalaryController,
              decoration: InputDecoration(
                hintText:
                    GlobalTexts.current.PREFERENCES_PAGE_salaryExpectationHint,
              ),
              onSubmitted: (value) {
                submit(context, state, currentSalaryController.text,
                    expectedSalaryController.text);
              },
              onTapOutside: (event) {
                submit(context, state, currentSalaryController.text,
                    expectedSalaryController.text);
              },
              onEditingComplete: () {
                submit(context, state, currentSalaryController.text,
                    expectedSalaryController.text);
              },
            ),
          ),
        ]),
      ],
    );
  }

  void submit(BuildContext context, GlobalState state, String current,
      String expected) {
    var currentValue =
        int.tryParse(current.replaceAll(',', '').replaceAll('.', '')) ?? 0;
    var expectedValue =
        int.tryParse(expected.replaceAll(',', '').replaceAll('.', '')) ?? 0;

    context.read<GlobalBloc>().add(UpdatePreferencesEvent(
          preferences: state.profile.preferences.copyWith(
              salaryCurrent: currentValue.toString(),
              salaryExpectation: expectedValue.toString()),
        ));

    FocusScope.of(context).unfocus();
  }
}
