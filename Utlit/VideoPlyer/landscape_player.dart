import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'landscape_player_controls.dart';

class LandscapePlayer extends StatefulWidget {
  LandscapePlayer({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _LandscapePlayerState createState() => _LandscapePlayerState();
}

class _LandscapePlayerState extends State<LandscapePlayer> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network(accounts[0]['sm0'] + '/' + widget.url)
          ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings:
            CustomVideoPlayerSettings(autoFadeOutControls: false));
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoPlayVido
        ? VisibilityDetector(
            key: ObjectKey(videoPlayerController),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction == 0 && this.mounted) {
                videoPlayerController?.pause(); //pausing  functionality
              } else {
                setState(() {
                  videoPlayerController?.play();
                });
              }
            },
            child: Container(
              width: Get.width * 0.80,
              child: CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          )
        : Container(
            width: Get.width * 0.80,
            child: CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController),
          );
  }
}
