import 'linkedin_experience_date_info.dart';
import 'linkedin_experience_info.dart';
import 'linkedin_pdf_section.dart';

class LinkedinExperiencePdfSection extends LinkedinPdfSection {
  List<LinkedinExperienceInfo>? experiences = List.empty(growable: true);

  LinkedinExperiencePdfSection.empty();

  LinkedinExperiencePdfSection(LinkedinPdfSection section) {
    lines = section.lines;

    if (lines.length < 2) return;

    var organisation = "";
    var position = "";
    var startYear = "";
    var startMonth = "";
    var endYear = "";
    var endMonth = "";
    var location = "";
    var onGoing = false;
    var description = "";

    var n = 0;

    StringBuffer tmpDescription = StringBuffer();
    LinkedinExperienceDateInfo dates;

    for (var i = 1; i < lines.length; i++) {
      //lines starts with Page indicates page count and we omit this
      if (lines[i].fontSize < 10.5) continue;

      if (n == 0) {
        if (lines[i].fontSize != 12.0) continue;

        organisation = lines[i].text;
      } else if (n == 1) {
        if (lines[i].fontSize != 11.5) continue;

        position = lines[i].text;
      } else if (n == 2) {
        if (lines[i].fontSize != 10.5) continue;

        dates = _parseDates(lines[i].text);

        startYear = dates.startYear;
        startMonth = dates.startMonth;
        endYear = dates.endYear;
        endMonth = dates.endMonth;
        onGoing = dates.isOngoing;
      } else if (n == 3) {
        //location is optional so we can omit
        if (lines[i].fontSize != 10.5) {
          n++;
          continue;
        }

        //we could not seperate omitted location and description, 25 is not meaningful length value
        if (lines[i].text.length > 25) {
          tmpDescription.write(lines[i].text);
          n++;

          continue;
        } else {
          location = lines[i].text;
        }
      } else {
        if (lines[i].fontSize >= 12.0) {
          description = tmpDescription.toString();
          tmpDescription.clear();

          experiences?.add(LinkedinExperienceInfo(
              organisation,
              position,
              startYear,
              startMonth,
              endYear,
              endMonth,
              location,
              onGoing,
              description));

          if (lines[i].fontSize == 12.0) {
            organisation = lines[i].text;

            n = 1;
            continue;
          } else {
            break;
          }
        } else {
          tmpDescription.write("${lines[i].text} ");
        }
      }

      n++;
    }

    description = tmpDescription.toString();
    experiences?.add(LinkedinExperienceInfo(organisation, position, startYear,
        startMonth, endYear, endMonth, location, onGoing, description));
  }

  LinkedinExperienceDateInfo _parseDates(String text) {
    var tokens = text.split("-");
    var subTokensA = tokens[0].split(" ");
    var subTokensB = tokens[1].split(" ");

    var isOngoing = false;

    if (subTokensB[0].trim().startsWith("Present")) {
      isOngoing = true;

      return LinkedinExperienceDateInfo(
          subTokensA[1].trim(), subTokensA[0].trim(), "", "", isOngoing);
    }

    return LinkedinExperienceDateInfo(
        subTokensA[1].trim(),
        subTokensA[0].trim(),
        subTokensB[1].trim(),
        subTokensB[0].trim(),
        isOngoing);
  }

  @override
  String toString() {
    if (lines.isEmpty) return title;

    return "$title\n${experiences?.join("\n")}";
  }
}
