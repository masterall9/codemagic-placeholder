import 'package:audioplayers/audioplayers.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/audio_info.dart';
import 'package:colibricmflutter/controllers/utrlsAudio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetAudioRecord extends StatefulWidget {
  const WidgetAudioRecord({super.key, required this.urlsSong});
  final String urlsSong;

  @override
  State<WidgetAudioRecord> createState() => _WidgetAudioRecordState();
}

class _WidgetAudioRecordState extends State<WidgetAudioRecord> {
  bool isPlaying = false;
  late final AudioPlayer player;
  late final UrlSource path;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = await UrlSource(widget.urlsSong);

    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    // set a callback for position change
    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    // set a callback for when audio ends
    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.urlsSong);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Slider(
            value: _position.inSeconds.toDouble(),
            onChanged: (value) async {
              await player.seek(Duration(seconds: value.toInt()));
              setState(() {});
            },
            min: 0,
            max: _duration.inSeconds.toDouble(),
            inactiveColor: Colors.grey,
            activeColor: ColorThame,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(_duration.format()),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: playPause,
              child: Icon(
                isPlaying ? Icons.pause_circle : Icons.play_circle,
                color: ColorThame,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
