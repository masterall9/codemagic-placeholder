import 'dart:convert';
import 'dart:io';

import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';

import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

int cont = 0;

class ApiGetBookMarks {
  static Future<List<feedsModel>> fet(
      {required String listId, required String sized}) async {
    int vont = cont++;
    var url = Uri.parse(accounts[0]['getbook'] +
        '?' +
        accounts[0]['sized'] +
        sized +
        accounts[0]['ofs'] +
        listId);
    var dir = await getTemporaryDirectory();

    List<feedsModel> posts = <feedsModel>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });

    String fileName = "$vont+PostsCashs.json";
    File file = new File(dir.path + "/$vont" + fileName);

    try {
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
            var wwwdata = datajson['data'];

            for (var item in wwwdata) {
              posts.add(feedsModel.fromJson(item));
            }
            file.writeAsStringSync(response.body,
                flush: true, mode: FileMode.write);
          }
        }
      }
      return posts;
    } catch (e) {
      print('ameenhhh');
      vont;
      var jsonData = file.readAsStringSync();
      var dataReed = jsonDecode(jsonData);
      var datadecde = dataReed['data'];
      for (var item in datadecde) {
        posts.add(feedsModel.fromJson(item));
      }
    }

    return posts;
  }
}
