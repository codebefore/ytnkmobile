import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/globals/intl_texts/text_file_es.dart';
import 'package:ytnkio/globals/intl_texts/text_file_tr.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchAccordion extends StatefulWidget {
  const MatchAccordion({required this.match, super.key});

  final Match match;

  @override
  State<MatchAccordion> createState() => _MatchAccordionState();
}

class _MatchAccordionState extends State<MatchAccordion> {
  int? _expandedIndex;

  @override
  void initState() {
    super.initState();
  }

  String _whatWeOfferTitle() {
    final current = GlobalTexts.current;
    if (current is TextFileTR) {
      return "Neler Sunuyoruz";
    }
    if (current is TextFileES) {
      return "Lo que ofrecemos";
    }
    return "What We Offer";
  }

  void _toggleSection(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sections = [
      (
        title: GlobalTexts.current.MATCH_PAGE_accordion_title_1,
        content: widget.match.aboutUs,
      ),
      (
        title: GlobalTexts.current.MATCH_PAGE_accordion_title_2,
        content: widget.match.responsibilities,
      ),
      (
        title: GlobalTexts.current.MATCH_PAGE_accordion_title_3,
        content: widget.match.requirements,
      ),
      (
        title: _whatWeOfferTitle(),
        content: widget.match.whatWeOffer,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: List.generate(sections.length, (index) {
          final section = sections[index];
          final isExpanded = _expandedIndex == index;

          return Padding(
            padding: EdgeInsets.only(bottom: index == sections.length - 1 ? 0 : 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => _toggleSection(index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                section.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo.shade500,
                                ),
                              ),
                            ),
                            AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipRect(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOut,
                      child: isExpanded
                          ? Container(
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
                              child: Text(
                                section.content.trim().isEmpty
                                    ? "-"
                                    : section.content,
                                style: const TextStyle(height: 1.45),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
