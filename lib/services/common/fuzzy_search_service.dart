import 'dart:convert';

import 'package:ytnkio/models/common/item.dart';
import 'package:ytnkio/services/base/service_base.dart';

class FuzzySearchService extends ServiceBase {
  Future<List<String>> search(String name, String statement) async {
    var response = await postAPIRequest(
        "fuzzy/fuzzySearch", {"name": name, "statement": statement});

    if (response.isSuccess) {
      if (response.responseObject == null) {
        return [];
      }

      return (json.decode(response.responseObject!) as List<dynamic>)
          .cast<String>();
    } else {
      return [];
    }
  }

  Future<List<Item>> searchWithItem(String name, String statement) async {
    var response = await postAPIRequest(
        "fuzzy/fuzzyWithItemSearch", {"name": name, "statement": statement});

    if (response.isSuccess) {
      if (response.responseObject == null) {
        return [];
      }

      return Item.fromList(
          json.decode(response.responseObject!) as List<dynamic>);
    } else {
      return [];
    }
  }

  Future<List<String>> extractKeywords(String name, String statement) async {
    var response = await postAPIRequest(
        "fuzzy/extractKeywords", {"name": name, "statement": statement});

    if (response.isSuccess) {
      if (response.responseObject == null) {
        return [];
      }

      return (json.decode(response.responseObject!) as List<dynamic>)
          .cast<String>();
    } else {
      return [];
    }
  }

  Future<List<Item>> extractKeywordsWithItem(
      String name, String statement) async {
    var response = await postAPIRequest(
        "fuzzy/extractKeywordsWithItem", {"name": name, "statement": statement});

    if (response.isSuccess) {
      if (response.responseObject == null) {
        return [];
      }

      return Item.fromList(
          json.decode(response.responseObject!) as List<dynamic>);
    } else {
      return [];
    }
  }
}
