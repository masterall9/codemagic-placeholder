import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Images.dart';
import 'package:colibricmflutter/Screen/AccuntSettings/HomeScreenAccuntSettings.dart';
import 'package:colibricmflutter/Screen/AddPostsScreen/AddPostsSceeen.dart';
import 'package:colibricmflutter/Screen/BookmarksScreen/BookmarksScreen.dart';
import 'package:colibricmflutter/Screen/HomeScreen/WidgetPosts.dart';
import 'package:colibricmflutter/Screen/MyProfile/MyPorfileScreen.dart';
import 'package:colibricmflutter/Screen/NavBar/HomeNavBar.dart';
import 'package:colibricmflutter/Screen/Search/HomeScreenSearch.dart';
import 'package:colibricmflutter/Screen/Subscriptions/SubscriptionsScreen.dart';
import 'package:colibricmflutter/Screen/Wallet/HomeScreenWallet.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/AddBookmark.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiFeeds.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiNotfi.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiPinPostTimeline.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiRemovePost.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiStoreis.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/StoriesModel.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/DarkModeWidget.dart';
import 'package:colibricmflutter/Widget/DilogSoon.dart';
import 'package:colibricmflutter/Widget/DrawerStyle.dart';
import 'package:colibricmflutter/Widget/DrawerStyleBuilder.dart';
import 'package:colibricmflutter/Widget/LodingPostsWidget.dart';
import 'package:colibricmflutter/Widget/WIdgetMore.dart';
import 'package:colibricmflutter/Widget/WidgetDrawerZoom.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:colibricmflutter/controllers/OneSingal.dart';
import 'package:colibricmflutter/controllers/SettingController.dart';
import 'package:colibricmflutter/controllers/SharedPreferences.dart';
import 'package:colibricmflutter/controllers/ZoomDrawerController.dart';
import 'package:colibricmflutter/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int lastId = 0;
  int id = 0;
  List<feedsModel> data = [];
  List<feedsModel> pin = [];
  List<StoriesModel> sor = [];
  bool nodata = false;
  void GetFeed() {
    lodingPostsSet();
    ApiFeeds.fet(listId: '0', sized: Home_Post_Limit).then((value) {
      setState(() {
        data = value.toList();
        value.length == 0 ? nodata = true : id = value[value.length - 1].id;

        lastId = value.length;
        lodingPostsSet();
        ApiNotfi.pos();
      });
    });
    ApiStoreis.fetch().then((value) {
      setState(() {
        sor = value.toList();
      });
    });
    ApiPinPostTimeline.fet().then((value) {
      setState(() {
        pin = value.toList();
      });
    });
  }

  void refesh() async {
    ApiPinPostTimeline.fet().then((value) {
      setState(() {
        pin = value.toList();
      });
    });

    await ApiFeeds.fet(listId: '0', sized: Home_Post_Limit).then((value) {
      setState(() {
        data = value.toList();
        value[value.length - 1].id == id;
        _refreshController.refreshCompleted();
      });
    });
  }

  void onLoding() async {
    var list = await ApiFeeds.fet(
      listId: data.length.toString(),
      sized: Home_Post_Limit,
    );
    if (list.length == 0) {
      print('stop');
      setState(() {
        _refreshController.loadComplete();
      });
    } else {
      setState(() {
        print(list[list.length - 1].id == id);
        data.addAll(list);
        _refreshController.loadComplete();
        print(data.length);
      });
    }
  }

  bool lodingPosts = false;

  void lodingPostsSet() {
    setState(() {
      lodingPosts = !lodingPosts;
    });
  }

  final divider = Divider();

  @override
  void initState() {
    Get.put(SettingController());

    Get.put(GetMyUserDataCont());
    GetFeed();

    super.initState();
  }

  var contmydata = Get.put(GetMyUserDataCont());

  Widget build(BuildContext context) {
    return ZoomDrawerAmeenHamedFlutterCrafters(
        style: DrawerStyle.defaultStyle,
        controller: z,
        borderRadius: 60,
        menuScreenWidth: Get.width * 0.55,
        // showShadow: true,
        openCurve: Curves.fastOutSlowIn,
        slideWidth: MediaQuery.of(context).size.width * 0.70,
        duration: const Duration(milliseconds: 300),
        menuBackgroundColor: Colors.blue,
        mainScreen: Body(
          widgets: Scaffold(
            key: _scaffoldKey,
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              disabledElevation: 0,
              tooltip: 'Add'.tr,
              splashColor: Colors.white,
              backgroundColor: Colors.transparent,
              onPressed: () {
                Get.to(AddPostsScreen(
                  thread_id: '',
                  refresh: GetFeed,
                ));
              },
              child: Center(
                  child: Image.asset('assets/images/Add text button.png')),
            ),
            drawer: Drawer(
              //ListView to listdown children of drawer
              child: WidgetDrawer(divider: divider),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: Container(
                child: Builder(builder: (BuildContext context) {
                  return InkWell(
                      onTap: () {
                        z.toggle!();
                      },
                      child: GetBuilder<GetMyUserDataCont>(
                        init: GetMyUserDataCont(),
                        builder: (controller) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: controller.data.length.toString() == '0'
                              ? SizedBox()
                              : CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    controller.data[0].avatar == null
                                        ? ''
                                        : controller.data[0].avatar,
                                  ),
                                  maxRadius: 25,
                                ),
                        ),
                      ));
                }),
              ),
              elevation: 1,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Image.asset('assets/images/Logo.png'),
                        Image.asset(
                          'assets/images/Feature stroke icon.png',
                          height: 25,
                          width: 25,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: SmartRefresher(
              onRefresh: refesh,
              onLoading: onLoding,
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                print('assStroe');
                              },
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(
                                        contmydata.avatar.value),
                                    maxRadius: 30,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                          maxRadius: 10,
                                          backgroundColor: ColorThame,
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          )))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            for (var i = 0; i < sor.length; i++)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: InkWell(
                                  onTap: () {
                                    print('assStroe');
                                  },
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            CachedNetworkImageProvider(sor[i]
                                                .swift[0]['media']['src']),
                                        maxRadius: 30,
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            maxRadius: 10,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    sor[i].avatar),
                                          )),
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                  for (var i = 0; i < pin.length; i++)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Administrator pinned this post',
                                      style: SafeGoogleFont(
                                        Fonts.font1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      images.Pin,
                                      color: Colors.white,
                                      height: 18,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        WidgetPosts(
                          refresh: '',
                          thread_id: pin[i].thread_id.toString(),
                          commentButton: 0,
                          donations_total: pin[i].donations_total,
                          donation_raised_percent:
                              pin[i].donation_raised_percent,
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
                            Get.back();
                          },
                          is_repost: pin[i].is_repost,
                          is_owner: pin[i].is_owner,
                          user_id: pin[i].user_id,
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
                        ),
                      ],
                    ),
                  divider,
                  lodingPosts
                      ? LodingPostsWidget(
                          len: 5,
                        )
                      : nodata
                          ? Container(
                              width: Get.width,
                              child: Center(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/Svg/avatar-thinking-8-svgrepo-com.svg'),
                                    Text(
                                      'There are no posts. Please follow users to see posts',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(HomeScreenSearch(
                                          initialIndex: 1,
                                        ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: ColorThame,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Go follow people',
                                              style: SafeGoogleFont(Fonts.font1,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                for (var i = 0; i < data.length; i++)
                                  WidgetPosts(
                                    refresh: '',
                                    thread_id: data[i].thread_id.toString(),
                                    commentButton: 0,
                                    donations_total: data[i].donations_total,
                                    donation_raised_percent:
                                        data[i].donation_raised_percent,
                                    is_donation_post: data[i].is_donation_post,
                                    donation_raised: data[i].donation_raised,
                                    donation_amount: data[i].donation_amount,
                                    ontapSave: SavePost(i),
                                    has_saved: data[i].has_saved,
                                    removepost: () {
                                      ApiRemovePost.fo(
                                          poso: data[i].id.toString());
                                      setState(() {
                                        data.removeAt(i);
                                      });
                                      Get.back();
                                    },
                                    is_repost: data[i].is_repost,
                                    is_owner: data[i].is_owner,
                                    user_id: data[i].user_id,
                                    id: data[i].id,
                                    media: data[i].media,
                                    polls: data[i].poll,
                                    has_liked: data[i].has_liked,
                                    avatar: data[i].avatar,
                                    verified: data[i].verified,
                                    reposter_name: data[i].reposter_name,
                                    reposter_username:
                                        data[i].reposter_username,
                                    name: data[i].name,
                                    username: data[i].username,
                                    time: data[i].time,
                                    likes_count: int.parse(data[i].likes_count),
                                    text: data[i].text,
                                    og_image: data[i].og_image,
                                    type: data[i].type,
                                    replys_count: data[i].replys_count,
                                    reposts_count: int.parse(
                                      data[i].reposts_count,
                                    ),
                                  ),
                              ],
                            )
                ],
              )),
            ),
          ),
        ),
        // moveMenuScreen: false,
        menuScreen: WidgetDrawer(
          divider: divider,
        ));
    // return
  }

  Widget SavePostPin(i) {
    return InkWell(
      onTap: () {
        setState(() {
          pin[i].has_saved != pin[i].has_saved;
          ApiAddBookmark.fo(poso: pin[i].id.toString());
          Get.back();
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

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({
    super.key,
    required this.divider,
  });

  final Divider divider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        z.close!();
                      },
                      icon: Icon(
                        Icons.cancel,
                        size: 30,
                        color: ColorThame,
                      )),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              DarkModeWidget(),
              GetBuilder<GetMyUserDataCont>(
                init: GetMyUserDataCont(),
                builder: (controller) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < controller.data.length; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  controller.data[i].avatar),
                            ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            Text(
                              '${controller.data[i].first_name} ${controller.data[i].last_name}',
                              style: SafeGoogleFont(
                                Fonts.FontLogin,
                                color: Color(0xFF141619),
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.10,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            Text(
                              '@${ConvText(controller.data[i].user_name)}',
                              style: SafeGoogleFont(
                                Fonts.FontLogin,
                                color: Color(0xFF687684),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.30,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: controller.data[i].following_count
                                        .toString(),
                                    style: SafeGoogleFont(
                                      Fonts.FontLogin,
                                      color: const Color(0xFF141619),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: SafeGoogleFont(
                                      Fonts.FontLogin,
                                      color: Color(0xFFFF0000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Following',
                                    style: SafeGoogleFont(
                                      Fonts.FontLogin,
                                      color: Color(0xFF687684),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: SafeGoogleFont(
                                      Fonts.FontLogin,
                                      color: Color(0xFFFF0000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller.data[i].follower_count
                                        .toString(),
                                    style: SafeGoogleFont(
                                      Fonts.FontLogin,
                                      color: Color(0xFF141619),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: SafeGoogleFont(
                                      Fonts.FontLogin,
                                      color: Color(0xFFFF0000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Followers',
                                    style: SafeGoogleFont(
                                      Fonts.FontLogin,
                                      color: Color(0xFF687684),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  geToDrawer(getTo: MyProfileScreen());
                },
                child: DrawerText(
                  title: 'Profile',
                  images: 'Profile Stroke Icon.svg',
                ),
              ),

              // Supbscrtipotns.svg
              InkWell(
                onTap: () {
                  geToDrawer(getTo: SubscriptionsScreen());
                },
                child: DrawerText(
                  title: 'Subscriptions',
                  images: 'Supbscrtipotns.svg',
                ),
              ),
              if (Trending)
                InkWell(
                  onTap: () {
                    DialogsSoon(context);
                  },
                  child: DrawerText(
                    title: 'Trending',
                    images: 'rending.svg',
                  ),
                ),
              if (Bookmarks)
                InkWell(
                  onTap: () {
                    Get.to(BookmarksScreen());
                  },
                  child: DrawerText(
                    title: 'Bookmarks',
                    images: 'BookMark.svg',
                  ),
                ),
              if (Wallet)
                InkWell(
                  onTap: () {
                    Get.to(HomeScreenWallet());
                  },
                  child: DrawerText(
                    title: 'Wallet',
                    images: 'Wallet.svg',
                  ),
                ),
              if (Advertising)
                InkWell(
                  onTap: () {
                    DialogsSoon(context);
                  },
                  child: DrawerText(
                    title: 'Advertising',
                    images: 'Advertising.svg',
                  ),
                ),
              if (Affiliates)
                InkWell(
                  onTap: () {
                    DialogsSoon(context);
                  },
                  child: DrawerText(
                    title: 'Affiliates',
                    images: 'Affliates.svg',
                  ),
                ),

              SizedBox(
                height: Get.height * 0.03,
              ),
              divider,
              InkWell(
                onTap: () {
                  Get.to(HomeScreenAccuntSettings());
                },
                child: DrawerText(
                  title: 'Account settings',
                  images: 'AccountSettings.svg',
                ),
              ),
              InkWell(
                onTap: () async {
                  await SharedP.Remove();
                  Get.offAllNamed(Routes.lgoin);
                },
                child: DrawerText(
                  color: true,
                  title: 'Logout',
                  images: 'Logout.svg',
                ),
              ),
              // ListTile(
              //   title: const Text('LogOut'),
              //   //To perform action on tapping at tile
              //   onTap: () async {
              //     await SharedP.Remove();
              //     Get.offAllNamed(AppRoutes.LoginScreen);
              //   },
              // ),
              // divider,
              // ListTile(
              //     title: const Text('test'),
              //     //To perform action on tapping at tile
              //     onTap: () async {
              //       var ameen = await ApiGetDataProfileId.fetch('1');
              //       print(ameen);
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerText extends StatelessWidget {
  DrawerText({
    super.key,
    required this.title,
    this.color,
    required this.images,
  });
  final String title;
  final String images;
  bool? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/Svg/$images',
                height: 25,
                width: 25,
                color: color == null
                    ? Colors.grey
                    : const Color.fromARGB(255, 156, 39, 30),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                title,
                style: SafeGoogleFont(
                  Fonts.FontLogin,
                  color: color == null
                      ? null
                      : const Color.fromARGB(255, 156, 39, 30),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

var contmydata = Get.put(GetMyUserDataCont());
