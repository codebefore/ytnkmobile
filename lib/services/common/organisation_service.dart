import 'dart:convert';

import 'package:ytnkio/services/base/service_base.dart';
import 'package:ytnkio/models/common/organisation.dart';

class OrganisationService extends ServiceBase {
  Future<List<Organisation>> getOrganisations(String search) async {
    try {
      var response =
          await postAPIRequest("getorganisations", {"search": search});

      if (response.isSuccess) {
        var list = json.decode(response.responseObject!) as List<dynamic>;
        var resultList = List<Organisation>.empty(growable: true);

        for (var i = 0; i < list.length; i++) {
          resultList.add(Organisation.fromMap(list[i]));
        }

        return resultList;
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }
}
