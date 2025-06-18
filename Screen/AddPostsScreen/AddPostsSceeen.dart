import 'dart:async';
import 'dart:io';
import 'package:colibricmflutter/Widget/WidgetAudioPlay.dart';
import 'package:colibricmflutter/Widget/WidgetAudioRecord.dart';
import 'package:colibricmflutter/Widget/WidgetRecord.dart';
import 'package:record/record.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiAddPosts.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUplodeImage.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/VideoAssets.dart';
import 'package:colibricmflutter/Widget/WidgetTopKeypord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giphy_get/giphy_get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddPostsScreen extends StatefulWidget {
  const AddPostsScreen(
      {super.key, required this.refresh, required this.thread_id});
  final refresh;
  final String thread_id;
  @override
  State<AddPostsScreen> createState() => _AddPostsScreenState();
}

class _AddPostsScreenState extends State<AddPostsScreen> {
  late Record audioRecord;

  bool isRecoridng = false;
  String audioPath = '';

  SocialContentDetection lastDetection =
      SocialContentDetection(DetectedType.plain_text, TextRange.empty, "");
  FocusNode _focusNode = FocusNode();
  late final EdgeInsets viewInsets;

  final TextEditingController poll1 = TextEditingController();
  final TextEditingController poll2 = TextEditingController();
  final TextEditingController poll3 = TextEditingController();
  final TextEditingController poll4 = TextEditingController();
  final TextEditingController poll5 = TextEditingController();
  final TextEditingController poll6 = TextEditingController();
  final TextEditingController poll7 = TextEditingController();
  late StreamSubscription<SocialContentDetection> _streamSubscription;
  late final SocialTextEditingController _textEditingController;
  late final TextRange lastDetectedRange;

  ScrollController _scrollController = ScrollController();
  final ImagePicker picker = ImagePicker();
  XFile? ImagePost;
  String? filename;
  int addNewPoll = 2;
  XFile? videoUp;
  int plusNewpoll = 2;

  void onDetectContent(SocialContentDetection detection) {
    print("Detected Contet: $detection");
  }

  Future<void> vedioupolde(send) async {
    await Permission.storage.request();
    await Permission.photos.request();

    final XFile? video = await picker.pickVideo(source: send);

    videoUp = video;
    filename = videoUp!.path.split('/').last;

    setState(() {});
  }

  Future<void> UplodeImage(send) async {
    await Permission.storage.request();
    await Permission.photos.request();
    final XFile? image = await picker.pickImage(source: send);
    print(picker);
    ImagePost = image;
    print(ImagePost!.path);

    setState(() {});
  }

  String gifImages = '';
  void OnTap() async {
    if (ImagePost != null) {
      var ameen =
          await ApiUplodeImage.add(file: ImagePost!.path, type: 'image');
    }
    if (videoUp != null) {
      var ameen = await ApiUplodeImage.add(file: videoUp!.path, type: 'video');
    }
    Get.back();
    await ApiAddPosts.add(
        gif: gifImages,
        thread_id: widget.thread_id,
        text: _textEditingController.text,
        poll1: poll1.text,
        poll2: poll2.text,
        poll3: poll3.text,
        poll4: poll4.text,
        poll5: poll5.text,
        poll6: poll6.text,
        poll7: poll7.text);
    widget.refresh();
  }

