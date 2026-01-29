import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_texts.dart';

class LandingPageBottomBar extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final Color textColor;
  final int lastPage;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const LandingPageBottomBar(
      {super.key,
      required this.pageController,
      required this.currentPage,
      required this.textColor,
      required this.lastPage,
      this.onSkip,
      this.onFinish});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              style: TextButton.styleFrom(
                  visualDensity: VisualDensity.comfortable,
                  foregroundColor: textColor,
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: () {
                onSkip?.call();
              },
              child: Text(GlobalTexts.current.LANDING_PAGE_skip)),
          TextButton(
            style: TextButton.styleFrom(
                visualDensity: VisualDensity.comfortable,
                foregroundColor: textColor,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            onPressed: () {
              if (currentPage == lastPage) {
                onFinish?.call();
              } else {
                pageController.animateToPage(currentPage + 1,
                    curve: Curves.easeInOutCubic,
                    duration: const Duration(milliseconds: 250));
              }
            },
            child: Row(
              children: [
                Text(
                  currentPage == lastPage
                      ? GlobalTexts.current.LANDING_PAGE_complete
                      : GlobalTexts.current.LANDING_PAGE_next,
                ),
                const SizedBox(width: 8),
                Icon(
                    currentPage == lastPage ? Icons.done : Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
