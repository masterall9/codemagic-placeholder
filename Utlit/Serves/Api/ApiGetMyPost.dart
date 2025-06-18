import 'dart:convert';

import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiGetMyPost {
  static Future<List<feedsModel>> fet(
      {required String id, required String media, required username}) async {
    var url = Uri.parse(accounts[0]['mypost'] +
        '$id${accounts[0]['typelink']}$media' +
        '?username=$username');

    List<feedsModel> posts = <feedsModel>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });

    var resp = response.body;

    print(resp);
    var datajson = jsonDecode(utf8.decode(response.bodyBytes));
    print(datajson);
    if (datajson['status'] == 500) {
      Get.snackbar('There is a problem with the site', datajson['message']);
    } else {
      if (await datajson['code'] == '401') {
        await SharedP.Remove();
        Get.offAll(AppRoutes.Loginscreen);
      } else {
        if (datajson['code'] == 204) {
          print('stop');
        } else {
          var wwwdata = datajson['data']['posts'];

          for (var item in wwwdata) {
            posts.add(feedsModel.fromJson(item));
          }
        }
      }
    }

    return posts;
  }
}

class ApiGetMyPostPin {
  static Future<List<feedsModel>> fet({required String id}) async {
    var url = Uri.parse(
        '${accounts[0]['mypost']}$id&type=media&session_id=${await SharedP.Get('tok')}');

    List<feedsModel> posts = <feedsModel>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });

    var resp = response.body;

    print(resp);
    var datajson = jsonDecode(utf8.decode(response.bodyBytes));
    print(datajson);
    if (datajson['status'] == 500) {
      Get.snackbar('There is a problem with the site', datajson['message']);
    } else {
      if (await datajson['code'] == '401') {
        await SharedP.Remove();
        Get.offAll(AppRoutes.Loginscreen);
      } else {
        if (datajson['code'] == 204) {
          print('stop');
        } else {
          var wwwdata = datajson['data']['pin_fluttercrafters'];

          for (var item in wwwdata) {
            posts.add(feedsModel.fromJson(item));
          }
        }
      }
    }

    return posts;
  }
}
