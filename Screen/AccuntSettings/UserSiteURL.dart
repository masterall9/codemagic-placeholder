import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpdateAboutProfile.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserSiteURL extends StatefulWidget {
  const UserSiteURL({super.key, required this.title, required this.SiteURL});
  final String title;
  final String SiteURL;

  @override
  State<UserSiteURL> createState() => _UserSiteURLState();
}

class _UserSiteURLState extends State<UserSiteURL> {
  final TextEditingController _SiteURL = TextEditingController();
  @override
  void initState() {
    _SiteURL.text = widget.SiteURL;
    super.initState();
  }

  Future<void> onTap() async {
    var fin = await ApiUpdateAboutProfile.edite(
      about: '',
      username: '',
      first_name: '',
      email: '',
      last_name: '',
      gender: '',
      website: _SiteURL.text,
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
              title: 'User Site URL',
              child: TextField(
                controller: _SiteURL,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your URL address of your site'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please note that this URL will appear on your profile page. If you want to hide it, leave this field blank.',
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
