import "package:flutter_easyloading/flutter_easyloading.dart";
import "package:ytnkio/blocs/global/global_bloc.dart";
import "package:ytnkio/core_module.dart";
import "package:ytnkio/globals/global_texts.dart";

class SettingsPage extends StatelessWidget {
  static const id = "/pages/survey/settings_page";

  const SettingsPage({super.key});

  Future<void> changeLanguage(
      BuildContext context, String profileId, String languageCode) async {
    context.read<GlobalBloc>().add(
        ChangeLanguageEvent(profileId: profileId, languageCode: languageCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: GlobalTexts.current.SETTINGS_PAGE_title,
      ),
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            switch (state.lastOperation) {
              case Operations.changeLanguage:
                if (state.isSuccessful) {
                  GlobalTexts.changeLanguage(state.profile.languageCode);

                  EasyLoading.showSuccess(
                      GlobalTexts.current.SETTINGS_PAGE_languageChanged,
                      duration: const Duration(seconds: 2));

                  Navigator.of(context).pop();
                } else {
                  EasyLoading.showError(state.infoMessage.isNotEmpty
                      ? state.infoMessage
                      : GlobalTexts.current.SETTINGS_PAGE_languageChangeFailed);
                }
                break;
              default:
                break;
            }
          }
        },
        buildWhen: (previous, current) {
          return current.lastOperation == Operations.changeLanguage;
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  GlobalTexts.current.SETTINGS_PAGE_language,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                // English language with US flag
                ListTile(
                  leading: const Text('🇺🇸', style: TextStyle(fontSize: 32)),
                  title: const Text('English'),
                  onTap: () async =>
                      changeLanguage(context, state.profile.id, 'en'),
                ),
                // Turkish language with Turkish flag
                ListTile(
                  leading: const Text('🇪🇸', style: TextStyle(fontSize: 32)),
                  title: const Text('Español'),
                  onTap: () async =>
                      changeLanguage(context, state.profile.id, 'es'),
                ),
                ListTile(
                  leading: const Text('🇹🇷', style: TextStyle(fontSize: 32)),
                  title: const Text('Türkçe'),
                  onTap: () async =>
                      changeLanguage(context, state.profile.id, 'tr'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
