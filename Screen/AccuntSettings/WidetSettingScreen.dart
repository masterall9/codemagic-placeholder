import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetScreenSettings extends StatelessWidget {
  const WidgetScreenSettings(
      {super.key, required this.title, required this.body});
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(title),
      ),
      body: Container(height: Get.height, width: Get.width, child: body),
    );
  }
}
