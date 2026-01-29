import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/profile/edit_avatar_page.dart';
import 'package:ytnkio/pages/profile/edit_headline_page.dart';
import 'package:ytnkio/widgets/common/avatar.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.firstName != current.profile.firstName ||
            previous.profile.avatarId != current.profile.avatarId ||
            previous.profile.headline != current.profile.headline;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: TapRegion(
                    onTapInside: (event) {
                      context.push(EditAvatarPage.id);
                    },
                    child: Avatar(profileId: state.profile.id)),
              ),
              Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${state.profile.firstName} ${state.profile.lastName}\n${state.profile.emails.isNotEmpty ? state.profile.emails[0] : ""}"),
                    const SizedBox(height: 10),
                    TapRegion(
                      onTapInside: (event) => context.push(EditHeadlinePage.id),
                      child: Text(
                        state.profile.headline.isEmpty
                            ? GlobalTexts.current.VIEWPROFILE_PAGE_emptyHeadline
                            : state.profile.headline,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.deepPurple,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
