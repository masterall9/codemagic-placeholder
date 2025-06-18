import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiSendMessages {
  static Future send(
      {required String usd,
      required String ty,
      required String ms,
      required String images}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('\$baseApiUrl?type=sendmessages'));
    request.fields.addAll({
      'access_token': await SharedP.Get('tok'),
      accounts[0]['usd']: usd,
      accounts[0]['ty']: ty,
      accounts[0]['ms']: ms,
    });

    if (ty == 'media')
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        images,
        contentType: new MediaType('image', 'png'),
      ));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
