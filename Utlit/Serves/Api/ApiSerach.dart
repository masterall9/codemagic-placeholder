import 'dart:convert';

import 'package:colibricmflutter/Utlit/Serves/Api/ControllerApi.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/SearchPeopleModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiSerach {
  static Future<List<SearchPeopleModel>> serach({
    required String search,
    required String offset,
  }) async {
    var url = Uri.parse(accounts[0]['searchp'] +
        await LinkApi(offset: offset, value: '${accounts[0]['qu']}$search'));

    List<SearchPeopleModel> posts = <SearchPeopleModel>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });

    var resp = response.body;

    var datajson = jsonDecode(utf8.decode(response.bodyBytes));

    var wwwdata = datajson['data'];
    for (var item in wwwdata) {
      posts.add(SearchPeopleModel.fromJson(item));
    }

    return posts;
  }
}
