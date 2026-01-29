import 'linkedin_pdf_section.dart';

class LinkedinBasicInfoPdfSection extends LinkedinPdfSection {
  String fullname = "";
  String headline = "";
  String location = "";

  @override
  get title => "Basic Info";

  LinkedinBasicInfoPdfSection.empty();

  LinkedinBasicInfoPdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    StringBuffer tmpHeadline = StringBuffer();

    for (var i = 0; i < lines.length; i++) {
      if (i == 0) {
        fullname = lines[i].text;
      } else if (i == lines.length - 1) {
        location = lines[i].text;
      } else {
        tmpHeadline.write("${lines[i].text} ");
      }
    }

    headline = tmpHeadline.toString();
  }

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n$fullname\n$headline\n$location";
  }
}
