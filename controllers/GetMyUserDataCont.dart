import 'package:colibricmflutter/Utlit/Serves/Api/ApiGetDataProfileId.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/GetProfileDataModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetMyUserDataCont extends GetxController {
  RxBool isloding = false.obs;
  RxString userid = ''.obs;
  RxList<GetProfileDataModel> data = <GetProfileDataModel>[].obs;
  RxString avatar = ''.obs;

  void onof() {
    isloding.value = !isloding.value;
  }

  @override
  void onInit() {
    getUserdata();

    super.onInit();
  }

  // print(Get.arguments['user_id']);

  void getUserdata() async {
    final prefs = await SharedPreferences.getInstance();

    final String? myuserid = prefs.getString('user_id');
    ApiGetDataProfileId.fetch(await myuserid.toString(), '').then((ameen) {
      data.value = ameen.toList();
      avatar.value = ameen[ameen.length - 1].avatar;
    });

    update();
  }

  void updi() async {
    final prefs = await SharedPreferences.getInstance();

    final String? myuserid = prefs.getString('user_id');
    ApiGetDataProfileId.fetch(await myuserid.toString(), '').then((ameen) {
      data.value = ameen.toList();
    });

    update();
  }

  /////////////////////
  ///
  ///
  ///
}

// void GetPosts() async {
//   ApiPosts.Getposts('0').then((value) {
//     data = value.toList();
//   });
//   var list = await ApiPosts.Getposts('0');
//   lastId = list[list.length - 1].post_id;

//   update();
// }

class ControllerViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );
  }
}
