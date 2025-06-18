import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Images.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/Screen/HomeScreen/WidgetPosts.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/%D9%8DApiGetBookMarks.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/AddBookmark.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiRemovePost.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/WIdgetMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int lastId = 0;
  int id = 0;
  List<feedsModel> data = [];
  bool nodata = false;
  void GetFeed() {
    ApiGetBookMarks.fet(listId: '0', sized: Home_Post_Limit).then((value) {
      setState(() {
        data = value.toList();
        if (value.length == 0) {
          nodata = true;
        } else {
          lastId = value.length;
          value[value.length - 1].id == id;
        }
      });
    });
  }

  void refesh() async {
    setState(() {
      data.clear();
    });

    await ApiGetBookMarks.fet(listId: '0', sized: Home_Post_Limit)
        .then((value) {
      setState(() {
        data = value.toList();
        if (value.length == 0) {
        } else {
          value[value.length - 1].id == id;
          _refreshController.refreshCompleted();
        }
      });
    });
  }

  void onLoding() async {
    var list = await ApiGetBookMarks.fet(
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

  @override
  void initState() {
    GetFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Bookmarks'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(contmydata.avatar.value),
            ),
          )
        ],
      ),
      body: nodata
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      'assets/Svg/avatar-thinking-8-svgrepo-com.svg'),
                  Text(
                    'There are no saved posts',
                    style: SafeGoogleFont(Fonts.font1,
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          : SmartRefresher(
              onRefresh: refesh,
              onLoading: onLoding,
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  for (var i = 0; i < data.length; i++)
                    WidgetPosts(
                      refresh: '',
                      thread_id: data[i].thread_id.toString(),
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
                      user_id: data[i].user_id,
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
                    )
                ],
              )),
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
