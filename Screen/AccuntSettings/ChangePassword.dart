import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiChangePasswrod.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _Currentpassword = TextEditingController();
  final TextEditingController _Newpassword = TextEditingController(text: null);
  final TextEditingController _Confirmnewpassword = TextEditingController();
  @override
  Future<void> onTap() async {
    if (_Newpassword.text == _Confirmnewpassword.text) {
      var ameen = await ApiChangePasswrod.chnge(
          ol: _Currentpassword.text, ne: _Confirmnewpassword.text);
      if (ameen['code'] == 200) {
        Get.back();
        Get.snackbar('Done', ameen['message']);
      } else {
        Get.snackbar('Error', ameen['message']);
      }
    } else {
      Get.snackbar("erorr", 'Password mismatch');
    }
  }

  Widget build(BuildContext context) {
    return WidgetScreenSettings(
      title: widget.title,
      key: widget.key,
      body: Column(
        children: [
          WindgeTextFiled(
            title: 'Current password',
            child: TextField(
              controller: _Currentpassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your current password'),
            ),
          ),
          WindgeTextFiled(
            title: 'New password',
            child: TextField(
              controller: _Newpassword,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter new password'),
            ),
          ),
          WindgeTextFiled(
            title: 'Confirm new password',
            child: TextField(
              controller: _Confirmnewpassword,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Confirm new password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Before changing your current password, please follow these tips: Indicate the minimum length (6 characters). Use uppercase and lowercase letters. Use numbers and special characters (&%\$)',
              style: SafeGoogleFont(Fonts.font1,
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          InkWell(onTap: onTap, child: WidgetSaveChange())
        ],
      ),
    );
  }
}
