import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

void DialogsSoon(context) {
  Dialogs.materialDialog(
      color: Colors.white,
      msg: 'In the next update it will be available',
      title: 'not available...',
      lottieBuilder: Lottie.asset(
        'assets/Svg/jsons.json',
        fit: BoxFit.contain,
      ),
      // customView: MySuperWidget(),
      customViewPosition: CustomViewPosition.BEFORE_ACTION,
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            Get.back();
          },
          text: 'Okay',
          iconData: Icons.done,
          color: Colors.blue,
          textStyle: TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}
