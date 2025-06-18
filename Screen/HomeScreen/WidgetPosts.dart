import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/AddPostsScreen/AddPostsSceeen.dart';
import 'package:colibricmflutter/Screen/Comments/CommentScreen.dart';
import 'package:colibricmflutter/Screen/Comments/ReplayCommentScreen.dart';
import 'package:colibricmflutter/Screen/MyProfile/MyPorfileScreen.dart';
import 'package:colibricmflutter/Screen/ProfileUserScreen/ProfileUserScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiLike.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiRepsosted.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ControllerApi.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Utlit/VideoPlyer/landscape_player.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/DilogSoon.dart';
import 'package:colibricmflutter/Widget/WIdgetMore.dart';
import 'package:colibricmflutter/Widget/WidgetAudioPlay.dart';
import 'package:colibricmflutter/Widget/WidgetPoll.dart';
import 'package:colibricmflutter/Widget/WidgetZoomImages.dart';
import 'package:detectable_text_field/detectable_text_field.dart';
import 'package:detectable_text_field/detector/detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetPosts extends StatelessWidget {
  const WidgetPosts({
    super.key,
    required this.avatar,
    required this.verified,
    required this.reposter_name,
    required this.reposter_username,
    required this.name,
    required this.username,
    required this.time,
    required this.polls,
    required this.likes_count,
    required this.text,
    required this.og_image,
    required this.type,
    required this.has_liked,
    required this.replys_count,
    required this.reposts_count,
    required this.id,
    required this.ontapSave,
    required this.media,
    required this.user_id,
    required this.is_owner,
    required this.is_repost,
    required this.removepost,
    required this.has_saved,
    required this.is_donation_post,
    required this.donation_amount,
    required this.donation_raised,
    required this.donations_total,
    required this.donation_raised_percent,
    required this.commentButton,
    required this.thread_id,
    required this.refresh,
  });
  final String thread_id;
  final int donations_total;
  final int donation_raised_percent;
  final String avatar;
  final int id;
  final String verified;
  final bool has_liked;
  final String username;
  final String time;
  final int likes_count;
  final String reposter_name;
  final String reposter_username;
  final String name;
  final String text;
  final String replys_count;
  final int reposts_count;
  final String og_image;
  final media;
  final polls;
  final String type;
  final int user_id;
  final bool is_owner;
  final bool is_repost;
  final removepost;
  final bool has_saved;
  final ontapSave;
  final String is_donation_post;
  final String donation_amount;
  final String donation_raised;
  final int commentButton;
  final refresh;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: commentButton == 2
                  ? null
                  : Get.isDarkMode
                      ? Color(0xff16202B)
                      : Color.fromARGB(255, 254, 252, 252),
              boxShadow: [
                commentButton == 2
                    ? BoxShadow(
                        color: Theme.of(context).scaffoldBackgroundColor)
                    : BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 5),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.02, horizontal: Get.width * 0.016),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            if (is_owner) {
                              Get.to(MyProfileScreen());
                            } else {
                              Get.to(ProfileUserScreen(
                                user_id: user_id.toString(),
                                user_name: '',
                              ));
                            }
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Get.isDarkMode ? Colors.black : ColorThame,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(avatar),
                                    maxRadius: 22,
                                  ),
                                ),
                              ),
                              if (verified == '1')
                                Image.asset(
                                  'assets/images/varfi.png',
                                  scale: 1.7,
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (reposter_name.isNotEmpty)
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Retweet stroke icon.png',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: Get.width * 0.03,
                              ),
                              Text(
                                '${reposter_name} Retweeted',
                                style: TextStyle(
                                  color: Color(0xFF687684),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        Container(
                          width: Get.width * 0.80,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: name,
                                  style: TextStyle(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                TextSpan(
                                  text: '@${username} · ${ConvText(time)}',
                                  style: TextStyle(
                                    color: Color(0xFF687684),
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        if (commentButton == 2) Text('This Is Commet'),
                        if (text.isNotEmpty)
                          Tooltip(
                            preferBelow: true,
                            message: 'Copy'.tr,
                            onTriggered: () {
                              Clipboard.setData(new ClipboardData(
                                  text: utf8convertText(text)));
                            },
                            child: Container(
                              width: Get.width * 0.80,
                              child: DetectableText(
                                trimCollapsedText: '\nSee More...'.tr,
                                trimExpandedText: '\nShow less'.tr,
                                // trimExpandedText: 'show less'.tr,
                                // trimCollapsedText: 'read more'.tr,
                                trimLines: 4,

                                text: parseHtmlString(text),
                                detectedStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                                basicStyle: GoogleFonts.cairo(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                onTap: (tappedText) async {
                                  if (hasHashTags(
                                      tappedText..startsWith('#'))) {
                                    if (tappedText.startsWith('#')) {
                                      print(tappedText);
                                    }
                                  }
                                  ;

                                  RegExp exp = RegExp(
                                      "([@]([$detectionContentLetters]+))|$urlRegexContent",
                                      multiLine: true);

                                  Iterable<RegExpMatch> matches =
                                      exp.allMatches(utf8convertText(text));
                                  for (final m in matches) {
                                    if (m[0].toString().isNotEmpty) {
                                      if (m[0].toString().startsWith('@')) {
                                        print(
                                            'mumo ${m[0].toString().replaceAll('@', '')}');
                                        Get.to(ProfileUserScreen(
                                          user_name: m[0]
                                              .toString()
                                              .replaceAll('@', ''),
                                          user_id: '',
                                        ));
                                      } else if (m[0]
                                          .toString()
                                          .startsWith('http')) {
                                        print('url ${m[0]}');
                                      }
                                    }
                                  }
                                },
                                detectionRegExp: RegExp(
                                  "(?!\\n)(?:^|\\s)([#@]([$detectionContentLetters]+))|$urlRegexContent",
                                  multiLine: true,
                                ),
                              ),
                            ),
                          ),
                        if (is_donation_post == 'Y')
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${donation_raised}\$',
                                      style: SafeGoogleFont(Fonts.font1,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.01,
                                    ),
                                    Text(
                                      'raised of 10\$ goal',
                                      style: SafeGoogleFont(Fonts.font1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Container(
                                  width: Get.width * 0.80,
                                  child: GFProgressBar(
                                    circleWidth: 50,
                                    percentage: double.parse(
                                        '0.${donation_raised_percent}'),
                                    lineHeight: 20,
                                    alignment: MainAxisAlignment.spaceBetween,
                                    child: Text(
                                      '${donation_raised_percent}%',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.green),
                                    ),
                                    leading: Icon(Icons.sentiment_dissatisfied,
                                        color: Colors.red),
                                    trailing: Icon(Icons.sentiment_satisfied,
                                        color: Colors.green),
                                    backgroundColor: Colors.black12,
                                    progressBarColor: Colors.blue,
                                  ),
                                ),
                                Container(
                                  width: Get.width * 0.70,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${donations_total} donations'),
                                      Text(
                                          '${int.parse(donation_amount) - int.parse(donation_raised)}\$ to go')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                InkWell(
                                  onTap: () {
                                    DialogsSoon(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorThame,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                      child: Text(
                                        'Donate now',
                                        style: SafeGoogleFont(Fonts.font1,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (type == 'poll')
                          WidgetPoll(
                            id: id,
                            polls: polls,
                          ),
                        if (type == 'audio')
                          Container(
                            width: Get.width * 0.80,
                            child: WidgetAudioPlay(
                              urlsSong: accounts[0]['sm0'] +
                                  '/' +
                                  media[0]['src'].toString(),
                            ),
                          ),
                        // AudoMessages(
                        //   urls: accounts[0]['sm0'] +
                        //       '/' +
                        //       media[0]['src'].toString(),
                        //   owner: false,
                        // ),
                        if (type == 'gif')
                          InkWell(
                            onTap: () {
                              Get.to(WidgetZoomImages(
                                images: media[0]['src'].toString(),
                              ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: media[0]['src'].toString(),
                                width: Get.width * 0.80,
                              ),
                            ),
                          ),
                        if (type == 'video')
                          LandscapePlayer(
                            url: media[0]['src'].toString(),
                          ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        if (og_image.isNotEmpty)
                          if (type == 'image')
                            InkWell(
                              onTap: () {
                                Get.to(WidgetZoomImages(
                                  images: og_image,
                                ));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: og_image,
                                  width: Get.width * 0.80,
                                ),
                              ),
                            ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        WidgetBodyPosts(
                          refresh: refresh,
                          commentButton: commentButton,
                          ontapSave: ontapSave,
                          reomvepost: removepost,
                          is_repost: is_repost,
                          post_id: id.toString(),
                          thread_id: thread_id,
                          has_liked: has_liked,
                          replys_count: replys_count,
                          reposts_count: reposts_count,
                          likes_count: likes_count,
                          is_owner: is_owner,
                          postText: text,
                          has_saved: has_saved,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (commentButton == 2)
            Column(
              children: [
                Container(
                  width: Get.width,
                  height: 0.3,
                  color: const Color.fromARGB(255, 107, 107, 107),
                ),
              ],
            )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class WidgetBodyPosts extends StatefulWidget {
  WidgetBodyPosts({
    super.key,
    required this.is_repost,
    required this.replys_count,
    required this.reposts_count,
    required this.likes_count,
    required this.has_liked,
    required this.post_id,
    required this.is_owner,
    required this.reomvepost,
    required this.postText,
    required this.has_saved,
    required this.ontapSave,
    required this.commentButton,
    required this.thread_id,
    required this.refresh,
  });
  final refresh;
  final String thread_id;
  bool is_owner;
  final String replys_count;
  int reposts_count;
  int likes_count;
  bool has_liked;
  final String post_id;
  bool is_repost;
  final reomvepost;
  final String postText;
  bool has_saved;
  final ontapSave;
  final int commentButton;

  @override
  State<WidgetBodyPosts> createState() => _WidgetBodyPostsState();
}

class _WidgetBodyPostsState extends State<WidgetBodyPosts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        width: Get.width * 0.80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (widget.commentButton == 1) {
                  Get.to(AddPostsScreen(
                    thread_id: widget.post_id,
                    refresh: widget.refresh,
                  ));
                } else if (widget.commentButton == 0) {
                  Get.to(CommentsScreen(
                    id: widget.post_id,
                  ));
                } else if (widget.commentButton == 2) {
                  Get.to(ReplayCommentScreen(
                    id: widget.post_id,
                  ));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/Svg/Comment.svg',
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Text(widget.replys_count)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  widget.is_repost = !widget.is_repost;
                  if (widget.is_repost) {
                    widget.reposts_count++;
                  } else {
                    widget.reposts_count--;
                  }
                });
                await ApiRepsosted.fo(poso: widget.post_id);
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/Svg/Replay2.svg',
                        color: widget.is_repost ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      Text(
                        widget.reposts_count.toString(),
                        style: TextStyle(
                            color: widget.is_repost ? Colors.blue : null),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (widget.has_liked) {
                  setState(() {
                    widget.has_liked = false;
                    widget.likes_count--;
                  });
                  await ApiLike.fo(poso: widget.post_id);
                } else {
                  setState(() {
                    widget.has_liked = true;
                    widget.likes_count++;
                  });
                  await ApiLike.fo(poso: widget.post_id);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Heart stroke icon.png',
                      scale: widget.has_liked ? 1.3 : 1.6,
                      color: widget.has_liked ? Colors.red : Colors.grey,
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Text(
                      widget.likes_count.toString(),
                      style: TextStyle(
                        color: widget.has_liked ? Colors.red : null,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/Share Stroke icon.png',
              scale: 1.7,
            ),
            IconButton(
              onPressed: () {
                // Get.bottomSheet(Container(
                //   height: Get.height * 0.10,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(20),
                //           topRight: Radius.circular(20)),
                //       color: Get.isDarkMode ? Colors.black : Colors.white),
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //           children: [
                //             if (widget.is_owner)
                //               InkWell(
                //                 onTap: () {
                //                   widget.reomvepost();
                //                   Get.back();
                //                 },
                //                 child: OnTabMore(
                //                   title: 'Delete',
                //                   iicons: 'Delete.svg',
                //                 ),
                //               ),
                //             OnTabMore(
                //               title: 'Pin',
                //               iicons: 'Pin.svg',
                //             ),
                //             OnTabMore(
                //               title: 'Show Likes',
                //               iicons: 'Like.svg',
                //             ),
                //             OnTabMore(
                //               title: 'Bookmark',
                //               iicons: 'Bookmarkk.svg',
                //             ),
                //             if (widget.is_owner == false)
                //               OnTabMore(
                //                 title: 'Report',
                //                 iicons: 'Report.svg',
                //               ),
                //             if (widget.is_owner == false)
                //               OnTabMore(
                //                 title: 'Block',
                //                 iicons: 'Block.svg',
                //               ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ));
                Get.bottomSheet(WidgetMorePosts(
                  ontapSave: widget.ontapSave,
                  post_id: widget.post_id,
                  adminPost: widget.is_owner,
                  remove: widget.reomvepost,
                  hidePost: '',
                  has_saved: widget.has_saved,
                  postText: widget.postText,
                  refreshPost: '',
                  url_post: '',
                  name: '',
                ));
              },
              icon: Icon(Icons.more_horiz),
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

class OnTabMore extends StatelessWidget {
  const OnTabMore({
    super.key,
    required this.title,
    required this.iicons,
  });
  final String title;
  final String iicons;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundColor: ColorThame,
            child: SvgPicture.asset(
              'assets/Svg/$iicons',
              color: Colors.white,
            )),
        Text(
          title,
          style: SafeGoogleFont(Fonts.font1, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

bool hasHashTags(String value) {
  final decoratedTextColor = Colors.blue;
  final detector = Detector(
      textStyle: TextStyle(),
      detectedStyle: TextStyle(color: decoratedTextColor),
      detectionRegExp: RegExp(''));
  final result = detector.getDetections(value);
  final detections = result
      .where((detection) => detection.style!.color == decoratedTextColor)
      .toList();
  return detections.isNotEmpty;
}
