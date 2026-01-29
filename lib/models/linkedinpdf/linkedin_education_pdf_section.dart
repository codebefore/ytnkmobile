import 'package:ytnkio/models/linkedinpdf/linkedin_education_detail_info.dart';

import 'linkedin_education_date_info.dart';
import 'linkedin_education_info.dart';
import 'linkedin_pdf_section.dart';

class LinkedinEducationPdfSection extends LinkedinPdfSection {
  List<LinkedinEducationInfo>? educations = List.empty(growable: true);

  LinkedinEducationPdfSection.empty();

  LinkedinEducationPdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    if (lines.length < 2) return;

    var organisation = "";

    var n = 0;

    var educationDetailText = "";

    for (var i = 1; i < lines.length; i++) {
      //lines starts with Page indicates page count and we omit this
      if (lines[i].fontSize < 10.5) continue;

      if (n == 0) {
        if (lines[i].fontSize != 12.0) continue;

        organisation = lines[i].text;
        educationDetailText = "";
      } else {
        if (lines[i].fontSize == 10.5) {
          educationDetailText += lines[i].text;
        } else if (lines[i].fontSize == 12) {
          var details = _parseEducationDetails(educationDetailText);

          educations?.add(LinkedinEducationInfo(
              organisation,
              details.degree,
              details.field,
              details.date.startYear,
              details.date.endYear,
              details.date.isOngoing));

          n = 1;

          educationDetailText = "";
          organisation = lines[i].text;
        }
      }

      n++;
    }
    var details = _parseEducationDetails(educationDetailText);

    educations?.add(LinkedinEducationInfo(
        organisation,
        details.degree,
        details.field,
        details.date.startYear,
        details.date.endYear,
        details.date.isOngoing));
  }

  LinkedEducationDetailInfo _parseEducationDetails(String educationDetailText) {
    var educationDetail = LinkedEducationDetailInfo(
        "", "", LinkedinEducationDateInfo("", "", false));

    if (educationDetailText.contains("·")) {
      var tokens = educationDetailText.split("·");

      educationDetail.date = _parseDates(tokens[1]);

      if (tokens[0].contains(",")) {
        var subTokens = tokens[0].split(",");

        educationDetail.degree = subTokens[0].trim();
        educationDetail.field = subTokens[1].trim();
      } else {
        educationDetail.degree = tokens[0].trim();
        educationDetail.field = "";
      }
    } else {
      return educationDetail;
    }

    return educationDetail;
  }

  LinkedinEducationDateInfo _parseDates(String text) {
    text = text.replaceAll("(", "").replaceAll(")", "").trim();

    if (text.length == 4) {
      return LinkedinEducationDateInfo(text, "", true);
    }

    var tokens = text.split("-");

    return LinkedinEducationDateInfo(tokens[0].trim(), tokens[1].trim(), false);
  }

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n${educations?.join("\n")}";
  }
}
