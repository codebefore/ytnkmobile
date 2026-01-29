import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';

class ExpandableText extends StatefulWidget {
  final int maxLines;
  final double fontSize;
  final double expandFontSize;
  final String text;

  const ExpandableText(
      {required this.text,
      required this.maxLines,
      super.key,
      required this.fontSize,
      required this.expandFontSize});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  bool hasTextOverflow(String text, TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (previous, current) {
        return previous.profile.summary != current.profile.summary;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.text,
              textAlign: TextAlign.justify,
              maxLines: isExpanded ? null : widget.maxLines,
              style: TextStyle(
                overflow: TextOverflow.fade,
                fontSize: widget.fontSize,
              ),
            ),
            hasTextOverflow(
                    widget.text,
                    TextStyle(
                      fontSize: widget.fontSize,
                    ),
                    maxWidth: 300,
                    maxLines: widget.maxLines)
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? "...daha az gör" : "...daha fazla gör",
                      style: TextStyle(fontSize: widget.expandFontSize),
                    ))
                : const SizedBox(height: 10)
          ],
        );
      },
    );
  }
}
