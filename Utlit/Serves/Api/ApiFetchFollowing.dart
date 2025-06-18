import 'dart:convert';

import 'package:colibricmflutter/Utlit/Serves/Api/ControllerApi.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/FetchFollowingModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

int cont = 0;

class ApiFetchFollowing {
  static Future<List<FetchFollowingModel>> fet(
      {required String offset, required String user_id}) async {
    int vont = cont++;
    var url = Uri.parse(accounts[0]['following'] +
        await LinkApi(
          offset: offset,
          value: '&${accounts[0]['usd']}=$user_id',
        ));
    var dir = await getTemporaryDirectory();

    List<FetchFollowingModel> posts = <FetchFollowingModel>[];

    var response = await http.post(url, body: {});

    var resp = utf8.decode(response.bodyBytes);

    var datajson = jsonDecode(resp);

    var wwwdata = datajson['data'];

    print(datajson);
    for (var item in wwwdata) {
      posts.add(FetchFollowingModel.fromJson(item));
    }

    return posts;
  }
}

class ApiFetchfollowers {
  static Future<List<FetchFollowingModel>> fet(
      {required String offset, required String user_id}) async {
    int vont = cont++;
    var url = Uri.parse(accounts[0]['followers'] +
        await LinkApi(
          offset: offset,
          value: '&${accounts[0]['usd']}=$user_id',
        ));
    var dir = await getTemporaryDirectory();

    List<FetchFollowingModel> posts = <FetchFollowingModel>[];

    var response = await http.post(url, body: {});

    var resp = utf8.decode(response.bodyBytes);

    var datajson = jsonDecode(resp);

    var wwwdata = datajson['data'];

    print(datajson);
    for (var item in wwwdata) {
      posts.add(FetchFollowingModel.fromJson(item));
    }

    return posts;
  }
}
