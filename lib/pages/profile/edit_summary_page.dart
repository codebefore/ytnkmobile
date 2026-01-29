import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';

class EditSummaryPage extends StatefulWidget {
  static const id = "/pages/profile/edit_summary_page";

  const EditSummaryPage({super.key});

  @override
  State<EditSummaryPage> createState() => _EditSummaryPageState();
}

class _EditSummaryPageState extends State<EditSummaryPage> {
  var summaryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    summaryController.text = context.read<GlobalBloc>().state.profile.summary;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.EDITSUMMARY_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.isFailure) {
              EasyLoading.showError(state.infoMessage);
            } else {
              Navigator.of(context).pop();
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(GlobalTexts.current.EDITSUMMARY_PAGE_summary),
                TextFormField(
                  controller: summaryController,
                  maxLength: 500,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: GlobalTexts.current.EDITSUMMARY_PAGE_summaryHint,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DefaultElevatedButton(
                      icon: GlobalIcons.GENERAL_saveIcon,
                      onPressed: () {
                        context.read<GlobalBloc>().add(
                              UpdateSummaryEvent(
                                state.profile.id,
                                summaryController.text,
                              ),
                            );
                      },
                      isProcessing: state.isProcessing,
                      label: GlobalTexts.current.EDITSUMMARY_PAGE_save),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
