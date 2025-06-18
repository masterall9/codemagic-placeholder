import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiBlockUser {
  static Future block({required String usd}) async {
    var url = Uri.parse('\$baseApiUrl?type=block');
    var response = await http.post(url, body: {
      accounts[0]['usd']: usd,
      'access_token': await SharedP.Get('tok'),
    });

    var resp = response.body;

    var json = jsonDecode(resp);
    Get.snackbar('messages', json['message']);
    if (json['api_status'] == 200) {
      return json;
    } else {
      return json;
    }
  }
}
