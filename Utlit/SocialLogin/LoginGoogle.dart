import 'dart:io';

import 'package:colibricmflutter/Screen/NavBar/HomeNavBar.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiLogin.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiLoginSocial.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({
    required this.svg,
    super.key,
  });
  final String svg;

  @override
  State<LoginGoogle> createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  _signinWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn(
        clientId: Platform.isIOS
            ? '311327852776-goosd9ga2goglvbkug39s1gjprjjoeud.apps.googleusercontent.com'
            //<<<<<<Ios 1>>>>
            : '311327852776-vai0tcma7g6c10nah9ffvu0k2fjo56tk.apps.googleusercontent.com',
        //<<<<<<Android 2>>>>
        forceCodeForRefreshToken: true,
        scopes: ['email']).signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    var ameenhamed = await LoginApiSocial.fetLogin(
        toks: gAuth.accessToken.toString(), ty: 'google');
    print(ameenhamed);
    if (ameenhamed['code'] == 402) {
      Get.snackbar('error', ameenhamed['message']);
    } else if (ameenhamed['code'] == 200) {
      await SharedP.Save('tok', ameenhamed['auth']['auth_token']);
      await SharedP.Save(
          'user_id', ameenhamed['data']['user']['user_id'].toString());
      await SharedP.Save(
          'username', ameenhamed['data']['user']['user_name'].toString());
      print(await SharedP.Get('username'));
      if (await SharedP.Get('tok') != null) {
        Get.snackbar('Done', ameenhamed['message']);
        Get.offAll(HomeNavBar());
      } else {}
    }
    print('ameenjawadhamed1 ${gAuth.idToken}');

    print('ameenjawadhamed2 ${gAuth.accessToken}');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _signinWithGoogle,
      child: Container(
        width: Get.width * 0.26,
        height: Get.height * 0.07,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xffE8ECF4)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 1,
            height: 1,
            child: SvgPicture.asset(
              'assets/Svg/${widget.svg}',
            ),
          ),
        ),
      ),
    );
  }
}
