import 'dart:convert';

import 'package:colibricmflutter/Utlit/Serves/Models/GetChatModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiGetChat {
  static Future<List<GetChatModel>> fetch() async {
    var url = Uri.parse('\$baseApiUrl?type=getchat');

    List<GetChatModel> posts = <GetChatModel>[];

    var response = await http.post(url, body: {
      'session_id': await SharedP.Get('tok'),
    });

    var resp = response.body;

    var datajson = jsonDecode(utf8.decode(response.bodyBytes));

    var wwwdata = datajson['data'];
    for (var item in wwwdata) {
      posts.add(GetChatModel.fromJson(item));
    }

    return posts;
  }
}
