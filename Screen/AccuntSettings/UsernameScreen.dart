import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpdateAboutProfile.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsernameScreen extends StatefulWidget {
  UsernameScreen(
      {super.key,
      required this.title,
      required this.username,
      required this.lastname,
      required this.firstname});
  final String title;
  final String username;
  final String lastname;
  final String firstname;

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController(text: null);
  final TextEditingController _username = TextEditingController();
  @override
  final getimydata = Get.find<GetMyUserDataCont>();
  void initState() {
    _firstname.text = widget.firstname;
    _lastname.text = widget.lastname;
    _username.text = widget.username;
    super.initState();
  }

  Future<void> onTap() async {
    if (_username.text.length < 4) {
    } else if (_firstname.text.length < 5) {
      Get.snackbar('title', 'message');
    } else {
      var fin = await ApiUpdateAboutProfile.edite(
        about: '',
        username: _username.text,
        first_name: _firstname.text,
        email: '',
        last_name: _lastname.text,
        gender: '',
        website: '',
        country_id: '',
      );
      print(fin);

      if (fin['code'] == 200) {
        getimydata.updi();
        Get.back(closeOverlays: true);
      }
      ;
      await Get.snackbar('Update', fin['message']);
    }
  }

  Widget build(BuildContext context) {
    return WidgetScreenSettings(
      title: widget.title,
      key: widget.key,
      body: Column(
        children: [
          WindgeTextFiled(
            title: 'First name',
            child: TextField(
              controller: _firstname,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          WindgeTextFiled(
            title: 'Last name (Optional)',
            child: TextFormField(
              controller: _lastname,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter last name'),
            ),
          ),
          WindgeTextFiled(
            title: 'Username',
            child: TextField(
              controller: _username,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          InkWell(onTap: onTap, child: WidgetSaveChange())
        ],
      ),
    );
  }
}

class WidgetSaveChange extends StatelessWidget {
  const WidgetSaveChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: ColorThame, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
              child: Text(
            'Save changes',
            style: SafeGoogleFont(Fonts.font1,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 1),
          )),
        ),
      ),
    );
  }
}

class WindgeTextFiled extends StatelessWidget {
  const WindgeTextFiled({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: SafeGoogleFont(Fonts.font1,
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(51, 158, 158, 158)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
