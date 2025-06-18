import 'package:colibricmflutter/FlutterCraftersKey.dart';

const String nameApp = 'Colibri Flutter';

///The number of publications that are fetched in the main screen in each update
const String Home_Post_Limit = '20';

//To speed up the navigation of Drawer

const bool drawerNavi = true;

const bool Wallet = true;
const bool Trending = false;
const bool Bookmarks = true;
const bool Advertising = true;
const bool Affiliates = true;
const bool AboutProfile = false;
const String giphyApiKey = 'ZuPQ8uVYjs2cRUVJKZn9ZRMCF2gdDFGY';

const String onesignalKey = '2d1ca16c-788e-43ac-b8b3-609966b59258';

//Auto play video =true  Stop playing the video automatically=flase

const int GetMessagesAndNofi = 5;
const bool AutoPlayVido = false;

class Fonts {
  //Urbanist //Fonts.font3//SF Pro Display
  static String font1 = 'cairo';
  static String font2 = 'Manrope';
  static String font3 = 'Urbanist';
  static String FontLogin = 'Open Sans';

  // static String font4 = Fonts.font1;
}

/// Checks if string is an video file.
///       ext.endsWith(".avi") ||
/// Video playback formats have been added here
bool VideoEx(String filePath) {
  var ext = filePath.toLowerCase();

  return ext.endsWith(".mp4") ||
      ext.endsWith(".avi") ||
      ext.endsWith(".wmv") ||
      ext.endsWith(".rmvb") ||
      ext.endsWith(".mpg") ||
      ext.endsWith(".mov") ||
      ext.endsWith(".mpeg") ||
      ext.endsWith(".3gp");
}

String keyWowo = FlutterCraftersKey;
//next Update
const bool City = false;
const bool languagess = false;
const bool NotificationsSet = false;

const String baseApiUrl = 'https://scrie.md/api/api.php';
