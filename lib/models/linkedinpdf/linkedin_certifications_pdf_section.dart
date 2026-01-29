import 'linkedin_pdf_section.dart';

class LinkedinCertificationsPdfSection extends LinkedinPdfSection {
  List<String>? certificates = List.empty(growable: true);

  LinkedinCertificationsPdfSection.empty();

  LinkedinCertificationsPdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    if (lines.length < 2) return;

    for (var i = 1; i < lines.length; i++) {
      certificates?.add(lines[i].text);
    }
  }

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n${certificates?.join(",")}";
  }
}
