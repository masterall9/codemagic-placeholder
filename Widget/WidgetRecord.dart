import 'package:audioplayers/audioplayers.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:record/record.dart';

import 'package:flutter/material.dart';

class WidgetRecord extends StatefulWidget {
  WidgetRecord(
      {super.key, required this.audioRecord, required this.audioPlayer});
  Record audioRecord;
  AudioPlayer audioPlayer;

  @override
  State<WidgetRecord> createState() => _WidgetRecordState();
}

class _WidgetRecordState extends State<WidgetRecord> {
  bool isRecoridng = false;
  String audioPath = '';

  @override
  void initState() {
    widget.audioPlayer = AudioPlayer();
    widget.audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    widget.audioPlayer.dispose();
    widget.audioRecord.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await widget.audioRecord.hasPermission()) {
        await widget.audioRecord.start();
        setState(() {
          isRecoridng = true;
        });
      }
    } catch (e) {
      print('Erorr start Recording : $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await widget.audioRecord.stop();
      setState(() {
        isRecoridng = false;
        audioPath = path!;
      });
    } catch (e) {
      print('Erorr stoping Recording : $e');
    }
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: isRecoridng ? stopRecording : startRecording,
      child: SvgPicture.asset(
        'assets/images/record.svg',
        color: isRecoridng ? Colors.red : ColorThame,
      ),
    );
  }
}
