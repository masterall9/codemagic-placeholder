import 'dart:convert';
import 'dart:io';

import 'package:colibricmflutter/Utlit/Serves/Models/GetSubscriptionModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';

import 'package:colibricmflutter/routes/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

int cont = 0;

class ApiFetchSubscriptin {
  static Future<List<GetSubscriptionModel>> fet() async {
    int vont = cont++;
    var url = Uri.parse('\$baseApiUrl?type=fetchSub');
    var dir = await getTemporaryDirectory();

    List<GetSubscriptionModel> posts = <GetSubscriptionModel>[];

    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });

    var resp = utf8.decode(response.bodyBytes);

    var datajson = jsonDecode(resp);

    var wwwdata = datajson['ameen'];

    print(datajson);
    for (var item in wwwdata) {
      posts.add(GetSubscriptionModel.fromJson(item));
    }

    return posts;
  }
}
