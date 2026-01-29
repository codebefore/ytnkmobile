import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/profile/parse_pdf_page.dart';

class GetProfileFromLinkedinResumeButton extends StatelessWidget {
  const GetProfileFromLinkedinResumeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlinedButton.icon(
        label: Text(GlobalTexts.current.VIEWPROFILE_PAGE_importFromLinkedin),
        icon: SizedBox(
          width: 32,
          child: Image.asset(
            "lib/assets/images/linkedin_logo.png",
          ),
        ),
        onPressed: () {
          context.push(ParsePdfPage.id);
        },
      ),
    );
  }
}
