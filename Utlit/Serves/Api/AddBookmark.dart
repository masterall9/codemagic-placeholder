import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';

import 'package:http/http.dart' as http;

class ApiAddBookmark {
  static Future fo({required String poso}) async {
    var url = Uri.parse('\$baseApiUrl?type=adbok');
    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
      'post_id': poso,
    });

    var resp = response.body;

    var json = jsonDecode(resp);
    print(json);
    if (json['api_status'] == 200) {
      return json;
    } else {
      return json;
    }
  }
}
