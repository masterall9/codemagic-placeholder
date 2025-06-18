import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpdateAboutProfile.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Yourgender extends StatefulWidget {
  Yourgender({super.key, required this.title, required this.Gender});
  final String title;
  String Gender;

  @override
  State<Yourgender> createState() => _YourgenderState();
}

class _YourgenderState extends State<Yourgender> {
  String gender = "";

  Future<void> onTap() async {
    var fin = await ApiUpdateAboutProfile.edite(
      about: '',
      username: '',
      first_name: '',
      email: '',
      last_name: '',
      gender: widget.Gender,
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
            RadioListTile(
              title: Text("Male"),
              value: "M",
              groupValue: widget.Gender,
              onChanged: (value) {
                setState(() {
                  widget.Gender = value.toString();
                  print(value);
                });
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: "F",
              groupValue: widget.Gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                  widget.Gender = value.toString();
                  print(value);
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please choose your gender, this is necessary for a more complete identification of your profile. (Default user gender is Male)',
                style: SafeGoogleFont(Fonts.font1,
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(onTap: onTap, child: WidgetSaveChange()),
            ),
          ],
        ));
  }
}
