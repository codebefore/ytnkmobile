import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:ytnkio/globals/global_constants.dart';

class RSSRepository {
  static Future<List>? _cachedTopStories;

  static Future<List> fetchTopStories() async {
    if (_cachedTopStories != null) {
      return _cachedTopStories!;
    }

    final url = Uri.parse(GlobalConstants.rssFeedUrl);
    final response = await http.get(url);
    final xml2json = Xml2Json();
    xml2json.parse(response.body);
    final jsondata = xml2json.toGData();
    final data = json.decode(jsondata);

    _cachedTopStories = Future.value(data['rss']['channel']['item']);
    return data['rss']['channel']['item'];
  }
}
