// ApiCreateEvent

import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiUpditeCover {
  static Future add({
    required String file,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('\$baseApiUrl?type=upcover'));
    request.fields.addAll({
      'access_token': await SharedP.Get('tok'),
    });

    request.files.add(await http.MultipartFile.fromPath(
      'cover',
      file,
      contentType: new MediaType('image', 'png'),
    ));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return response.reasonPhrase;
  }
}
