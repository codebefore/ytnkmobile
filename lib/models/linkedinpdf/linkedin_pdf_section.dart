import 'package:syncfusion_flutter_pdf/pdf.dart';

class LinkedinPdfSection {
  List<TextLine> lines = List.empty(growable: true);

  get title {
    return lines.isEmpty ? "" : lines[0].text;
  }

  LinkedinPdfSection();

  @override
  String toString() {
    if (lines.isEmpty) return "Empty Section";

    return "${lines[0].text} - ${lines.length} lines";
  }
}
