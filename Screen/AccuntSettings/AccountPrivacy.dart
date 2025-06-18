import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class AccountPrivacy extends StatefulWidget {
  const AccountPrivacy({super.key, required this.title});
  final String title;

  @override
  State<AccountPrivacy> createState() => _AccountPrivacyState();
}

class _AccountPrivacyState extends State<AccountPrivacy> {
  var profile_visibility = 'Everyone';
  var contact_privacy = 'Everyone';
  var search_visibility = 'Yes';

  @override
  Widget build(BuildContext context) {
    return WidgetScreenSettings(
      title: widget.title,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Who can see my profile & posts?',
              style: SafeGoogleFont(Fonts.font1,
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  borderRadius: BorderRadius.circular(10),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor:
                      Get.isDarkMode ? Colors.grey : Colors.grey[300],
                  value: profile_visibility,
                  onChanged: (newValue) {
                    setState(() {
                      profile_visibility = newValue.toString();
                      print(profile_visibility);
                    });
                  },
                  items: ['Everyone', 'My followers']
                      // return DropdownMenuItem

                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            color: Colors.grey,
            height: 0.1,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Show your profile in search engines?',
              style: SafeGoogleFont(Fonts.font1,
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  borderRadius: BorderRadius.circular(10),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor:
                      Get.isDarkMode ? Colors.grey : Colors.grey[300],
                  value: search_visibility,
                  onChanged: (newValue) {
                    setState(() {
                      search_visibility = newValue.toString();
                      print(search_visibility);
                    });
                  },
                  items: ['Yes', 'No']
                      // return DropdownMenuItem

                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            color: Colors.grey,
            height: 0.1,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Who can direct message me?',
              style: SafeGoogleFont(Fonts.font1,
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  borderRadius: BorderRadius.circular(10),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor:
                      Get.isDarkMode ? Colors.grey : Colors.grey[300],
                  value: contact_privacy,
                  onChanged: (newValue) {
                    setState(() {
                      contact_privacy = newValue.toString();
                      print(contact_privacy);
                    });
                  },
                  items: ['Everyone', 'The people I follow']
                      // return DropdownMenuItem

                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            width: Get.width,
            color: Colors.grey,
            height: 0.1,
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          WidgetSaveChange(),
        ],
      ),
    );
  }
}
