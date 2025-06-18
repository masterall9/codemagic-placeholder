import 'package:colibricmflutter/Screen/Auh/RegisterScreen.dart';
import 'package:colibricmflutter/Screen/NavBar/HomeNavBar.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiLogin.dart';
import 'package:colibricmflutter/Utlit/SocialLogin/LoginGoogle.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordtrue = true;
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  @override
  Future<void> Login() async {
    var ameenhamed = await LoginApi.fetLogin(
        em: _controllerEmail.text, wo: _controllerPassword.text);
    print(ameenhamed);
    if (ameenhamed['code'] == 402) {
      Get.snackbar('error', ameenhamed['message']);
    } else if (ameenhamed['code'] == 200) {
      await SharedP.Save('tok', ameenhamed['auth']['auth_token']);
      await SharedP.Save(
          'user_id', ameenhamed['data']['user']['user_id'].toString());
      await SharedP.Save(
          'username', ameenhamed['data']['user']['user_name'].toString());
      print(await SharedP.Get('username'));
      if (await SharedP.Get('tok') != null) {
        Get.snackbar('Done', ameenhamed['message']);
        Get.offAll(HomeNavBar());
      } else {}
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAllNamed(Routes.wicomescreen);
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
                        height: Get.height * 0.04,
                      ),
                      SizedBox(
                        width: Get.width * 0.70,
                        child: Text(
                          'Welcome back! Glad to see you, Again!',
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
                        height: Get.height * 0.04,
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
                        height: Get.height * 0.04,
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
                        height: Get.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                            style: SafeGoogleFont(
                              Fonts.font3,
                              color: Color(0xFF6A707C),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      InkWell(
                        onTap: Login,
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
                              'Login',
                              style: SafeGoogleFont(Fonts.font1,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.08,
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
                        height: Get.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LoginGoogle(
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
                          Get.to(RegisterScreen());
                        },
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account? ',
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
                                  text: 'Register Now',
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
                ),
              ],
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
