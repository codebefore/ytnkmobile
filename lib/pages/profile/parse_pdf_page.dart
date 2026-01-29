import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/linkedinpdf/linkedin_pdf_resume.dart';
import 'package:ytnkio/services/profile/linkedin_pdf_resume_parser_service.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';

class ParsePdfPage extends StatefulWidget {
  const ParsePdfPage({super.key});

  static const id = "/pages/profile/parse_pdf_page";

  @override
  State<ParsePdfPage> createState() => _ParsePdfPageState();
}

class _ParsePdfPageState extends State<ParsePdfPage> {
  String pdfStructuredText = "";
  LinkedinPdfResume? resume;
  bool isParsing = false;

  Future<void> getPDFStructured() async {
    EasyLoading.show(status: "Showing PDFs");

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        isParsing = true;
      });

      Future.delayed(Duration.zero);

      EasyLoading.show(status: "Parsing PDF");

      final parsedResume = await LinkedInPdfResumeParserService()
          .parsePdfResume(filePath: result.files.first.path!);

      setState(() {
        isParsing = false;
        resume = parsedResume;
        pdfStructuredText = parsedResume.toString();
      });
    } else {
      setState(() {
        isParsing = false;
        pdfStructuredText = GlobalTexts.current.PARSEPDF_PAGE_noPdfSelected;
      });
    }

    EasyLoading.dismiss();
  }

  Future<void> fillProfileFromResume(BuildContext context) async {
    EasyLoading.show(
        status: GlobalTexts.current.PARSEPDF_PAGE_fillProfileFromPdf);

    context.read<GlobalBloc>().add(FillProfileFromResumeEvent(resume: resume!));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.PARSEPDF_PAGE_title,
      body: Center(
        child: ListView(children: [
          DefaultElevatedButton(
            onPressed: () async => getPDFStructured(),
            isProcessing: isParsing,
            icon: GlobalIcons.PARSEPDF_PAGE_selectPdfIcon,
            label: GlobalTexts.current.PARSEPDF_PAGE_selectPdf,
          ),
          resume == null
              ? const SizedBox(
                  height: 10,
                )
              : DefaultElevatedButton(
                  onPressed: () async => fillProfileFromResume(context),
                  isProcessing: isParsing,
                  icon: GlobalIcons.PARSEPDF_PAGE_fillProfileFromPdfIcon,
                  label: GlobalTexts.current.PARSEPDF_PAGE_fillProfileFromPdf),
          Text(
            pdfStructuredText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
