import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoResultsFoundScreen extends StatelessWidget {
  const NoResultsFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/noutRus.png',
          height: Get.height * 0.30,
        ),
        Text(
          'No Results Found'.tr,
          style: SafeGoogleFont(Fonts.font1,
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Please make sure it is written correctly.'.tr),
        ),
      ],
    );
  }
}
