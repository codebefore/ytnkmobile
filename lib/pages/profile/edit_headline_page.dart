import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';

class EditHeadlinePage extends StatefulWidget {
  static const id = "/pages/profile/edit_headline_page";

  const EditHeadlinePage({super.key});

  @override
  State<EditHeadlinePage> createState() => _EditHeadlinePageState();
}

class _EditHeadlinePageState extends State<EditHeadlinePage> {
  var headlineController = TextEditingController();

  @override
  void initState() {
    super.initState();

    headlineController.text = context.read<GlobalBloc>().state.profile.headline;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.EDITHEADLINE_PAGE_title,
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
                Text(GlobalTexts.current.EDITHEADLINE_PAGE_headline),
                TextFormField(
                  controller: headlineController,
                  maxLength: 100,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText:
                        GlobalTexts.current.EDITHEADLINE_PAGE_headlineHint,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DefaultElevatedButton(
                      isProcessing: state.isProcessing,
                      icon: GlobalIcons.GENERAL_saveIcon,
                      onPressed: () {
                        context.read<GlobalBloc>().add(
                              UpdateHeadlineEvent(
                                state.profile.id,
                                headlineController.text,
                              ),
                            );
                      },
                      label: GlobalTexts.current.EDITHEADLINE_PAGE_save),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
