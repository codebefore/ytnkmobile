import 'linkedin_pdf_section.dart';

class LinkedinTopSkillsPdfSection extends LinkedinPdfSection {
  List<String>? skills = List.empty(growable: true);

  LinkedinTopSkillsPdfSection.empty();

  LinkedinTopSkillsPdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    if (lines.length < 2) return;

    for (var i = 1; i < lines.length; i++) {
      skills?.add(lines[i].text);
    }
  }

  LinkedinTopSkillsPdfSection.fromList(List<String> this.skills);

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n${skills?.join(",")}";
  }
}
