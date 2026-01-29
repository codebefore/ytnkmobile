import 'linkedin_pdf_section.dart';

class LinkedinSummaryPdfSection extends LinkedinPdfSection {
  String summary = "";

  LinkedinSummaryPdfSection.empty();

  LinkedinSummaryPdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    if (lines.length < 2) return;

    StringBuffer tmpSummary = StringBuffer();

    for (var i = 1; i < lines.length; i++) {
      tmpSummary.write("${lines[i].text} ");
    }

    summary = tmpSummary.toString();
  }

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n$summary";
  }
}
