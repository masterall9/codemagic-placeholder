import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiChangePasswrod {
  static Future chnge({required String ol, required String ne}) async {
    var url = Uri.parse('\$baseApiUrl?type=shangepassword');
    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
      accounts[0]['ol']: ol,
      accounts[0]['ne']: ne,
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
