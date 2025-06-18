import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';

import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiDeleteMessage.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiGetMessages.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiSendMessages.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/GetMessagesModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/BubbleNormal.dart';
import 'package:colibricmflutter/Widget/BubbleNormalAudio.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/MessagesColor.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessagesChatScreen extends StatefulWidget {
  const MessagesChatScreen(
      {super.key, required this.title, required this.id, required this.avat});
  final String title;
  final String id;
  final String avat;

  @override
  State<MessagesChatScreen> createState() => _MessagesChatScreenState();
}

class _MessagesChatScreenState extends State<MessagesChatScreen> {
  createFloating({required i, required text, required id}) {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: Get.height * 0.05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.grey),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: ColorThame,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          data.removeAt(i);
                          Get.back();
                          ApiDeleteMessage.delte(mess: id);
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                ),
                CircleAvatar(
                  backgroundColor: ColorThame,
                  child: IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: text));
                        Get.back();
                        Get.snackbar('Copy', "Copied to Clipboard");
                      },
                      icon: Icon(
                        Icons.copy,
                        color: Colors.white,
                      )),
                ),
                CircleAvatar(
                  backgroundColor: ColorThame,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      )),
                ),
              ],
            )),
      ),
    );
  }

  bool sendimages = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Timer? _timer;
  final ImagePicker picker = ImagePicker();
  XFile? ImagePost;
  String? filename;
  List<GetMessagesModel> data = [];
  String ofsetDwon = '';
  String ofsetUp = '';
  Future<void> UplodeImage(send) async {
    await Permission.storage.request();
    await Permission.photos.request();
    final XFile? image = await picker.pickImage(source: send);
    print(picker);
    ImagePost = image;

    print(ImagePost!.path);
    if (ImagePost != null) {
      Get.dialog(Scaffold(
        body: Stack(
          children: [
            sendimages
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                    setState(() {
                                      ImagePost == null;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_back_ios_new)),
                              IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      sendimages == true;
                                    });
                                    await ApiSendMessages.send(
                                        usd: widget.id,
                                        ty: ImagePost == null
                                            ? 'text'
                                            : 'media',
                                        ms: '',
                                        images: ImagePost == null
                                            ? ''
                                            : ImagePost!.path);

                                    Get.back();
                                  },
                                  icon: Icon(Icons.send))
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: Get.height * 0.88,
                            width: Get.width,
                            child: Image.file(
                              File(ImagePost!.path),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ));
    }

    setState(() {});
  }

  void Messages() {
    ApiGetMessages.fetch(
            id: widget.id,
            ofsetdown: ofsetDwon,
            ofsetdup: '',
            litmet: Home_Post_Limit)
        .then((value) {
      setState(() {
        data = value.toList();
        ofsetDwon = value[value.length - 1].id.toString();
        ofsetUp = value[0].id.toString();
      });
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      ApiGetMessages.fetch(
              id: widget.id,
              ofsetdown: ofsetDwon,
              ofsetdup: '',
              litmet: 'Home_Post_Limit')
          .then((value) {
        if (value.length > 0) {
          setState(() {
            ofsetDwon = value[value.length - 1].id.toString();
            data.addAll(value.toList());

            print('ameen');
          });
        }
      });
    });
  }

  @override
  void initState() {
    Messages();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  onlod() async {
    print(ofsetUp);
    ApiGetMessages.fetch(
            id: widget.id, ofsetdown: '', ofsetdup: ofsetUp, litmet: '100')
        .then((value) {
      setState(() {
        data.addAll(value.toList());
        ofsetUp = data[0].id.toString();
        _refreshController.refreshCompleted();
      });
    });
  }

  Widget build(BuildContext context) {
    final now = new DateTime.now();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: Get.height * 0.12,
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.error_outline_outlined))
        ],
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 15,
                backgroundImage: CachedNetworkImageProvider(widget.avat),
              ),
            ),
            Text(
              widget.title,
              style: SafeGoogleFont(Fonts.font1, fontSize: 18),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          SmartRefresher(
            reverse: true,
            onLoading: onlod,
            enablePullUp: true,
            enablePullDown: false,
            controller: _refreshController,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: <Widget>[
                  for (var i = 0; i < data.length; i++)
                    Column(
                      children: [
                        if (data[i].side == 'left')
                          if (data[i].media_type == 'audio')
                            InkWell(
                              onLongPress: () {
                                createFloating(
                                    i: i,
                                    text: data[i].media_file,
                                    id: data[i].id.toString());
                              },
                              child: AudoMessages(
                                urls: data[i].audio_record,
                                owner: false,
                              ),
                            ),
                        if (data[i].side == 'right')
                          if (data[i].media_type == 'audio')
                            InkWell(
                              onLongPress: () {
                                createFloating(
                                    i: i,
                                    text: data[i].media_file,
                                    id: data[i].id.toString());
                              },
                              child: AudoMessages(
                                urls: data[i].audio_record,
                                owner: true,
                              ),
                            ),
                        if (data[i].side == 'left')
                          if (data[i].media_type == 'none')
                            if (data[i].deleted_fs1 == 'N')
                              InkWell(
                                onLongPress: () {
                                  createFloating(
                                      i: i,
                                      text: data[i].message,
                                      id: data[i].id.toString());
                                },
                                child: BubbleNormal(
                                  text: data[i].message,
                                  isSender: false,
                                  color: ColorThame,
                                  tail: true,
                                  textStyle: SafeGoogleFont(Fonts.font1,
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                        if (data[i].side == 'left')
                          if (data[i].media_type == 'none')
                            if (data[i].deleted_fs1 == 'Y')
                              InkWell(
                                onLongPress: () {
                                  createFloating(
                                      i: i,
                                      text: data[i].message,
                                      id: data[i].id.toString());
                                },
                                child: Row(
                                  children: [
                                    BubbleNormal(
                                      text: 'This message has been deleted',
                                      isSender: false,
                                      color: Colors.grey,
                                      tail: true,
                                      textStyle: SafeGoogleFont(Fonts.font1,
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 12,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                        if (data[i].side == 'right')
                          if (data[i].media_type == 'none')
                            InkWell(
                              onLongPress: () {
                                createFloating(
                                    i: i,
                                    text: data[i].message,
                                    id: data[i].id.toString());
                              },
                              child: BubbleNormal(
                                text: data[i].message,
                                textStyle: SafeGoogleFont(Fonts.font1,
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                isSender: true,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Color(0xFFE8E8EE),
                                seen: data[i].seen == '0' ? false : true,
                              ),
                            ),
                        if (data[i].side == 'right')
                          if (data[i].media_type == 'image')
                            InkWell(
                              onLongPress: () {
                                createFloating(
                                    i: i,
                                    text: data[i].media_file,
                                    id: data[i].id.toString());
                              },
                              child: BubbleNormalImage(
                                isSender: true,
                                id: 'id001',
                                image: _image(data[i].media_file),
                                color: Colors.blue,
                              ),
                            ),
                        if (data[i].side == 'left')
                          if (data[i].media_type == 'image')
                            if (data[i].deleted_fs1 == 'N')
                              InkWell(
                                onLongPress: () {
                                  createFloating(
                                      i: i,
                                      text: data[i].media_file,
                                      id: data[i].id.toString());
                                },
                                child: BubbleNormalImage(
                                  isSender: false,
                                  id: data[i].id.toString(),
                                  image: _image(data[i].media_file),
                                  color: Colors.purpleAccent,
                                ),
                              ),
                        if (data[i].deleted_fs1 == 'Y')
                          Row(
                            children: [
                              BubbleNormal(
                                text: 'This message has been deleted',
                                isSender: false,
                                color: Colors.grey,
                                tail: true,
                                textStyle: SafeGoogleFont(Fonts.font1,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.remove_red_eye_sharp,
                                size: 12,
                                color: Colors.grey,
                              )
                            ],
                          ),
                      ],
                    ),

                  // DateChip(
                  //   date: new DateTime(now.year, now.month, now.day - 2),
                  // ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: Get.width,
                color: const Color.fromARGB(82, 158, 158, 158),
                height: 1,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              MessageBar(
                onTextChanged: (p0) {},
                messageBarColor: Theme.of(context).scaffoldBackgroundColor,
                onSend: (_) {
                  ApiSendMessages.send(
                      usd: widget.id,
                      ty: ImagePost == null ? 'text' : 'media',
                      ms: _,
                      images: ImagePost == null ? '' : ImagePost!.path);
                },
                actions: [
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: InkWell(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 24,
                      ),
                      onTap: () {
                        UplodeImage(ImageSource.gallery);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _image(url) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 20.0,
        minWidth: 20.0,
      ),
      child: CachedNetworkImage(
        imageUrl: url,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class AudoMessages extends StatefulWidget {
  const AudoMessages({super.key, required this.urls, required this.owner});
  final String urls;
  final bool owner;

  @override
  State<AudoMessages> createState() => AudoMessagesState();
}

class AudoMessagesState extends State<AudoMessages> {
  final audioPlayer = AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(new Duration(seconds: value.toInt()));
    });
  }

  _playAudio() async {
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(widget.urls));

      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = true;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = new Duration();
        position = new Duration();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BubbleNormalAudio(
      isSender: widget.owner,
      color: Get.isDarkMode ? Colors.black : Color(0xFFE8E8EE),
      duration: duration.inSeconds.toDouble(),
      position: position.inSeconds.toDouble(),
      isPlaying: isPlaying,
      isLoading: isLoading,
      isPause: isPause,
      onSeekChanged: _changeSeek,
      onPlayPauseButtonClick: _playAudio,
    );
  }
}

// class Temp extends StatefulWidget {
//   @override
//   _TempState createState() => _TempState();
// }

// class _TempState extends State<Temp> {
//   GlobalKey floatingKey = LabeledGlobalKey("Floating");
//   bool isFloatingOpen = false;
//   late OverlayEntry floating;

//   OverlayEntry createFloating() {
//     RenderBox? renderBox =
//         floatingKey.currentContext!.findRenderObject() as RenderBox?;
//     Offset offset = renderBox!.localToGlobal(Offset.zero);
//     return OverlayEntry(builder: (context) {
//       return Positioned(
//           left: offset.dx,
//           width: renderBox!.size.width,
//           top: offset.dy - 50,
//           child: Material(
//               elevation: 20,
//               child: Container(
//                   height: 50,
//                   color: Colors.blue,
//                   child: Text("I'm floating overlay"))));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: ElevatedButton(
//         key: floatingKey,
//         onPressed: () {},
//         child: Container(),
//       )),
//     );
//   }
// }
