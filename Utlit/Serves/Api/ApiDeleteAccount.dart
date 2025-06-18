import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiDeleteAccount {
  static Future delte({required String wo}) async {
    var url = Uri.parse('\$baseApiUrl?type=deleac');
    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
      accounts[0]['wo']: wo
    });

    var resp = response.body;

    var json = jsonDecode(resp);

    if (json['api_status'] == 200) {
      return json;
    } else {
      return json;
    }
  }
}
