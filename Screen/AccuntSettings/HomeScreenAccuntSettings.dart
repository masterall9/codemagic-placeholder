import 'package:colibricmflutter/Screen/AccuntSettings/AccountPrivacy.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/ChangePassword.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/ConuntryScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/DeleteProfile.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/UserEmail.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/UserSiteURL.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/VerificationScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/Yourgender.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreenAccuntSettings extends StatefulWidget {
  const HomeScreenAccuntSettings({super.key});

  @override
  State<HomeScreenAccuntSettings> createState() =>
      _HomeScreenAccuntSettingsState();
}

class _HomeScreenAccuntSettingsState extends State<HomeScreenAccuntSettings> {
  var data = Get.put(GetMyUserDataCont());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          title: Text('Account settings,')),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              for (var i = 0; i < data.data.length; i++)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'GENERAL PROFILE SETTINGS',
                        style: SafeGoogleFont(Fonts.font1,
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(UsernameScreen(
                          title: 'Username',
                          username: data.data[i].user_name,
                          lastname: data.data[i].last_name,
                          firstname: data.data[i].first_name,
                        ));
                      },
                      child: _setttings(
                        title: 'Username',
                        hinttitle:
                            '${data.data[i].first_name} - @${data.data[i].user_name}',
                        svg: 'username.svg',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(UserEmail(
                          email: data.data[i].email,
                          title: 'Email address',
                        ));
                      },
                      child: _setttings(
                        title: 'Email address',
                        hinttitle: data.data[i].email,
                        svg: 'Email.svg',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(UserSiteURL(
                            title: 'Website URL address',
                            SiteURL: data.data[i].website));
                      },
                      child: _setttings(
                        title: 'Website URL address',
                        hinttitle: data.data[i].website,
                        svg: 'url.svg',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Yourgender(
                          title: 'Your gender',
                          Gender: data.data[i].gender,
                        ));
                      },
                      child: _setttings(
                        title: 'Your gender',
                        hinttitle:
                            data.data[i].gender == 'F' ? 'Female' : 'Male',
                        svg: 'gender.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'USER PASSWORD',
                        style: SafeGoogleFont(Fonts.font1,
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(ChangePassword(
                          title: 'Change password',
                        ));
                      },
                      child: _setttings(
                        title: 'My password',
                        hinttitle: 'Click to set your account password',
                        svg: 'password.svg',
                      ),
                    ),
                    if (languagess)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Language and Country',
                          style: SafeGoogleFont(Fonts.font1,
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    if (languagess)
                      _setttings(
                        title: 'Display language',
                        hinttitle: 'English',
                        svg: 'lang.svg',
                      ),
                    InkWell(
                      onTap: () {
                        Get.to(ConuntryScreen(
                          title: 'Country',
                          contrr: data.data[i].country,
                        ));
                      },
                      child: _setttings(
                        title: 'The country in which you live',
                        hinttitle: data.data[i].country,
                        svg: 'country.svg',
                      ),
                    ),
                    if (City)
                      _setttings(
                        title: 'Your State / City / Location',
                        hinttitle: 'qalqlia',
                        svg: 'sity.svg',
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Account verification',
                        style: SafeGoogleFont(Fonts.font1,
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(VerificationScreen());
                      },
                      child: _setttings(
                        title: 'Verify my account',
                        hinttitle: 'Click to submit a verification request',
                        svg: 'Verify.svg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Account privacy settings',
                        style: SafeGoogleFont(Fonts.font1,
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(AccountPrivacy(title: 'Account privacy'));
                      },
                      child: _setttings(
                        title: 'Account privacy',
                        hinttitle: 'Click to set your account privacy',
                        svg: 'privacy.svg',
                      ),
                    ),
                    if (NotificationsSet)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Notifications settings',
                          style: SafeGoogleFont(Fonts.font1,
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    if (NotificationsSet) Divider(),
                    if (NotificationsSet)
                      _setttings(
                        title: 'Notifications',
                        hinttitle: 'Click to set up account notifications',
                        svg: 'Notifications.svg',
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Delete profile',
                        style: SafeGoogleFont(Fonts.font1,
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(DeleteProfile(
                          titile: 'Delete profile',
                        ));
                      },
                      child: _setttings(
                        title: 'Delete profile',
                        hinttitle: 'Click to confirm deletion of your profile',
                        svg: 'deletes.svg',
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _setttings extends StatelessWidget {
  const _setttings({
    super.key,
    required this.title,
    required this.hinttitle,
    required this.svg,
  });
  final String title;
  final String hinttitle;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/Svg/$svg',
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: SafeGoogleFont(Fonts.font1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        hinttitle.isNotEmpty
                            ? hinttitle
                            : 'You have not yet determined the ',
                        style: SafeGoogleFont(Fonts.font1,
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/Svg/Edites.svg',
                color: Get.isDarkMode ? Colors.white : Colors.grey,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            color: Colors.grey,
            height: 0.3,
          ),
        )
      ],
    );
  }
}
