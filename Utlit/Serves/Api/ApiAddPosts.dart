import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ApiAddPosts {
  static Future add(
      {required String thread_id,
      required String gif,
      required String text,
      required String poll1,
      required String poll2,
      required String poll3,
      required String poll4,
      required String poll5,
      required String poll6,
      required String poll7}) async {
    var url = Uri.parse('\$baseApiUrl?type=adpo');
    var response = await http.post(url, body: {
      if (thread_id.isNotEmpty) 'thread_id': thread_id.toString(),
      'access_token': await SharedP.Get('tok'),
      if (text.isNotEmpty) accounts[0]['pos']: text,
      if (gif.isNotEmpty) 'gif_src': gif,
      if (poll2.isNotEmpty)
        'poll_data': '[{"value": "$poll1"}, {"value": "$poll2"}]',
    });

    var resp = response.body;
    print(resp);

    print('akjsdklasjdkljaskdl $json');

    return json;
  }
}





  // if (poll3.isEmpty)
  //       'poll_data': '[{"value": "$poll1"}, {"value": "$poll2"}]',
  //     if (poll4.isEmpty)
  //       'poll_data':
  //           '[{"value": "$poll1"}, {"value": "$poll2"}, {"value": "$poll3"}]',
  //     if (poll5.isEmpty)
  //       'poll_data':
  //           '[{"value": "$poll1"}, {"value": "$poll2"}, {"value": "$poll3"}, {"value": "$poll4"}, {"value": "$poll5"}]',
  //     if (poll6.isEmpty)
  //       'poll_data':
  //           '[{"value": "$poll1"}, {"value": "$poll2"}, {"value": "$poll3"}, {"value": "$poll4"}, {"value": "$poll5"}, {"value": "$poll6"}]',
  //     if (poll7.isNotEmpty)
  //       'poll_data':
  //           '[{"value": "$poll1"}, {"value": "$poll2"}, {"value": "$poll3"}, {"value": "$poll4"}, {"value": "$poll5"}, {"value": "$poll6"}, {"value": "$poll7"}]',
  //     accounts[0]['pos']: text,
