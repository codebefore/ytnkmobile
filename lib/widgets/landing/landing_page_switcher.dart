import 'package:flutter/material.dart';

import '../../pages/common/landing_page.dart';

class LandingPageSwitcher extends StatelessWidget {
  final int currentPage;
  final List<LandingPageModel> pages;

  const LandingPageSwitcher(
      {super.key, required this.currentPage, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pages
          .map((item) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: currentPage == pages.indexOf(item) ? 30 : 8,
                height: 8,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: pages[currentPage].textColor,
                    borderRadius: BorderRadius.circular(10.0)),
              ))
          .toList(),
    );
  }
}
