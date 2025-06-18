import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAssets extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const VideoAssets(
      {Key, key, required this.videoPlayerController, required this.looping})
      : super(key: key);

  @override
  _VideoAssetsState createState() => _VideoAssetsState();
}

class _VideoAssetsState extends State<VideoAssets> {
  late ChewieController videosController;

  @override
  void initState() {
    super.initState();

    videosController = ChewieController(
      startAt: Duration.zero,
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 16,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return progressBar();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    videosController.dispose();
  }

  Widget progressBar() {
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chewie(
        controller: videosController,
      ),
    );
  }
}
