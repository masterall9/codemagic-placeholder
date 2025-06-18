import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiUpdateAboutProfile {
  static Future edite({
    required String about,
    required String username,
    required String first_name,
    required String last_name,
    required String gender,
    required String email,
    required String website,
    required String country_id,
  }) async {
    var url = Uri.parse('\$baseApiUrl?type=updateProfile');
    var response = await http.post(url, body: {
      'access_token': await SharedP.Get('tok'),
      'username': username,
      'about': about,
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'email': email,
      'website': website,
      'country_id': country_id,
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
