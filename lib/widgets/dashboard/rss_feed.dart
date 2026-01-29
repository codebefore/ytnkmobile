import 'package:url_launcher/url_launcher.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/repos/rss_repository.dart';

class RSSFeed extends StatefulWidget {
  const RSSFeed({super.key});

  @override
  State<RSSFeed> createState() => RSSFeedState();
}

class RSSFeedState extends State<RSSFeed> {
  launchURL(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RSSRepository.fetchTopStories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final topStories = snapshot.data;

        if (topStories == null || topStories.isEmpty) {
          return Center(
            child: Column(
              children: [
                Text(GlobalTexts.current.DASHBOARD_PAGE_loadingRssFeed),
                SizedBox(height: 20),
                LinearProgressIndicator(),
              ],
            ),
          );
        }
        return Flex(
          direction: Axis.vertical,
          children: [
            ...topStories.take(4).map((e) => Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.indigo, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.network(
                            e['enclosure']['url'],
                            height: 60,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onDoubleTap: () {
                                    launchURL(e['link']['\$t']);
                                  },
                                  child: Text(
                                    e['title']['\$t'],
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  e['pubDate']['\$t'].toString().substring(
                                      0,
                                      e['pubDate']['\$t'].toString().length -
                                          15),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}
