import 'dart:io';

import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_basic_info_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_certifications_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_education_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_experience_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_languages_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_pdf_resume.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_summary_pdf_section.dart';

import '../../models/linkedinpdf/linkedin_contacts_pdf_section.dart';
import '../../models/linkedinpdf/linkedin_top_skills_pdf_section.dart';

class LinkedInPdfResumeParserService {
  Future<String> parsePdfRawText({required String filePath}) async {
    final lines = await _extractPdfTextLines(filePath);

    StringBuffer text = StringBuffer("");

    for (var element in lines) {
      text.writeln("${element.text} ${element.fontSize}");
    }

    return text.toString();
  }

  Future<LinkedinPdfResume> parsePdfResume({required String filePath}) async {
    final lines = await _extractPdfTextLines(filePath);
    final rawSections = await _extractPdfSections(lines);

    return await _createPdfResume(rawSections);
  }

  Future<List<TextLine>> _extractPdfTextLines(String filePath) async {
    final PdfDocument document =
        PdfDocument(inputBytes: File(filePath).readAsBytesSync());

    final lines = PdfTextExtractor(document).extractTextLines();

    document.dispose();

    return lines;
  }

  Future<List<LinkedinPdfSection>> _extractPdfSections(
      List<TextLine> lines) async {
    TextLine line;
    LinkedinPdfSection section = LinkedinPdfSection();

    List<LinkedinPdfSection> sections = List.empty(growable: true);

    for (var i = 0; i < lines.length; i++) {
      line = lines[i];

      if (line.fontSize > 12) {
        section = LinkedinPdfSection();

        sections.add(section);
      }

      section.lines.add(line);
    }

    return sections;
  }

  Future<LinkedinPdfResume> _createPdfResume(
      List<LinkedinPdfSection> sections) async {
    final resume = LinkedinPdfResume();

    LinkedinPdfSection section;

    for (var i = 0; i < sections.length; i++) {
      section = sections[i];

      switch (section.title) {
        case "Contact":
        case "İletişim Bilgileri":
          resume.contacts = LinkedinContactsPdfSection(section);
          break;
        case "Top Skills":
        case "En Önemli Yetenekler":
          resume.topSkills = LinkedinTopSkillsPdfSection(section);
          break;
        case "Languages":
          resume.languages = LinkedinLanguagesPdfSection(section);
          break;
        case "Certifications":
          resume.certifications = LinkedinCertificationsPdfSection(section);
          break;
        case "Summary":
        case "Özet":
          resume.summary = LinkedinSummaryPdfSection(section);
          break;
        case "Experience":
        case "Deneyim":
          resume.experiences = LinkedinExperiencePdfSection(section);
          break;
        case "Education":
        case "Eğitim":
          resume.educations = LinkedinEducationPdfSection(section);
          break;
        default:
          if (section.lines[0].fontSize == 26) {
            resume.basicInfo = LinkedinBasicInfoPdfSection(section);
          }
      }
    }

    return resume;
  }
}
