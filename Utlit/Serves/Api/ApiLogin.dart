import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future fetLogin({required String em, required String wo}) async {
    var url = Uri.parse('\$baseApiUrl?type=logo');
    var response = await http.post(url, body: {
      accounts[0]['em']: em,
      accounts[0]['wo']: wo,
      if (GetPlatform.isAndroid) accounts[0]['dev']: accounts[0]['and'],
      if (GetPlatform.isAndroid) accounts[0]['dev']: accounts[0]['os'],
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
