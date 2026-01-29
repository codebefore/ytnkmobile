import 'package:flutter/material.dart';

import '../../pages/common/landing_page.dart';

class LandingPageViewer extends StatelessWidget {
  const LandingPageViewer({
    super.key,
    required this.item,
  });

  final LandingPageModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              item.imageUrl,
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(item.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: item.textColor,
                            )),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 280),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8.0),
                    child: Text(item.description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: item.textColor,
                            )),
                  )
                ]))
      ],
    );
  }
}
