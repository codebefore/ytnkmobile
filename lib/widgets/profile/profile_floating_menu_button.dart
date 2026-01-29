import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/profile/edit_certificate_page.dart';
import 'package:ytnkio/pages/profile/edit_education_page.dart';
import 'package:ytnkio/pages/profile/edit_work_experience_page.dart';
import 'package:ytnkio/widgets/profile/profile_floating_menu_child.dart';

class ProfileFloatingMenuButton extends StatelessWidget {
  const ProfileFloatingMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: GlobalIcons.GENERAL_addIcon,
      label: Text(GlobalTexts.current.PROFILE_FLOATINGBUTTON_ADD),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      activeIcon: GlobalIcons.GENERAL_closeIcon,
      activeLabel: Text(GlobalTexts.current.PROFILE_FLOATINGBUTTON_CANCEL),
      activeBackgroundColor: Colors.white,
      activeForegroundColor: Colors.indigo,
      spacing: 20,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 6,
      renderOverlay: true,
      overlayColor: Colors.black,
      overlayOpacity: 0.6,
      childrenButtonSize: const Size(200, 56),
      children: [
        SpeedDialChild(
          child: ProfileFloatingMenuChild(
            icon: GlobalIcons.GENERAL_workExperienceIcon,
            text: GlobalTexts.current.PROFILE_FLOATINGBUTTON_WORKEXPERIENCE,
          ),
          onTap: () {
            context.push(EditWorkExperiencePage.id);
          },
        ),
        SpeedDialChild(
          child: ProfileFloatingMenuChild(
            icon: GlobalIcons.GENERAL_educationIcon,
            text: GlobalTexts.current.PROFILE_FLOATINGBUTTON_EDUCATION,
          ),
          onTap: () {
            context.push(EditEducationPage.id);
          },
        ),
        SpeedDialChild(
          child: ProfileFloatingMenuChild(
            icon: GlobalIcons.GENERAL_certificateIcon,
            text: GlobalTexts.current.PROFILE_FLOATINGBUTTON_CERTIFICATE,
          ),
          onTap: () {
            context.push(EditCertificatePage.id);
          },
        ),
      ],
    );
  }
}
