// ApiCreateEvent

import 'dart:convert';

import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiUplodeImage {
  static Future add({required String file, required String type}) async {
    var request = http.MultipartRequest('POST', Uri.parse('\$baseApiUrl?type=uplo'));
    request.fields
        .addAll({'access_token': await SharedP.Get('tok'), 'type': type});
    if (type == 'image')
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file,
        contentType: new MediaType('image', 'png'),
      ));
    if (type == 'video')
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file,
        contentType: new MediaType('video', 'mp4'),
      ));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
    } else {
      // print(response.reasonPhrase);
    }
  }
}
