import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';

class ContactInfoItem extends StatelessWidget {
  final String type;
  final String text;
  final String url;

  const ContactInfoItem({
    super.key,
    required this.type,
    required this.text,
    required this.url,
  });

  IconData _getIcon() {
    switch (type.toLowerCase()) {
      case 'email':
        return GlobalIcons.GENERAL_emailIcon;
      case 'location':
        return GlobalIcons.GENERAL_locationIcon;
      case 'phone':
        return GlobalIcons.GENERAL_phoneIcon;
      case 'website':
        return GlobalIcons.GENERAL_websiteIcon;
      case 'linkedin':
        return GlobalIcons.CONTACTINFO_ITEM_linkedinIcon;
      case 'github':
        return GlobalIcons.CONTACTINFO_ITEM_githubIcon;
      case 'x':
        return GlobalIcons.CONTACTINFO_ITEM_xIcon;
      case 'facebook':
        return GlobalIcons.CONTACTINFO_ITEM_facebookIcon;
      case 'instagram':
        return GlobalIcons.CONTACTINFO_ITEM_instagramIcon;
      default:
        return GlobalIcons.CONTACTINFO_ITEM_defaultIcon;
    }
  }

  Future<void> _launchUrl() async {
    if (url.isEmpty) {
      return;
    }

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      EasyLoading.showInfo(
          "${GlobalTexts.current.CONTACTINFO_ITEM_couldNotLaunch}$url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.indigo.shade100),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(_getIcon(), color: Colors.indigo),
            const SizedBox(width: 8),
            Expanded(
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
