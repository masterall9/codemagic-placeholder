// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:colibricmflutter/Utlit/TextUtil.dart';
// import 'package:colibricmflutter/Widget/Colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class WidgetHomeVideo extends StatefulWidget {
//   const WidgetHomeVideo({super.key, required this.videoUrl});
//   final String videoUrl;

//   @override
//   State<WidgetHomeVideo> createState() => _WidgetHomeVideoState();
// }

// class _WidgetHomeVideoState extends State<WidgetHomeVideo> {
//   @override
//   late VideoPlayerController videoPlayerController;
//   late CustomVideoPlayerController _customVideoPlayerController;
//   void initState() {
//     print(accounts[0]['sm0'] + widget.videoUrl);
//     super.initState();
//     videoPlayerController = VideoPlayerController.network(
//         accounts[0]['sm0'] + '/' + widget.videoUrl)
//       ..initialize().then((value) => setState(() {}));
//     _customVideoPlayerController = CustomVideoPlayerController(
//         context: context,
//         videoPlayerController: videoPlayerController,
//         customVideoPlayerSettings: CustomVideoPlayerSettings(
//           exitFullscreenOnEnd: true,
//           controlBarDecoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//                 topRight: Radius.circular(20)),
//             color: ColorThame,
//           ),
//         ));
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Container(
//         width: Get.width * 0.70,
//         child: CustomVideoPlayer(
//             customVideoPlayerController: _customVideoPlayerController),
//       ),
//     );
//   }
// }
