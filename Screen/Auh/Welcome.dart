import 'package:colibricmflutter/Screen/Auh/LoginScreen.dart';
import 'package:colibricmflutter/Screen/Auh/RegisterScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WilcomeScreen extends StatefulWidget {
  const WilcomeScreen({super.key});

  @override
  State<WilcomeScreen> createState() => _WilcomeScreenState();
}

class _WilcomeScreenState extends State<WilcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(children: [
          SizedBox(height: Get.height * 0.05),
          Container(
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Frame.png'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.07,
          ),
          Column(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              ),
              Text(
                nameApp,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: Get.height * 0.10,
              ),
              InkWell(
                onTap: () {
                  Get.to(LoginScreen());
                },
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
                      style: TextStyle(
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
              InkWell(
                onTap: () {
                  Get.to(RegisterScreen());
                },
                child: Container(
                    width: Get.width * 0.90,
                    height: Get.height * 0.07,
                    decoration: ShapeDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
