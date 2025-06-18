import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Images.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/HomeScreenAccuntSettings.dart';
import 'package:colibricmflutter/Screen/HomeScreen/WidgetPosts.dart';
import 'package:colibricmflutter/Screen/MyProfile/AboutScreen.dart';
import 'package:colibricmflutter/Screen/MyProfile/SettingMyProfileScreen.dart';
import 'package:colibricmflutter/Screen/MyProfile/WIdgetPostMedia.dart';
import 'package:colibricmflutter/Screen/MyProfile/WidgetLikedPosts.dart';
import 'package:colibricmflutter/Screen/ScreenFollow/FollowingScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Themes.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/AddBookmark.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiGetMyPost.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiRemovePost.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/LodingPostsWidget.dart';
import 'package:colibricmflutter/Widget/WIdgetMore.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  int postViews = 0;

  @override
  final contt = Get.put(GetMyUserDataCont());
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // SliverAppBar(
              //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              //   foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
              //   actions: [
              //     IconButton(onPressed: () {}, icon: Icon(Icons.settings))
              //   ],
              // ),
            ];
          },
          body: Column(
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                height: Get.height * 0.96,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<GetMyUserDataCont>(
                        init: GetMyUserDataCont(),
                        builder: (cont) {
                          return Container(
                            height: Get.height * 0.45,
                            width: Get.width,
                            child: Stack(
                              children: [
                                for (var i = 0; i < cont.data.length; i++)
                                  Container(
                                    width: Get.width,
                                    height: Get.height * 0.23,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                                cont.data[i].cover))),
                                  ),
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.black.withOpacity(0.7),
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                for (var i = 0; i < cont.data.length; i++)
                                  Positioned(
                                    left: Get.width * 0.05,
                                    bottom: Get.height * 0.09,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 55,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              maxRadius: 55,
                                              backgroundImage:
                                                  CachedNetworkImageProvider(
                                                      cont.data[i].avatar),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.01,
                                        ),
                                        Container(
                                          width: Get.width * 0.90,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                cont.data[i].first_name +
                                                    ' ' +
                                                    cont.data[i].last_name,
                                                style: SafeGoogleFont(
                                                    Fonts.font1,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          HomeScreenAccuntSettings());
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Icon(
                                                          Icons.more_horiz),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(EditProfileSreen(
                                                        cover:
                                                            cont.data[i].cover,
                                                        avat:
                                                            cont.data[i].avatar,
                                                        bio: '',
                                                      ));
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: ColorThame,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'SETTINGS',
                                                          style: SafeGoogleFont(
                                                              Fonts.font2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '@' + cont.data[i].user_name,
                                          style: SafeGoogleFont(
                                            Fonts.font1,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                for (var i = 0; i < cont.data.length; i++)
                                  Positioned(
                                      bottom: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          width: Get.width * 0.90,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.public,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.01),
                                                      Text(
                                                          cont.data[i].country),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.02),
                                                      if (cont.data[i].gender ==
                                                          'M')
                                                        Icon(
                                                          Icons.male,
                                                          color: Colors.blue,
                                                        ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.01),
                                                      if (cont.data[i].gender ==
                                                          'M')
                                                        Text('Male'),
                                                      if (cont.data[i].gender ==
                                                          'F')
                                                        Icon(
                                                          Icons.female,
                                                          color: Colors
                                                              .deepPurpleAccent,
                                                        ),
                                                      SizedBox(
                                                          width:
                                                              Get.width * 0.01),
                                                      if (cont.data[i].gender ==
                                                          'F')
                                                        Text('Female'),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(FollowingScreen(
                                                              user_id: contt
                                                                  .data[i].id
                                                                  .toString(),
                                                              title:
                                                                  'Following',
                                                              boolTrue: true));
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text('Following'),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.01,
                                                            ),
                                                            Text(cont.data[i]
                                                                .following_count
                                                                .toString())
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.01,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(FollowingScreen(
                                                              user_id: contt
                                                                  .data[i].id
                                                                  .toString(),
                                                              title:
                                                                  'Followers',
                                                              boolTrue: true));
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text('Followers'),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.01,
                                                            ),
                                                            Text(cont.data[i]
                                                                .follower_count
                                                                .toString())
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  cont.data[i].website
                                                          .isNotEmpty
                                                      ? Row(
                                                          children: [
                                                            Icon(
                                                              Icons.link,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            Text(cont.data[i]
                                                                .website)
                                                          ],
                                                        )
                                                      : SizedBox(),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ))
                              ],
                            ),
                          );
                        },
                      ),
                      for (var i = 0; i < contt.data.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'About',
                                      style: SafeGoogleFont(Fonts.font3,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Get.to(AboutScreen());
                                        },
                                        icon: Icon(Icons.edit)),
                                  ],
                                ),
                                Divider(),
                                Container(
                                  width: Get.width * 0.70,
                                  child: Text(
                                    contt.data[i].about_you,
                                    style: SafeGoogleFont(Fonts.font3,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Divider(),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? ColorDarkComponents
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 0.5, color: Colors.grey)
                              ]),
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    postViews = 0;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 7),
                                  decoration: BoxDecoration(
                                      color: postViews == 0 ? ColorThame : null,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    'Posts'.tr,
                                    style: SafeGoogleFont(Fonts.font1,
                                        fontWeight: FontWeight.bold,
                                        color: postViews == 0
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    postViews = 1;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 7),
                                  decoration: BoxDecoration(
                                      color: postViews == 1 ? ColorThame : null,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    'Media'.tr,
                                    style: SafeGoogleFont(Fonts.font1,
                                        fontWeight: FontWeight.bold,
                                        color: postViews == 1
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                  // Container(
                                  //   height: 1,
                                  //   width: Get.width,
                                  //   color: postViews == 0 ? ColorTheme : Colors.grey,
                                  // )
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    postViews = 2;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 7),
                                  decoration: BoxDecoration(
                                      color: postViews == 2 ? ColorThame : null,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    'Likes'.tr,
                                    style: SafeGoogleFont(Fonts.font1,
                                        fontWeight: FontWeight.bold,
                                        color: postViews == 2
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                              if (AboutProfile)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      postViews = 3;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 7),
                                    decoration: BoxDecoration(
                                        color:
                                            postViews == 3 ? ColorThame : null,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Text(
                                      'About'.tr,
                                      style: SafeGoogleFont(Fonts.font1,
                                          fontWeight: FontWeight.bold,
                                          color: postViews == 3
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (postViews == 0)
                        WidgetMyPosts(
                          type: 'posts',
                        ),
                      for (var i = 0; i < contt.data.length; i++)
                        if (postViews == 1)
                          WidgetMyPostsMedia(
                            user_id: contt.data[i].id.toString(),
                            type: 'media',
                          ),
                      if (postViews == 2)
                        WidgetLikedPosts(
                          type: 'liked',
                        ),
                      if (postViews == 3)
                        Column(
                          children: [
                            for (var i = 0; i < contt.data.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(contt.data[i].about_you),
                                  ],
                                ),
                              )
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class WidgetMyPosts extends StatefulWidget {
  const WidgetMyPosts({
    super.key,
    required this.type,
  });
  final String type;

  @override
  State<WidgetMyPosts> createState() => _WidgetMyPostsState();
}

class _WidgetMyPostsState extends State<WidgetMyPosts> {
  List<feedsModel> data = [];
  List<feedsModel> pin = [];
  bool lodingPosts = true;

  Future<void> getPost() async {
    ApiGetMyPost.fet(
            id: await SharedP.Get('user_id'), media: widget.type, username: '')
        .then((value) {
      setState(() {
        data = value.toList();
        lodingPosts = false;
      });
    });
    ApiGetMyPostPin.fet(id: await SharedP.Get('user_id')).then((value) {
      setState(() {
        pin = value.toList();
      });
    });
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return lodingPosts
        ? LodingPostsWidget(
            len: 5,
          )
        : Column(
            children: [
              for (var i = 0; i < pin.length; i++)
                Container(
                  decoration: BoxDecoration(
                      color: ColorThame,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(65),
                        topRight: Radius.circular(65),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          images.Pin,
                          color: Colors.white,
                        ),
                      ),
                      WidgetPosts(
                        refresh: '',
                        thread_id: pin[i].thread_id.toString(),
                        commentButton: 0,
                        donations_total: pin[i].donations_total,
                        donation_raised_percent: pin[i].donation_raised_percent,
                        is_donation_post: pin[i].is_donation_post,
                        donation_raised: pin[i].donation_raised,
                        donation_amount: pin[i].donation_amount,
                        ontapSave: SavePostPin(i),
                        has_saved: pin[i].has_saved,
                        removepost: () {
                          ApiRemovePost.fo(poso: pin[i].id.toString());
                          setState(() {
                            data.removeAt(i);
                          });
                        },
                        is_repost: pin[i].is_repost,
                        is_owner: pin[i].is_owner,
                        id: pin[i].id,
                        media: pin[i].media,
                        polls: pin[i].poll,
                        has_liked: pin[i].has_liked,
                        avatar: pin[i].avatar,
                        verified: pin[i].verified,
                        reposter_name: pin[i].reposter_name,
                        reposter_username: pin[i].reposter_username,
                        name: pin[i].name,
                        username: pin[i].username,
                        time: pin[i].time,
                        likes_count: int.parse(pin[i].likes_count),
                        text: pin[i].text,
                        og_image: pin[i].og_image,
                        type: pin[i].type,
                        replys_count: pin[i].replys_count,
                        reposts_count: int.parse(pin[i].reposts_count),
                        user_id: pin[i].user_id,
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              for (var i = 0; i < data.length; i++)
                WidgetPosts(
                  refresh: '',
                  commentButton: 0,
                  donations_total: data[i].donations_total,
                  donation_raised_percent: data[i].donation_raised_percent,
                  is_donation_post: data[i].is_donation_post,
                  donation_raised: data[i].donation_raised,
                  donation_amount: data[i].donation_amount,
                  ontapSave: SavePost(i),
                  has_saved: data[i].has_saved,
                  removepost: () {
                    ApiRemovePost.fo(poso: data[i].id.toString());
                    setState(() {
                      data.removeAt(i);
                    });
                  },
                  is_repost: data[i].is_repost,
                  is_owner: data[i].is_owner,
                  id: data[i].id,
                  media: data[i].media,
                  polls: data[i].poll,
                  has_liked: data[i].has_liked,
                  avatar: data[i].avatar,
                  verified: data[i].verified,
                  reposter_name: data[i].reposter_name,
                  reposter_username: data[i].reposter_username,
                  name: data[i].name,
                  username: data[i].username,
                  time: data[i].time,
                  likes_count: int.parse(data[i].likes_count),
                  text: data[i].text,
                  og_image: data[i].og_image,
                  type: data[i].type,
                  replys_count: data[i].replys_count,
                  reposts_count: int.parse(data[i].reposts_count),
                  user_id: data[i].user_id,
                  thread_id: data[i].thread_id.toString(),
                )
            ],
          );
  }

  Widget SavePostPin(i) {
    return InkWell(
      onTap: () {
        setState(() {
          pin[i].has_saved != pin[i].has_saved;
          Get.back();
          ApiAddBookmark.fo(poso: pin[i].id.toString());
        });
      },
      child: WidgetMoreOprionsCansele(
        images: images.BookMark,
        name: pin[i].has_saved ? 'UnBookmark' : 'Bookmark'.tr,
        smallText: pin[i].has_saved
            ? 'Remove this post to your favorite list.'
            : 'Add this post to your favorite list.'.tr,
      ),
    );
  }

  Widget SavePost(i) {
    return InkWell(
      onTap: () {
        setState(() {
          data[i].has_saved != data[i].has_saved;
          Get.back();
          ApiAddBookmark.fo(poso: data[i].id.toString());
        });
      },
      child: WidgetMoreOprionsCansele(
        images: images.BookMark,
        name: data[i].has_saved ? 'UnBookmark' : 'Bookmark'.tr,
        smallText: data[i].has_saved
            ? 'Remove this post to your favorite list.'
            : 'Add this post to your favorite list.'.tr,
      ),
    );
  }
}
