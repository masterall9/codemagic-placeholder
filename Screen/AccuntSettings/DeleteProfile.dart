import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/Screen/Auh/LoginScreen.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiDeleteAccount.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';

class DeleteProfile extends StatefulWidget {
  const DeleteProfile({super.key, required this.titile});
  final String titile;

  @override
  State<DeleteProfile> createState() => _DeleteProfileState();
}

class _DeleteProfileState extends State<DeleteProfile> {
  bool isChecked = false;

  onTats() async {
    if (isChecked) {
      var ameen = await ApiDeleteAccount.delte(wo: '');
      print(ameen);
      if (ameen['code'] == 200) {
        Get.snackbar('messages', ameen['message']);
        await SharedP.Remove();
        Get.offAll(LoginScreen());
      } else {
        Get.snackbar('messages', ameen['message']);
      }
    } else {
      Get.snackbar('messages', 'Please click on confirm account deletion');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetScreenSettings(
        title: widget.titile,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.08,
              ),
              Lottie.asset('assets/Svg/animation_lmi7dvgz.json'),
              SizedBox(
                height: Get.height * 0.08,
              ),
              WindgeTextFiled(
                title: 'Enter password',
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your password to confirm'),
                ),
              ),
              GFCheckboxListTile(
                avatar: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(contmydata.avatar.value),
                ),
                subTitle: Text('Confirm deletion of my account'),
                size: 20,
                activeBgColor: Colors.red,
                type: GFCheckboxType.circle,
                activeIcon: Icon(
                  Icons.check,
                  size: 10,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
                value: isChecked,
                inactiveIcon: null,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please note that after deleting your account, all your publications, subscriptions, all your data and all your actions will also be deleted, and this action will not be canceled',
                  style:
                      SafeGoogleFont(Fonts.font1, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: onTats,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Text(
                          'Delete account',
                          style: SafeGoogleFont(Fonts.font1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
