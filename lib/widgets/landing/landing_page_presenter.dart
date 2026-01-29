import 'package:ytnkio/core_module.dart';

import '../../pages/common/landing_page.dart';
import 'landing_page_bottom_bar.dart';
import 'landing_page_switcher.dart';
import 'landing_page_viewer.dart';

class LandingPagePresenter extends StatefulWidget {
  final List<LandingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const LandingPagePresenter(
      {super.key, required this.pages, this.onSkip, this.onFinish});

  @override
  State<LandingPagePresenter> createState() => _LandingPagePresenterState();
}

class _LandingPagePresenterState extends State<LandingPagePresenter> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: null,
      appBar: DefaultAppBar(
        backgroundColor: widget.pages[_currentPage].textColor,
        titleColor: Colors.white,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = widget.pages[index];
                    return LandingPageViewer(item: item);
                  },
                ),
              ),
              LandingPageSwitcher(
                currentPage: _currentPage,
                pages: widget.pages,
              ),
              LandingPageBottomBar(
                pageController: _pageController,
                currentPage: _currentPage,
                textColor: widget.pages[_currentPage].textColor,
                lastPage: widget.pages.length - 1,
                onSkip: widget.onSkip,
                onFinish: widget.onFinish,
              )
            ],
          ),
        ),
      ),
    );
  }
}
