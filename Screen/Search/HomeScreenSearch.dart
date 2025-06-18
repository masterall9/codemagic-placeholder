import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/Screen/ProfileUserScreen/ProfileUserScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiSearchHashTag.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiSerach.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/SearchHashTagModel.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/SearchPeopleModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/WidgetFollow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenSearch extends StatefulWidget {
  HomeScreenSearch({super.key, required this.initialIndex});
  int initialIndex;

  @override
  State<HomeScreenSearch> createState() => _HomeScreenSearchState();
}

class _HomeScreenSearchState extends State<HomeScreenSearch> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController _serach = TextEditingController();
  int intIndex = 0;
  List<SearchPeopleModel> data = [];
  List<SearchHashTagModel> searchs = [];
  String offset = '';
  void search() {
    if (intIndex == 1) {
      ApiSerach.serach(
              search: _serach.text.isEmpty ? ' ' : _serach.text, offset: '')
          .then((value) {
        setState(() {
          data = value.toList();
          offset = value[value.length - 1].user_id.toString();
        });
      });
    } else if (intIndex == 0) {
      ApiSearchHashTag.serach(
              search: _serach.text.isEmpty ? ' ' : _serach.text, offset: '')
          .then((value) {
        setState(() {
          searchs = value.toList();
          offset = value[value.length - 1].id.toString();
        });
      });
    }
  }

  void onLoding() async {
    if (intIndex == 1) {
      var list = await ApiSerach.serach(
        search: _serach.text.isEmpty ? ' ' : _serach.text,
        offset: offset,
      );
      if (list.length == 0) {
        print('stop');
        setState(() {
          _refreshController.loadComplete();
        });
      } else {
        setState(() {
          data.addAll(list);
          _refreshController.loadComplete();
          offset = data[data.length - 1].user_id.toString();

          print(data[data.length - 1].user_id.toString());
        });
      }
    } else if (intIndex == 0) {
      var list = await ApiSearchHashTag.serach(
        search: _serach.text.isEmpty ? ' ' : _serach.text,
        offset: offset,
      );
      if (list.length == 0) {
        print('stop');
        setState(() {
          _refreshController.loadComplete();
        });
      } else {
        setState(() {
          searchs.addAll(list);
          _refreshController.loadComplete();
          offset = searchs[searchs.length - 1].id.toString();

          print(searchs[searchs.length - 1].id.toString());
        });
      }
    }
  }

  @override
  void initState() {
    intIndex = widget.initialIndex;
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 2,
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            bottom: TabBar(
                onTap: (val) {
                  _refreshController.initialRefresh;

                  setState(() {
                    _serach.clear();
                    intIndex = val;
                  });
                },
                tabs: [
                  Tab(
                    text: 'HashTag',
                  ),
                  Tab(
                    text: 'People',
                  ),
                ]),
            centerTitle: true,
            foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
            title: Container(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(63, 158, 158, 158),
                              borderRadius: BorderRadius.circular(20)),
                          width: Get.width * 0.65,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              onChanged: (value) {
                                search();
                              },
                              controller: _serach,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search...'),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              contmydata.avatar.value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: TabBarView(
            children: [
              Container(
                height: Get.height * 0.73,
                child: SmartRefresher(
                  enablePullUp: true,
                  enablePullDown: false,
                  onLoading: onLoding,
                  controller: _refreshController,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i = 0; i < searchs.length; i++)
                          _HashTag(
                            hashTag: searchs[i].hashtag,
                            total: searchs[i].total,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: Get.height * 0.73,
                  child: SmartRefresher(
                    enablePullUp: true,
                    enablePullDown: false,
                    onLoading: onLoding,
                    controller: _refreshController,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var i = 0; i < data.length; i++)
                            InkWell(
                              onTap: () {
                                Get.to(ProfileUserScreen(
                                    user_id: data[i].user_id.toString(), user_name: '',));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          data[i].avatar),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.01,
                                                ),
                                                Text(
                                                  '${data[i].fname} ${data[i].lname}',
                                                  style: SafeGoogleFont(
                                                      Fonts.font1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                if (data[i].verified == '1')
                                                  Icon(
                                                    Icons.verified,
                                                    color: ColorThame,
                                                  )
                                              ],
                                            ),
                                            WidgetFlollow(
                                                is_following:
                                                    data[i].is_following,
                                                user_id:
                                                    data[i].user_id.toString())
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
                ),
              ),
            ],
          )),
    );
  }
}

class _HashTag extends StatelessWidget {
  _HashTag({
    super.key,
    required this.hashTag,
    required this.total,
  });
  String hashTag;
  String total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Get.to(ProfileUserScreen(
                //     user_id: data[i].id.toString()));
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Text('#'),
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                Text(
                                  hashTag,
                                  style: SafeGoogleFont(Fonts.font1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Text(total)
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
    );
  }
}
