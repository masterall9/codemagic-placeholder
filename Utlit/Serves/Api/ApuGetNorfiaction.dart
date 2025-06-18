import 'dart:convert';

import 'package:colibricmflutter/Utlit/Serves/Models/GetNofication.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApuGetNorfiaction {
  static Future<List<GetNofication>> fet({required String type}) async {
    var url = Uri.parse(accounts[0]['nofi'] + type);

    List<GetNofication> posts = <GetNofication>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });

    var resp = response.body;
    final resps = utf8.decode(response.bodyBytes);
    var datajson = jsonDecode(resps);

    print(datajson);

    if (await datajson['code'] == '401') {
      await SharedP.Remove();
      Get.offAll(AppRoutes.Loginscreen);
    } else {
      if (datajson['code'] == 204) {
      } else {
        var d = datajson['data'];
        var wwwdata = d;
        for (var item in wwwdata) {
          posts.add(GetNofication.fromJson(item));
        }
      }
    }

    return posts;
  }
}
