import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpdateAboutProfile.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserEmail extends StatefulWidget {
  const UserEmail({super.key, required this.title, required this.email});
  final String title;
  final String email;

  @override
  State<UserEmail> createState() => _UserEmailState();
}

class _UserEmailState extends State<UserEmail> {
  final TextEditingController _email = TextEditingController();
  @override
  void initState() {
    _email.text = widget.email;
    super.initState();
  }

  Future<void> onTap() async {
    var fin = await ApiUpdateAboutProfile.edite(
      about: '',
      username: '',
      first_name: '',
      email: _email.text,
      last_name: '',
      gender: '',
      website: '',
      country_id: '',
    );
    print(fin);

    if (fin['code'] == 200) {
      contmydata.updi();
      Get.back(closeOverlays: true);
    }
    ;
    await Get.snackbar('Update', fin['message']);
  }

  Widget build(BuildContext context) {
    return WidgetScreenSettings(
        title: widget.title,
        body: Column(
          children: [
            WindgeTextFiled(
              title: 'Email address',
              child: TextField(
                controller: _email,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please note that after changing the email address, the email address that you use during authorization will be replaced by a new one',
                style: SafeGoogleFont(
                  Fonts.font1,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InkWell(onTap: onTap, child: WidgetSaveChange())
          ],
        ));
  }
}
