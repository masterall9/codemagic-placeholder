import 'dart:convert';

import 'package:colibricmflutter/Utlit/Serves/Models/StoriesModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';

import 'package:http/http.dart' as http;

class ApiStoreis {
  static Future<List<StoriesModel>> fetch() async {
    var url = Uri.parse('\$baseApiUrl?type=ftsto');

    List<StoriesModel> posts = <StoriesModel>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });

    var resp = response.body;

    var datajson = jsonDecode(utf8.decode(response.bodyBytes));
    print(datajson);

    var wwwdata = datajson['data'];

    for (var item in wwwdata) {
      posts.add(StoriesModel.fromJson(item));
    }

    return posts;
  }
}
