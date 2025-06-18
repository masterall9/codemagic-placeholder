import 'package:colibricmflutter/Screen/AccuntSettings/UsernameScreen.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/WidetSettingScreen.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpdateAboutProfile.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Contry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ConuntryScreen extends StatefulWidget {
  const ConuntryScreen({
    super.key,
    required this.title,
    required this.contrr,
  });
  final String contrr;
  final String title;

  @override
  State<ConuntryScreen> createState() => _ConuntryScreenState();
}

class _ConuntryScreenState extends State<ConuntryScreen> {
  @override
  String Country = 'Select Country';
  String countryNup = '0';
  @override
  void initState() {
    Country = widget.contrr;
    super.initState();
  }

  Future<void> _onTap() async {
    var fin = await ApiUpdateAboutProfile.edite(
      about: '',
      username: '',
      first_name: '',
      email: '',
      last_name: '',
      gender: '',
      website: '',
      country_id: countryNup,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Choose your country',
                style: SafeGoogleFont(Fonts.font1,
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(41, 158, 158, 158)),
                child: InkWell(
                  onTap: () {
                    Get.bottomSheet(Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: Contry.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Country = Contry[index].toString();
                                      countryNup = index.toString();
                                      print(countryNup);
                                    });
                                    Get.back();
                                  },
                                  child: Container(
                                    width: Get.width,
                                    child: Center(
                                      child: Text(
                                        Contry[index].toString(),
                                        style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                              ],
                            );
                          },
                        ),
                      ),
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Country,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_down),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Choose the country in which you live. This information will be publicly displayed on your profile.',
                style: SafeGoogleFont(Fonts.font1,
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            InkWell(onTap: _onTap, child: WidgetSaveChange())
          ],
        ));
  }
}
