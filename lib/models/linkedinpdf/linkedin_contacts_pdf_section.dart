import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'linkedin_pdf_section.dart';

class LinkedinContactsPdfSection extends LinkedinPdfSection {
  String phone = "";
  String email = "";
  String linkedinUrl = "";
  List<String>? links = List.empty();

  LinkedinContactsPdfSection.empty();

  LinkedinContactsPdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    int searchBeginIndex = 0;
    String parsedEmail = "";
    String parsedPhone = "";

    if (_isPhone(lines[1])) {
      parsedPhone = lines[1].text;

      if (_isEmail(lines[2])) {
        (parsedEmail, searchBeginIndex) = _getEmail(lineIndex: 2);

        searchBeginIndex++;
      } else {
        searchBeginIndex = 2;
      }
    } else {
      if (_isEmail(lines[1])) {
        (parsedEmail, searchBeginIndex) = _getEmail(lineIndex: 1);

        searchBeginIndex++;
      } else {
        searchBeginIndex = 1;
      }
    }

    email = parsedEmail;
    phone = parsedPhone;

    if (searchBeginIndex > section.lines.length - 1) {
      return;
    }

    //concatenate all lines after phone or email line to search social links
    var text = StringBuffer();

    for (var i = searchBeginIndex; i < section.lines.length; i++) {
      text.write(section.lines[i].text);
    }

    //remove all whitespaces
    var sourceText = text.toString().replaceAll(" ", "");

    links = List.empty(growable: true);

    var socialLinks = sourceText.split(")");

    for (var i = 0; i < socialLinks.length; i++) {
      if (socialLinks[i].contains("LinkedIn")) {
        linkedinUrl = "${socialLinks[i]})";
      } else {
        if (socialLinks[i].isNotEmpty) {
          links?.add("${socialLinks[i]})");
        }
      }
    }
  }

  (String, int) _getEmail({required int lineIndex}) {
    if ((lineIndex + 1) < (lines.length - 1)) {
      //todo: 10 is meaningless heuristicially determined
      if (lines[lineIndex + 1].text.length < 10) {
        return (
          "${lines[lineIndex].text}${lines[lineIndex + 1].text}",
          lineIndex + 1
        );
      }
    }

    return (lines[lineIndex].text, lineIndex);
  }

  bool _isPhone(TextLine line) {
    return line.text.startsWith("+");
  }

  bool _isEmail(TextLine line) {
    return line.text.contains("@");
  }

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n$phone\n$email\n$linkedinUrl\n${links == null ? "" : links?.join("\n")}";
  }
}
