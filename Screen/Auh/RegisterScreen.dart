import 'package:colibricmflutter/Screen/Auh/LoginScreen.dart';

import 'package:colibricmflutter/String.dart';

import 'package:colibricmflutter/Utlit/Serves/Api/ApiSignUp.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/WebViewScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  void falseSignUp() {}
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordtrue = true;
  bool chek = false;
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerLasFirstName = TextEditingController();
  @override
  Future<void> SingUp() async {
    var ameenhamed = await ApiSignUp.reg(
        em: _controllerEmail.text,
        wo: _controllerPassword.text,
        fir: _controllerLasFirstName.text,
        las: _controllerLastName.text,
        us: _controllerUsername.text);
    print(ameenhamed);
    if (ameenhamed['code'] == 410) {
      Get.snackbar('error', ameenhamed['message']);
    } else if (ameenhamed['code'] == 409) {
      Get.snackbar('error', ameenhamed['message']);
    } else if (ameenhamed['code'] == 200) {
      Get.snackbar('Done', ameenhamed['message']);
      Get.offAll(LoginScreen());
      widget.falseSignUp();
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: Get.width * 0.1,
                          height: Get.height * 0.05,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50,
                                  color: Color.fromARGB(71, 0, 0, 0)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      SizedBox(
                        width: Get.width * 0.70,
                        child: Text(
                          'Hello! Register to get started',
                          style: SafeGoogleFont(
                            Fonts.font3,
                            color: Color(0xFF1E232C),
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            height: 1.30,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.07,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE8ECF4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50, color: Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: TextField(
                              controller: _controllerLasFirstName,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your first name',
                                  hintStyle: SafeGoogleFont(
                                    Fonts.font1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF8390A1),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.012,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.07,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE8ECF4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50, color: Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: TextField(
                              controller: _controllerLastName,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your last name',
                                  hintStyle: SafeGoogleFont(
                                    Fonts.font1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF8390A1),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.012,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.07,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE8ECF4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50, color: Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: TextField(
                              controller: _controllerUsername,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your username',
                                  hintStyle: SafeGoogleFont(
                                    Fonts.font1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF8390A1),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.012,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.07,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE8ECF4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50, color: Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: TextField(
                              controller: _controllerEmail,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your email',
                                  hintStyle: SafeGoogleFont(
                                    Fonts.font1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF8390A1),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.012,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.07,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE8ECF4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 0.50, color: Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: TextField(
                              controller: _controllerPassword,
                              obscureText: passwordtrue,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordtrue = !passwordtrue;
                                      });
                                    },
                                    icon: Icon(Icons.remove_red_eye,
                                        color: passwordtrue
                                            ? Colors.grey
                                            : ColorThame),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Enter your password',
                                  hintStyle: SafeGoogleFont(
                                    Fonts.font1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF8390A1),
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Please agree to the terms',
                            textAlign: TextAlign.right,
                            style: SafeGoogleFont(
                              Fonts.font3,
                              color: Color(0xFF6A707C),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(WebViewScreen(
                                Urls: '${accounts[0]['sm0']}/privacy_policy',
                              ));
                            },
                            child: Text(
                              'Privacy policy',
                              style: SafeGoogleFont(Fonts.font1,
                                  color: Colors.red),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(WebViewScreen(
                                Urls: '${accounts[0]['sm0']}/terms_of_use',
                              ));
                            },
                            child: Text(
                              'Terms of Use',
                              style: SafeGoogleFont(Fonts.font1,
                                  color: Colors.blue),
                            ),
                          ),
                          Checkbox(
                            value: chek,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                chek = !chek;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      InkWell(
                        onTap: SingUp,
                        child: Container(
                          width: Get.width * 0.90,
                          height: Get.height * 0.07,
                          decoration: ShapeDecoration(
                            color: Color(0xFF1E232C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              'Register',
                              style: SafeGoogleFont(Fonts.font1,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width * 0.30,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFE8ECF4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            'Or Login with',
                            style: SafeGoogleFont(
                              Fonts.font3,
                              color: Color(0xFF6A707C),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Container(
                            width: Get.width * 0.30,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFE8ECF4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _WindgetLoginSocile(
                            svg: 'google_ic.svg',
                          ),
                          _WindgetLoginSocile(
                            svg: 'facebook_ic.svg',
                          ),
                          _WindgetLoginSocile(
                            svg: 'cib_apple.svg',
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: Color(0xFF24282C),
                                    fontSize: 15,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w500,
                                    height: 1.40,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Login Now',
                                  style: TextStyle(
                                    color: Color(0xFF34C2C1),
                                    fontSize: 15,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w700,
                                    height: 1.40,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WindgetLoginSocile extends StatelessWidget {
  const _WindgetLoginSocile({
    required this.svg,
    super.key,
  });
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'assets/Svg/$svg',
          ),
        ),
      ),
    );
  }
}
