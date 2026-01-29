import 'package:ytnkio/models/linkedinpdf/linkedin_basic_info_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_certifications_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_contacts_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_education_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_experience_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_languages_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_summary_pdf_section.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_top_skills_pdf_section.dart';

class LinkedinPdfResume {
  LinkedinContactsPdfSection contacts = LinkedinContactsPdfSection.empty();
  LinkedinTopSkillsPdfSection topSkills = LinkedinTopSkillsPdfSection.empty();
  LinkedinLanguagesPdfSection languages = LinkedinLanguagesPdfSection.empty();
  LinkedinCertificationsPdfSection certifications =
      LinkedinCertificationsPdfSection.empty();
  LinkedinSummaryPdfSection summary = LinkedinSummaryPdfSection.empty();
  LinkedinExperiencePdfSection experiences =
      LinkedinExperiencePdfSection.empty();
  LinkedinEducationPdfSection educations = LinkedinEducationPdfSection.empty();
  LinkedinBasicInfoPdfSection basicInfo = LinkedinBasicInfoPdfSection.empty();

  @override
  String toString() {
    return "$basicInfo\n\n$summary\n\n$contacts\n\n$topSkills\n\n$languages\n\n$certifications\n\n$experiences\n\n$educations";
  }
}
