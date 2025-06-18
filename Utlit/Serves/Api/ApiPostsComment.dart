import 'dart:convert';
import 'dart:io';

import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';

import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiPostsComment {
  static Future<List<feedsModel>> fet({
    required String id,
  }) async {
    var url = Uri.parse(accounts[0]['postcomment'] + id);

    List<feedsModel> posts = <feedsModel>[];
    List<CommentNext> commeNext = <CommentNext>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });
    var resp = utf8.decode(response.bodyBytes);

    var datajson = jsonDecode(resp);
    print(datajson);
    print(datajson);
    if (datajson['status'] == 500) {
      Get.snackbar('There is a problem with the site', datajson['message']);
    } else {
      if (await datajson['code'] == '401') {
        await SharedP.Remove();
        Get.offAll(AppRoutes.Loginscreen);
      } else {
        if (datajson['code'] == 200) {
          var wwwdata = datajson['data'];
          posts.add(feedsModel.fromJson(wwwdata));
        }
        // var next = datajson['data']['next'];
        // print(next);

        // commeNext.add(CommentNext.fromJson(next));
      }
    }
    return posts;
  }
}