  bool newPool = false;
  @override
  void initState() {
    super.initState();

    audioRecord = Record();
    _textEditingController = SocialTextEditingController()
      ..text = ""
      ..setTextStyle(
          DetectedType.mention,
          TextStyle(
              color: Colors.purple,
              backgroundColor: Colors.purple.withAlpha(50)))
      ..setTextStyle(DetectedType.url,
          TextStyle(color: Colors.blue, decoration: TextDecoration.underline))
      ..setTextStyle(DetectedType.hashtag,
          TextStyle(color: Colors.blue, fontWeight: FontWeight.w600));

    _streamSubscription =
        _textEditingController.subscribeToDetection(onDetectContent);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _streamSubscription.cancel();
    _textEditingController.dispose();
    _scrollController.dispose();

    audioRecord = Record();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
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
      String? path = await audioRecord.stop();
      setState(() {
        isRecoridng = false;
        audioPath = path!;
      });
    } catch (e) {
      print('Erorr stoping Recording : $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: ColorThame,
                          fontSize: 17,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: OnTap,
                    child: Container(
                      width: 67,
                      height: 34,
                      decoration: ShapeDecoration(
                        color: ColorThame,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Tweet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        leading: SizedBox(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: TopKepord(
          footer: Container(
            height: audioPath != ''
                ? newPool
                    ? MediaQuery.of(context).viewInsets.bottom > 0
                        ? Get.height * 0.40
                        : Get.height * 0.90
                    : Get.height * 0.56
                : Get.height * 0.20,
            child: Column(
              children: [
                if (videoUp != null)
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.dialog(Scaffold(
                            appBar: AppBar(),
                            body: VideoAssets(
                                videoPlayerController:
                                    VideoPlayerController.file(
                                        File(videoUp!.path)),
                                looping: true),
                          ));
                        },
                        child: Container(
                          height: Get.height * 0.1,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              videoUp = null;
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    ],
                  ),
                if (newPool)
                  Container(
                    width: Get.width,
                    height: Get.height * 0.30,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(56, 158, 158, 158),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      newPool = false;
                                      poll1.clear();
                                      poll2.clear();
                                      poll3.clear();
                                      poll4.clear();
                                      poll5.clear();
                                      poll6.clear();
                                      poll7.clear();
                                    });
                                  },
                                  child: CircleAvatar(
                                    maxRadius: 12,
                                    backgroundColor: ColorThame,
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(118, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: TextField(
                                      controller: poll1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Question 1'.tr,
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(118, 158, 158, 158),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: TextField(
                                      controller: poll2,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Question 2'.tr,
                                        hintStyle: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                if (2 < addNewPoll)
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                118, 158, 158, 158),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: TextField(
                                            controller: poll3,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Question 3'.tr,
                                              hintStyle: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                //     if (3 < addNewPoll)
                                //       Column(
                                //         children: [
                                //           SizedBox(
                                //             height: Get.height * 0.01,
                                //           ),
                                //           Container(
                                //             decoration: BoxDecoration(
                                //                 color: Color.fromARGB(
                                //                     118, 158, 158, 158),
                                //                 borderRadius:
                                //                     BorderRadius.circular(20)),
                                //             child: Padding(
                                //               padding: const EdgeInsets.symmetric(
                                //                   horizontal: 5),
                                //               child: TextField(
                                //                 controller: poll4,
                                //                 decoration: InputDecoration(
                                //                   border: InputBorder.none,
                                //                   hintText: 'Question 4'.tr,
                                //                   hintStyle: GoogleFonts.poppins(
                                //                       fontSize: 10,
                                //                       fontWeight: FontWeight.w400),
                                //                 ),
                                //                 maxLines: 1,
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     if (4 < addNewPoll)
                                //       Column(
                                //         children: [
                                //           SizedBox(
                                //             height: Get.height * 0.01,
                                //           ),
                                //           Container(
                                //             decoration: BoxDecoration(
                                //                 color: Color.fromARGB(
                                //                     118, 158, 158, 158),
                                //                 borderRadius:
                                //                     BorderRadius.circular(20)),
                                //             child: Padding(
                                //               padding: const EdgeInsets.symmetric(
                                //                   horizontal: 5),
                                //               child: TextField(
                                //                 controller: poll5,
                                //                 decoration: InputDecoration(
                                //                   border: InputBorder.none,
                                //                   hintText: 'Question 5'.tr,
                                //                   hintStyle: GoogleFonts.poppins(
                                //                       fontSize: 10,
                                //                       fontWeight: FontWeight.w400),
                                //                 ),
                                //                 maxLines: 1,
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     if (5 < addNewPoll)
                                //       Column(
                                //         children: [
                                //           SizedBox(
                                //             height: Get.height * 0.01,
                                //           ),
                                //           Container(
                                //             decoration: BoxDecoration(
                                //                 color: Color.fromARGB(
                                //                     118, 158, 158, 158),
                                //                 borderRadius:
                                //                     BorderRadius.circular(20)),
                                //             child: Padding(
                                //               padding: const EdgeInsets.symmetric(
                                //                   horizontal: 5),
                                //               child: TextField(
                                //                 controller: poll6,
                                //                 decoration: InputDecoration(
                                //                   border: InputBorder.none,
                                //                   hintText: 'Question 6'.tr,
                                //                   hintStyle: GoogleFonts.poppins(
                                //                       fontSize: 10,
                                //                       fontWeight: FontWeight.w400),
                                //                 ),
                                //                 maxLines: 1,
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     if (6 < addNewPoll)
                                //       Column(
                                //         children: [
                                //           SizedBox(
                                //             height: Get.height * 0.01,
                                //           ),
                                //           Container(
                                //             decoration: BoxDecoration(
                                //                 color: Color.fromARGB(
                                //                     118, 158, 158, 158),
                                //                 borderRadius:
                                //                     BorderRadius.circular(20)),
                                //             child: Padding(
                                //               padding: const EdgeInsets.symmetric(
                                //                   horizontal: 5),
                                //               child: TextField(
                                //                 controller: poll7,
                                //                 decoration: InputDecoration(
                                //                   border: InputBorder.none,
                                //                   hintText: 'Question 7'.tr,
                                //                   hintStyle: GoogleFonts.poppins(
                                //                       fontSize: 10,
                                //                       fontWeight: FontWeight.w400),
                                //                 ),
                                //                 maxLines: 1,
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     SizedBox(
                                //       height: Get.height * 0.01,
                                //     ),
                                //     if (2 < addNewPoll)
                                //       InkWell(
                                //           onTap: () {
                                //             setState(() {
                                //               addNewPoll--;
                                //             });
                                //           },
                                //           child: CircleAvatar(
                                //               backgroundColor: ColorThame,
                                //               child: Icon(Icons.delete,
                                //                   color: Colors.white))),
                                //     SizedBox(
                                //       height: Get.height * 0.01,
                                //     ),
                                //     if (addNewPoll != 7)
                                //       InkWell(
                                //         onTap: () {
                                //           setState(() {
                                //             addNewPoll++;
                                //             print(addNewPoll);
                                //           });
                                //         },
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //               color: ColorThame,
                                //               borderRadius:
                                //                   BorderRadius.circular(15)),
                                //           child: Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //             child: Center(
                                //                 child: Text('Add'.tr,
                                //                     style: GoogleFonts.cairo(
                                //                         fontWeight: FontWeight.bold,
                                //                         color: Colors.white,
                                //                         fontSize: 16))),
                                //           ),
                                //         ),
                                //       )

                                // sss
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (audioPath != '') WidgetAudioRecord(urlsSong: audioPath),
                if (videoUp == null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: Get.width * 0.2,
                          height:
                              newPool ? Get.height * 0.0 : Get.height * 0.11,
                          child: Stack(
                            children: [
                              if (ImagePost != null)
                                InkWell(
                                  onTap: () {
                                    UplodeImage(ImageSource.gallery);
                                  },
                                  child: Positioned(
                                    left: 0,
                                    top: 0,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        width: Get.width * 0.17,
                                        height: Get.height * 0.1,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 0.17,
                                                color: Colors.blue),
                                            borderRadius:
                                                BorderRadius.circular(17),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: ColorThame,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (ImagePost != null)
                          Container(
                            width: Get.width * 0.70,
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.11,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Container(
                                                width: Get.width * 0.17,
                                                height: Get.height * 0.1,
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 0.17,
                                                        color: Colors.blue),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: Get.width,
                                                      height: Get.height,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.file(
                                                          File(ImagePost!.path),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              ImagePost = null;
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.remove_circle,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                98, 18, 13),
                                                          )),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                Row(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFBDC5CD),
                            blurRadius: 0,
                            offset: Offset(0, -0.33),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  UplodeImage(ImageSource.gallery);
                                },
                                child: SvgPicture.asset(
                                  'assets/images/Photo.svg',
                                  color: ColorThame,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  vedioupolde(ImageSource.gallery);
                                },
                                child: SvgPicture.asset(
                                  'assets/images/video.svg',
                                  color: ColorThame,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/images/Music.svg',
                                color: ColorThame,
                              ),
                              InkWell(
                                onTap: isRecoridng
                                    ? stopRecording
                                    : startRecording,
                                child: SvgPicture.asset(
                                  'assets/images/record.svg',
                                  color: isRecoridng ? Colors.red : ColorThame,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    newPool = !newPool;
                                    print(newPool);
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/images/pooll.svg',
                                  color: ColorThame,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  final gif = await GiphyGet.getGif(
                                    context: context, //Required
                                    apiKey: giphyApiKey, //Required.
                                    lang: GiphyLanguage
                                        .english, //Optional - Language for query.
                                    randomID:
                                        "abcd", // Optional - An ID/proxy for a specific user.
                                    tabColor: Colors
                                        .teal, // Optional- default accent color.
                                    debounceTimeInMilliseconds:
                                        350, // Optional- time to pause between search keystrokes
                                  );

                                  print(
                                      'ajkdikhksdasdhjaksl ${gif!.id.toString()}');
                                  setState(() {
                                    gifImages =
                                        'https://media0.giphy.com/media/${gif!.id.toString()}/giphy.gif';
                                  });

                                  if (gif!.bitlyUrl!.isNotEmpty) {
                                    OnTap();
                                    Get.back();
                                  }
                                },
                                child: SvgPicture.asset(
                                  'assets/images/Gif.svg',
                                  color: ColorThame,
                                ),
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    contmydata.avatar.value),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Get.width * 0.001,
                          ),
                          Container(
                            width: Get.width * 0.80,
                            height: MediaQuery.of(context).viewInsets.bottom > 0
                                ? newPool
                                    ? Get.height * 0.1
                                    : Get.height * 0.27
                                : newPool
                                    ? Get.height * 0.15
                                    : Get.height * 0.60,
                            child: DefaultSocialTextFieldController(
                              focusNode: _focusNode,
                              scrollController: _scrollController,
                              textEditingController: _textEditingController,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: TextField(
                                        maxLength: 600,
                                        scrollPhysics: ClampingScrollPhysics(),
                                        scrollController: _scrollController,
                                        focusNode: _focusNode,
                                        controller: _textEditingController,
                                        maxLines: null,
                                        minLines: null,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            label: Text(
                                              'What’s happening?',
                                              style: TextStyle(
                                                color: Color(0xFF687684),
                                                fontSize: 19,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: -0.50,
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // detectionBuilders: {
                              //   DetectedType.mention: (context) =>
                              //       mentionContent(200),
                              //   DetectedType.hashtag: (context) =>
                              //       hashtagContent(200),
                              //   DetectedType.url: (context) => urlContent(200)
                              // },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize mentionContent(double height) {
    return PreferredSize(
      child: ListView.builder(
          itemBuilder: (context, index) => ListTile(
                title: Text("@user_$index"),
                onTap: () {
                  _textEditingController.replaceRange(
                      "@user_$index", lastDetection.range);
                },
              )),
      preferredSize: Size.fromHeight(height),
    );
  }

  // PreferredSize hashtagContent(double height) {
  //   return PreferredSize(
  //     child: ListView.builder(
  //         itemBuilder: (context, index) => ListTile(
  //               title: Text("#hashtag_$index"),
  //               onTap: () {
  //                 _textEditingController.replaceRange(
  //                     "#hashtag_$index", lastDetection.range);
  //               },
  //             )),
  //     preferredSize: Size.fromHeight(height),
  //   );
  // }

  // PreferredSize urlContent(double height) {
  //   return PreferredSize(
  //     child: Container(
  //         alignment: Alignment.center,
  //         child: Text("A Website for url content")),
  //     preferredSize: Size.fromHeight(height),
  //   );
  // }
}
