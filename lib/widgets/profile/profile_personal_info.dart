import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/pages/profile/edit_personal_info_page.dart';
import 'package:ytnkio/widgets/profile/contact_info_item.dart';
import 'package:ytnkio/widgets/profile/profile_section.dart';

class ProfilePersonalInfo extends StatelessWidget {
  const ProfilePersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.firstName != current.profile.firstName ||
            previous.profile.lastName != current.profile.lastName ||
            previous.profile.emails != current.profile.emails ||
            previous.profile.phones != current.profile.phones ||
            previous.profile.socialAccounts != current.profile.socialAccounts ||
            previous.profile.websites != current.profile.websites ||
            previous.profile.location != current.profile.location;
      },
      builder: (context, state) {
        return ProfileSection(
            isProcessing: state.isProcessing,
            cardTitle: "${state.profile.firstName} ${state.profile.lastName}",
            body: Column(
              children: [
                ContactInfoItem(
                  type: 'Location',
                  url: "",
                  text: state.profile.location.toString(),
                ),
                for (int i = 0; i < state.profile.phones.length; i++)
                  ContactInfoItem(
                    type: 'Phone',
                    text:
                        '+${state.profile.phones[i].countrySuffix} ${state.profile.phones[i].number}',
                    url: "",
                  ),
                for (int i = 0; i < state.profile.emails.length; i++)
                  ContactInfoItem(
                    type: 'Email',
                    text: state.profile.emails[i],
                    url: "",
                  ),
                for (int i = 0; i < state.profile.socialAccounts.length; i++)
                  ContactInfoItem(
                    type: state.profile.socialAccounts[i].accountType,
                    url: state.profile.socialAccounts[i].url,
                    text: state.profile.socialAccounts[i].userName,
                  ),
                SizedBox(height: 10),
              ],
            ),
            onEditCallback: () {
              context.push(EditPersonalInfoPage.id);
            });
      },
    );
  }
}
