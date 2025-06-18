import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:colibricmflutter/Screen/Language/SettingsLang.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Themes.dart';
import 'package:colibricmflutter/Utlit/Unfous.dart';
import 'package:colibricmflutter/controllers/Cont.dart';
import 'package:colibricmflutter/controllers/OneSingal.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/controllers/thems_controllers.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  // await FirebaseApi().initNotifications();

  final tok = await SharedP.Get('tok');
  OneSignalNotf();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  print(tok);
  performEncryption();
  runApp(colibri(
    tok: tok,
  ));
}

class colibri extends StatelessWidget {
  const colibri({super.key, required this.tok});
  final tok;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(languagedefault),
      themeMode: ThemeController().themeDataGet,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      debugShowCheckedModeBanner: false,
      builder: (_, child) => Unfous(child: child!),
      title: nameApp,
      // home: SignInDemo(),
      initialRoute:
          tok != null ? AppRoutes.hoMeNavBar : AppRoutes.WilcomeSCREEN,

      getPages: AppRoutes.routes,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
