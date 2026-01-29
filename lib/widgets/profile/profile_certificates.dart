import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/profile/edit_certificate_page.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';
import 'package:ytnkio/widgets/profile/certificate_card.dart';
import 'package:ytnkio/widgets/profile/profile_section.dart';

class ProfileCertificates extends StatelessWidget {
  const ProfileCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.certificates != current.profile.certificates ||
            previous.isProcessing != current.isProcessing;
      },
      builder: (context, state) => ProfileSection(
        isProcessing: state.isProcessing,
        cardTitle: GlobalTexts.current.VIEWPROFILE_PAGE_certificates,
        body: Column(
          children: [
            for (int i = 0; i < state.profile.certificates.length; i++)
              CertificateCard(
                  certificate: state.profile.certificates[i],
                  isLast: state.profile.certificates.length - 1 == i),
            DefaultTextButton(
                icon: GlobalIcons.GENERAL_addIcon,
                label: GlobalTexts.current.VIEWPROFILE_PAGE_addCertificate,
                isProcessing: state.isProcessing,
                onPressed: () {
                  context.push(EditCertificatePage.id);
                }),
          ],
        ),
      ),
    );
  }
}
