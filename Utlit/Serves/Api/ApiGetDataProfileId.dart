import 'dart:convert';

import 'package:colibricmflutter/Utlit/Serves/Models/GetProfileDataModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiGetDataProfileId {
  static Future<List<GetProfileDataModel>> fetch(
      String user_id, String user_name) async {
    var url =
        Uri.parse(accounts[0]['getProfile'] + user_id + '&username=$user_name');

    List<GetProfileDataModel> posts = <GetProfileDataModel>[];

    var response = await http.post(url, body: {
      'session_id': await SharedP.Get('tok'),
    });

    var resp = response.body;

    var datajson = jsonDecode(utf8.decode(response.bodyBytes));
    print(datajson);

    var wwwdata = datajson['data'];

    posts.add(GetProfileDataModel.fromJson(wwwdata));

    return posts;
  }
}
