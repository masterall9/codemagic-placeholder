import 'dart:convert';

import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/GetMessagesModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiGetMessages {
  static Future<List<GetMessagesModel>> fetch(
      {required String id,
      required String ofsetdown,
      required ofsetdup,
      required litmet}) async {
    var url = Uri.parse(accounts[0]['getmessages'] +
        id +
        '&page_size=${litmet}&offset_down=${ofsetdown}&offset_up=$ofsetdup');

    List<GetMessagesModel> posts = <GetMessagesModel>[];

    var response = await http.post(url, body: {
      'session_id': await SharedP.Get('tok'),
    });

    var resp = response.body;

    var datajson = jsonDecode(utf8.decode(response.bodyBytes));

    var wwwdata = datajson['data'];
    for (var item in wwwdata) {
      posts.add(GetMessagesModel.fromJson(item));
    }

    return posts;
  }
}
