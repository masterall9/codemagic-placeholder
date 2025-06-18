import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Images.dart';
import 'package:colibricmflutter/Screen/ShowLike/ShowLikeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Themes.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiAddPinMyProfile.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiReportPost.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WidgetMorePosts extends StatefulWidget {
  WidgetMorePosts({
    super.key,
    required this.ontapSave,
    required this.name,
    required this.post_id,
    required this.adminPost,
    required this.remove,
    required this.hidePost,
    required this.has_saved,
    required this.postText,
    required this.refreshPost,
    required this.url_post,
  });

  final ontapSave;
  final String name;
  final String post_id;
  final adminPost;
  final remove;
  final hidePost;
  String url_post;
  String postText;
  bool has_saved;
  final refreshPost;

  @override
  State<WidgetMorePosts> createState() => _WidgetMorePostsState();
}

class _WidgetMorePostsState extends State<WidgetMorePosts> {
  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: widget.adminPost ? Get.height * 0.48 : Get.height * 0.45,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorDarkBackground
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(
            20,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: widget.adminPost

////my Post
            ? false
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: Get.width * 0.20,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffE2E8F0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            'More Oprions'.tr,
                            style: SafeGoogleFont(Fonts.font2,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? ColorDarkComponents
                                    : Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    text.text = widget.postText;
                                  });
                                  Get.dialog(Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              width: Get.width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Scaffold(
                                                    appBar: AppBar(
                                                      elevation: 0,
                                                      foregroundColor:
                                                          Get.isDarkMode
                                                              ? Colors.white
                                                              : ColorThame,
                                                      backgroundColor: Theme.of(
                                                              context)
                                                          .scaffoldBackgroundColor,
                                                      title:
                                                          Text('Edit Post'.tr),
                                                    ),
                                                    body: Column(
                                                      children: [
                                                        Container(
                                                          width: Get.width,
                                                          height:
                                                              Get.height * 0.40,
                                                          child: TextField(
                                                            controller: text,
                                                            decoration:
                                                                InputDecoration(
                                                                    border:
                                                                        InputBorder
                                                                            .none),
                                                            maxLines: null,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width:
                                                                    Get.width *
                                                                        0.30,
                                                                height:
                                                                    Get.height *
                                                                        0.05,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        ColorThame,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Center(
                                                                    child: Text(
                                                                  'Cancel'.tr,
                                                                  style: SafeGoogleFont(
                                                                      Fonts
                                                                          .font1,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () async {
                                                                print('edite');
                                                              },
                                                              child: Container(
                                                                width:
                                                                    Get.width *
                                                                        0.30,
                                                                height:
                                                                    Get.height *
                                                                        0.05,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        ColorThame,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Center(
                                                                    child: Text(
                                                                  'Save'.tr,
                                                                  style: SafeGoogleFont(
                                                                      Fonts
                                                                          .font1,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                                },
                                child: WidgetMoreOprions(
                                  images: images.EdtiPost,
                                  name: 'Edit Post'.tr,
                                  smallText: 'Edit Post information'.tr,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.grey.withOpacity(0.3),
                                height: 1,
                              ),
                              InkWell(
                                onTap: () {
                                  widget.remove();
                                },
                                child: WidgetMoreOprions(
                                  images: images.reomve,
                                  name: 'Remove'.tr,
                                  smallText: 'Delete this post completely..'.tr,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.grey.withOpacity(0.3),
                                height: 1,
                              ),
                              InkWell(
                                onTap: () async {
                                  await ApiAddPinMyProfile.fo(
                                      poso: widget.post_id);
                                },
                                child: WidgetMoreOprions(
                                  images: images.Pin,
                                  name: true ? 'Pin'.tr : 'Unpin'.tr,
                                  smallText: true
                                      ? 'Pin to my profile'.tr
                                      : 'Unpin to my profile'.tr,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.grey.withOpacity(0.3),
                                height: 1,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.dialog(Container(
                                    child: Center(
                                      child: ShowLikeScreen(
                                        post_id: widget.post_id,
                                      ),
                                    ),
                                  ));
                                },
                                child: WidgetMoreOprions(
                                  images: images.ShowLikes,
                                  name: 'Show likes'.tr,
                                  smallText: 'Show likes in the post'.tr,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.grey.withOpacity(0.3),
                                height: 1,
                              ),
                              widget.ontapSave
                            ])),
                      ],
                    ),
                  )

//my Post
            :

            //user Post
            SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: Get.width * 0.20,
                        height: 4,
                        color: Color(0xffE2E8F0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        'More Oprions'.tr,
                        style: SafeGoogleFont(Fonts.font2,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? ColorDarkComponents
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              Get.dialog(Container(
                                child: Center(
                                  child: ShowLikeScreen(
                                    post_id: widget.post_id,
                                  ),
                                ),
                              ));
                            },
                            child: WidgetMoreOprions(
                              images: images.ShowLikes,
                              name: 'Show likes'.tr,
                              smallText: 'Show likes in the post'.tr,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.grey.withOpacity(0.3),
                            height: 1,
                          ),
                          InkWell(
                            onTap: () async {
                              print('block');
                            },
                            child: WidgetMoreOprions(
                              images: images.block,
                              name: 'Block'.tr,
                              smallText:
                                  'Block this User, You won\'t be able see their posts'
                                      .tr,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.grey.withOpacity(0.3),
                            height: 1,
                          ),
                          widget.ontapSave
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 20),
                          //   color: Colors.grey.withOpacity(0.3),
                          //   height: 1,
                          // ),
                          // if (widget.adminPost == false)
                          //   WidgetMoreOprions(
                          //     images: images.msg,
                          //     name: 'Message'.tr,
                          //     smallText: 'Send this Post to your friends'.tr,
                          //   ),
                        ])),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Divider(),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? ColorDarkComponents
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.dialog(Scaffold(
                                  body: ReportPost(post_id: widget.post_id)));
                            },
                            child: WidgetMoreOprions(
                              images: images.infocircle,
                              name: 'Report the post'.tr,
                              smallText: 'Report this post to us.'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class ReportPost extends StatefulWidget {
  const ReportPost({
    super.key,
    required this.post_id,
  });
  final String post_id;

  @override
  State<ReportPost> createState() => _ReportPostState();
}

class _ReportPostState extends State<ReportPost> {
  final TextEditingController commment = TextEditingController();
  String cilic = 'click here';
  int num = 0;
  List report = [
    '',
    'This is spam',
    'Misleading or fraudulent',
    'Publication of private information',
    'Threats of violence or physical harm',
    ' I am not interested in this post',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        foregroundColor:
                            Get.isDarkMode ? Colors.white : ColorThame,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        title: Text('Report'.tr),
                      ),
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: ColorThame,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PopupMenuButton(
                                      offset: Offset(0, Get.height * 0.01),
                                      onSelected: (int index) {
                                        print('index is $index');
                                        setState(() {
                                          num = index;
                                        });
                                      },
                                      onCanceled: () {
                                        print('cancelled!');
                                      },
                                      child: Center(
                                          child: Text(
                                        num.toString() == '0'
                                            ? cilic
                                            : report[num],
                                        style: SafeGoogleFont(Fonts.font1,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      )),
                                      itemBuilder: (context) {
                                        return List.generate(report.length,
                                            (index) {
                                          return PopupMenuItem(
                                            value: index,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  report[index],
                                                  style: SafeGoogleFont(
                                                      Fonts.font1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Divider()
                                              ],
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(42, 158, 158, 158),
                                  borderRadius: BorderRadius.circular(20)),
                              width: Get.width,
                              height: Get.height * 0.30,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: commment,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Comment...'),
                                  maxLines: null,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {
                                  Get.back();
                                },
                                child: Container(
                                  width: Get.width * 0.30,
                                  height: Get.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: ColorThame,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Cancel'.tr,
                                    style: SafeGoogleFont(Fonts.font1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  print('Submit');
                                  ApiReportPost.fo(
                                      poso: widget.post_id,
                                      reason: num.toString(),
                                      comment: commment.text);
                                  Get.back();
                                },
                                child: Container(
                                  width: Get.width * 0.30,
                                  height: Get.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: ColorThame,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Submit'.tr,
                                    style: SafeGoogleFont(Fonts.font1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




class MyPostsMore extends StatelessWidget {
  const MyPostsMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black)]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Icon(
                  Icons.edit_note,
                  weight: 30,
                )),
              ),
            ),
            SizedBox(
              width: Get.width * 0.01,
            ),
            Text(
              'Edit Post'.tr,
              style: SafeGoogleFont(Fonts.font1,
                  fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Divider(),
      ],
    );
  }
}

class WidgetMoreOprions extends StatelessWidget {
  WidgetMoreOprions({
    required this.images,
    required this.name,
    required this.smallText,
    super.key,
  });

  String images;
  String name;
  String smallText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color:
        //     Get.isDarkMode ? Color.fromARGB(44, 210, 202, 202) : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
              // color: Get.isDarkMode
              //     ? Color.fromARGB(44, 210, 202, 202)
              //     : ColorBackIcons,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SvgPicture.asset(
              images,
              color: Get.isDarkMode ? Colors.white : null,
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.tr,
                style: SafeGoogleFont(
                  Fonts.font2,
                  fontWeight: FontWeight.w700,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
              Container(
                width: Get.width * 0.5,
                child: Text(
                  smallText.tr,
                  style: SafeGoogleFont(
                    Fonts.font2,
                    fontSize: 12,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class WidgetMoreOprionsCansele extends StatelessWidget {
  WidgetMoreOprionsCansele({
    required this.images,
    required this.name,
    required this.smallText,
    super.key,
  });

  String images;
  String name;
  String smallText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color:
        //     Get.isDarkMode ? Color.fromARGB(44, 210, 202, 202) : Colors.white,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
              // color: Get.isDarkMode
              //     ? Color.fromARGB(44, 210, 202, 202)
              //     : ColorBackIcons,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SvgPicture.asset(
              images,
              color: Get.isDarkMode ? Colors.white : null,
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.tr,
                style: SafeGoogleFont(
                  Fonts.font2,
                  fontWeight: FontWeight.w700,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Text(
                smallText.tr,
                style: SafeGoogleFont(
                  Fonts.font2,
                  fontSize: 12,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
