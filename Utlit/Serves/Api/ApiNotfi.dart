import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

class ApiNotfi {
  static Future pos() async {
    var request = http.MultipartRequest('POST', Uri.parse('\$baseApiUrl?type=one'));
    request.fields.addAll({
      'access_token': await SharedP.Get('tok'),
      accounts[0]['toks']: await SharedP.Get('onsin'),
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await SharedP.Get('ones'));
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
