import 'linkedin_language_info.dart';
import 'linkedin_pdf_section.dart';

class LinkedinLanguagesPdfSection extends LinkedinPdfSection {
  List<LinkedinLanguageInfo>? languages = List.empty(growable: true);

  LinkedinLanguagesPdfSection.empty();

  LinkedinLanguagesPdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    if (lines.length < 2) return;

    var language = "";
    var degree = "";

    for (var i = 1; i < lines.length; i++) {
      if (!lines[i].text.contains("(")) {
        language = lines[i].text;
        degree = "";
      } else {
        language =
            lines[i].text.substring(0, lines[i].text.indexOf("(")).trim();

        degree = lines[i].text.substring(
            lines[i].text.indexOf("(") + 1, lines[i].text.indexOf(")"));
      }

      languages?.add(LinkedinLanguageInfo(language, degree));
    }
  }

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n${languages?.join("\n")}";
  }
}
