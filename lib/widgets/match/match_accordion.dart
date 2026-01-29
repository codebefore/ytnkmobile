import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchAccordion extends StatelessWidget {
  const MatchAccordion({required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBorderRadius: 8,
      headerBackgroundColor: Colors.white,
      headerBorderColorOpened: Colors.grey.shade300,
      headerBorderColor: Colors.grey.shade300,
      headerBorderWidth: 1,
      contentBackgroundColor: Colors.white,
      contentBorderRadius: 8,
      contentBorderColor: Colors.white,
      maxOpenSections: 1,
      rightIcon: const Icon(Icons.arrow_drop_down),
      children: [
        AccordionSection(
          header: SizedBox(
              height: 40,
              child: Center(
                  child: Text(
                GlobalTexts.current.MATCH_PAGE_accordion_title_1,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.indigo.shade500),
              ))),
          content: Text(match.responsibilities),
        ),
        AccordionSection(
          header: SizedBox(
              height: 40,
              child: Center(
                  child: Text(
                GlobalTexts.current.MATCH_PAGE_accordion_title_2,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.indigo.shade500),
              ))),
          content: Text(match.requirements),
        ),
        AccordionSection(
          header: SizedBox(
              height: 40,
              child: Center(
                  child: Text(
                GlobalTexts.current.MATCH_PAGE_accordion_title_3,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.indigo.shade500),
              ))),
          content: Text(match.aboutUs),
        ),
      ],
    );
  }
}
