import 'dart:convert';
import 'dart:io';

import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';

import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiPinPostTimeline {
  static Future<List<feedsModel>> fet() async {
    String fileName = "PinPosts.json";
    var url = Uri.parse('\$baseApiUrl?type=fd');
    var dir = await getTemporaryDirectory();

    List<feedsModel> posts = <feedsModel>[];

    File file = new File(dir.path + "/" + fileName);

    try {
      var response = await http.post(url, body: {
        'access_token': await SharedP.Get('tok'),
      });
      var resp = utf8.decode(response.bodyBytes);

      var datajson = jsonDecode(resp);
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
            file.writeAsStringSync(utf8.decode(response.bodyBytes),
                flush: true, mode: FileMode.write);
            // var wwwdata2 = datajson['data']['pin_fluttercrafters'];
            var wwwdata = datajson['data']['pin_fluttercrafters'];
            // for (var item in wwwdata2) {
            //   posts.add(feedsModel.fromJson(item));
            // }
            // print('jaksdshajkshdajkshdjkashdkashdk $wwwdata2');
            for (var item in wwwdata) {
              posts.add(feedsModel.fromJson(item));
            }
          }
        }
      }
      return posts;
    } catch (e) {
      var jsonData = file.readAsStringSync();
      var dataReed = jsonDecode(jsonData);
      var datadecde = dataReed['data']['pin_fluttercrafters'];
      for (var item in datadecde) {
        posts.add(feedsModel.fromJson(item));
      }
    }

    return posts;
  }
}
