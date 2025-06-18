import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiNofiCont {
  static Future Cont() async {
    var url = Uri.parse('\$baseApiUrl?type=conts');
    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
    });
    var resp = response.body;

    var json = jsonDecode(resp);
    print('akjsdklasjkldjaskldjaskdjaskl $json');

    if (json['api_status'] == 200) {
      return json;
    } else {
      return json;
    }
  }
}
