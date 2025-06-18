import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiAddPinMyProfile {
  static Future fo({required String poso}) async {
    var url = Uri.parse('\$baseApiUrl?type=pinmyprofile');
    var response = await http.post(url, body: {
      'post_id': poso,
      'access_token': await SharedP.Get('tok'),
    });

    var resp = response.body;

    var json = jsonDecode(resp);
    print(json);
    // Get.snackbar('messages', json['message']);
    if (json['status'] == 200) {
      if (json['status_code'] == '1') {
        Get.snackbar('Please refresh the page', 'The post was pinned');
      } else if (json['status_code'] == '0') {
        Get.snackbar(
            'Please refresh the page', 'Installation has been cancelled');
      }
      return json;
    } else {
      return json;
    }
  }
}
