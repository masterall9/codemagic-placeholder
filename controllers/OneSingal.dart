import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void OneSignalNotf() async {
  await OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
  // await OneSignal.shared.setLogLevel(OSLogLevel.error, OSLogLevel.info);

  await OneSignal.shared.setAppId(onesignalKey);
  await OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  final status = await OneSignal.shared.getDeviceState();
  await Permission.notification.request();
  SharedP.Save(
    'onsin',
    status == null ? '' : status.userId.toString(),
  );

  print('askldjklasjdkljaskldjkla ${status!.userId.toString()}');
  open();
}

open() async {
  final status = await OneSignal.shared.getDeviceState();
  OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult openedResult) async {
    print('aklsdjklsajdkljasdkljsakldjsakld');
    var ameen = await openedResult.notification;

    print(
        'ameenjawadhamed333 ${openedResult.notification.additionalData?['type']}');
    print('ameenjawadhamed33331   ${openedResult.notification.additionalData}');

    // final type = openedResult.notification.additionalData?['type'];
    // final id = openedResult.notification.additionalData?['post_id'];
    // final user_id = openedResult.notification.additionalData?['user_id'];
    // final avat = openedResult.notification.additionalData?['licon'];
    // final tt = openedResult.notification.additionalData?['title'];
    final room_name = openedResult.notification.additionalData;

    // final title = openedResult.notification.title;
    print('ameenjawadhamed2223333111 ${room_name}');
    // if (room_name.toString().isNotEmpty) {}
    // Get.back();
    // print(type);
    // if (type == 'reaction')
    //   Get.to(ScreenOnePosts(),
    //       arguments: ({'post_id': id.toString(), 'title': 'reaction'}));
    // if (type == 'comment')
    //   Get.to(ScreenOnePosts(),
    //       arguments: ({'post_id': id.toString(), 'title': 'comment'}));
    // if (type == 'following')
    //   Get.toNamed(Routes.profileUserScreen,
    //       arguments: ({
    //         'user_id': user_id.toString(),
    //         'avatar': '',
    //         'cover': '',
    //       }));
    // if (type == 'visited_profile')
    //   Get.toNamed(Routes.profileUserScreen,
    //       arguments: ({
    //         'user_id': user_id.toString(),
    //         'avatar': '',
    //         'cover': '',
    //       }));
    // Get.to(TestWidget(
    //   text2: type == 'visited_profile' ? 'زار صفحتك' : id.toString(),
    // ));
  });
}
