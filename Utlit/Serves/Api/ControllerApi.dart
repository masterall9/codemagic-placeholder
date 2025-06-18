import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:html/parser.dart';

Future<String> LinkApi({
  required,
  required String offset,
  required String value,
}) async {
  return '?${'access_token'}=${await SharedP.Get('tok')}${accounts[0]['pagesize']}$Home_Post_Limit${accounts[0]['ofs']}$offset$value';
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}
