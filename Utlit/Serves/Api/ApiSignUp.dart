import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiSignUp {
  static Future reg({
    required String em,
    required String wo,
    required String fir,
    required String las,
    required String us,
  }) async {
    var url = Uri.parse('\$baseApiUrl?type=sin');
    var response = await http.post(url, body: {
      accounts[0]['em']: em,
      accounts[0]['wo']: wo,
      accounts[0]['fir']: fir,
      accounts[0]['las']: las,
      accounts[0]['us']: us,
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
