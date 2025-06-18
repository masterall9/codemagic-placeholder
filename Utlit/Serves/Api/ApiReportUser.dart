import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiReportUser {
  static Future fo({
    required String usd,
    required String reason,
    required String comment,
  }) async {
    var url = Uri.parse('\$baseApiUrl?type=profilereport');
    var response = await http.post(url, body: {
      accounts[0]['usd']: usd,
      'access_token': await SharedP.Get('tok'),
      'reason': reason,
      'comment': comment,
    });

    var resp = response.body;

    var json = jsonDecode(resp);
    print(json);
    // Get.snackbar('messages', json['message']);
    if (json['code'] == 200) {
      Get.snackbar('Report', json['message'].toString());
      return json;
    } else if (json['code'] == 400) {
      Get.snackbar('Error', 'Please choose a reason for reporting');

      return json;
    }
  }
}
