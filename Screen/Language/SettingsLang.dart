import 'package:colibricmflutter/Screen/Language/Lang/en.dart';
import 'package:get/get.dart';

import 'Lang/ar.dart';

// Emoje flags   https://emojipedia.org/flags/.

String languagedefault = eng;
String arabic = "Arabic 🇸🇦";

String english = "English 🇬🇧";

////

String eng = "en";
String ara = "ar";

////////////////////////////////////////

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        eng: en,
        ara: ar,
      };
}
