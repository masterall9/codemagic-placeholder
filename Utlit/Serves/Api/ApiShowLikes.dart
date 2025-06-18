import 'dart:convert';

import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/ShowLikesModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApishowLik {
  static Future<List<ShowLikesModel>> fet(
      {required String id, required String offset}) async {
    var url = Uri.parse(
      accounts[0]['sholi'] +
          await SharedP.Get('tok') +
          accounts[0]['postidlink'] +
          id,
    );

    List<ShowLikesModel> posts = <ShowLikesModel>[];

    var response = await http.post(url, body: {});

    var datajson = jsonDecode(utf8.decode(response.bodyBytes));
    print(datajson);

    var wwwdata = datajson['data'];
    for (var item in wwwdata) {
      posts.add(ShowLikesModel.fromJson(item));
    }

    return posts;
  }
}
