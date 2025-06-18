import 'package:colibricmflutter/Screen/Language/Lang/ar.dart';
import 'package:colibricmflutter/Screen/Language/SettingsLang.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class SettingController extends GetxController {
  var swithchValue = Get.isDarkMode.obs;
  var SchekBox = false.obs;

  var storage = GetStorage();
  var langLocal = eng;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  //Language
  String key = '6c75de8e46c3935ade2f4f43e38dd6f1';

  AppState _state = AppState.NOT_DOWNLOADED;
  String? _currentAddress;

  @override
  void onInit() async {
    super.onInit();

    langLocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    // ignore: unnecessary_null_comparison
    if (lang == null) {
      await storage.write('lang', languagedefault);
    } else {
      await storage.write('lang', lang);
    }
  }

  Future<String> get getLanguage async {
    if (storage.read("lang") == null)
      await storage.write('lang', languagedefault);
    print(storage.read("lang"));
    return await storage.read("lang");
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == eng) {
      langLocal = eng;
      saveLanguage(eng);
      lang('english');
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage('arabic');
      lang('arabic');
    } else {
      langLocal = eng;

      saveLanguage(eng);
    }
    update();
  }
}

void lang(String langs) async {
  final tok = await SharedP.Get('tok');
  if (tok != null) {
    // await ApiLang.edite(langs);
  } else {
    print('no token');
  }
}
