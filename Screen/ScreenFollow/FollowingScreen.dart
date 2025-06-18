import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/ProfileUserScreen/ProfileUserScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiFetchFollowing.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiFollow.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/FetchFollowingModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/WidgetFollow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FollowingScreen extends StatefulWidget {
  FollowingScreen(
      {super.key, required this.title, required this.boolTrue, this.user_id});
  final String title;
  final bool boolTrue;
  String? user_id;

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<FetchFollowingModel> data = [];
  String offset = '';
  void FetchFollowing() {
    if (widget.title == 'Following') {
      ApiFetchFollowing.fet(offset: '', user_id: widget.user_id.toString())
          .then((value) {
        setState(() {
          _refreshController.refreshCompleted();

          data = value.toList();

          offset = value[value.length - 1].offset_id.toString();
        });
      });
    } else if (widget.title == 'Followers') {
      ApiFetchfollowers.fet(offset: '', user_id: widget.user_id.toString())
          .then((value) {
        setState(() {
          _refreshController.refreshCompleted();

          data = value.toList();

          offset = value[value.length - 1].offset_id.toString();
        });
      });
    }
  }

  void onLoding() async {
    if (widget.title == 'Following') {
      var list = await ApiFetchFollowing.fet(
          offset: offset, user_id: widget.user_id.toString());
      if (list.length == 0) {
        print('stop');
        setState(() {
          _refreshController.loadComplete();
        });
      } else {
        setState(() {
          _refreshController.loadComplete();
          print(list[list.length - 1].offset_id);

          data.addAll(list);

          offset = list[list.length - 1].offset_id.toString();
          print(data.length);
        });
      }
    } else if (widget.title == 'Followers') {
      var list = await ApiFetchfollowers.fet(
          offset: offset, user_id: widget.user_id.toString());
      if (list.length == 0) {
        print('stop');
        setState(() {
          _refreshController.loadComplete();
        });
      } else {
        setState(() {
          _refreshController.loadComplete();
          print(list[list.length - 1].offset_id);

          data.addAll(list);

          offset = list[list.length - 1].offset_id.toString();
          print(data.length);
        });
      }
    }
  }

  @override
  void initState() {
    FetchFollowing();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SmartRefresher(
        onRefresh: FetchFollowing,
        onLoading: onLoding,
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < data.length; i++)
                InkWell(
                  onTap: () {
                    Get.to(ProfileUserScreen(
                        user_id: data[i].id.toString(), user_name: ''));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                      data[i].avatar),
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                Text(
                                  '${data[i].fname} ${data[i].lname}',
                                  style: SafeGoogleFont(Fonts.font1,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                WidgetFlollow(
                                    is_following: data[i].is_following,
                                    user_id: data[i].id.toString()),
                                if (widget.boolTrue)
                                  IconButton(
                                      onPressed: () {
                                        Get.bottomSheet(MorePfofileUser(
                                          usd: data[i].id.toString(),
                                          username:
                                              '${data[i].fname} ${data[i].lname}',
                                        ));
                                      },
                                      icon: Icon(Icons.more_horiz_outlined))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
