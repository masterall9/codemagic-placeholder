import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApuGetNorfiaction.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/GetNofication.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNotificationsScreen extends StatefulWidget {
  const HomeNotificationsScreen({super.key});

  @override
  State<HomeNotificationsScreen> createState() =>
      _HomeNotificationsScreenState();
}

class _HomeNotificationsScreenState extends State<HomeNotificationsScreen> {
  var contmydata = Get.put(GetMyUserDataCont());
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(contmydata.avatar.value),
                ),
              ),
              bottom: TabBar(tabs: [
                Tab(text: 'All'),
                Tab(
                  text: 'Mentions',
                ),
              ]),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
              title: Text('Notifications'),
              centerTitle: true,
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: _WidgetAll(
                    status: '0',
                  ),
                ),
              ],
            )));
  }
}

class _WidgetAll extends StatefulWidget {
  const _WidgetAll({
    super.key,
    required this.status,
  });

  final String status;

  @override
  State<_WidgetAll> createState() => _WidgetAllState();
}

class _WidgetAllState extends State<_WidgetAll> {
  List<GetNofication> data = [];
  void GetNorfi() {
    ApuGetNorfiaction.fet(type: 'notifs').then((value) {
      setState(() {
        data = value.toList();
      });
    });
  }

  @override
  void initState() {
    GetNorfi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          for (var i = 0; i < data.length; i++)
            InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: ShapeDecoration(
                              color: data[i].status == '1'
                                  ? Colors.grey
                                  : Color(0xFF724DBD),
                              shape: const StarBorder(
                                points: 4,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0.50,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    CachedNetworkImageProvider(data[i].avatar),
                              ),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ConvText(
                                      '${data[i].name} ${data[i].time}',
                                    ),
                                    style: SafeGoogleFont(Fonts.font3),
                                  ),
                                  if (data[i].subject == 'repost')
                                    WidgetText(text: 'Shared your publication'),
                                  if (data[i].subject == 'reply')
                                    WidgetText(text: 'Replied to your post'),
                                  if (data[i].subject == 'like')
                                    WidgetText(text: 'Liked your post'),
                                  if (data[i].subject == 'subscribe')
                                    WidgetText(text: 'Started following you'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget WidgetText({required String text, required}) {
    return Text(
      ConvText(text),
      style: SafeGoogleFont(Fonts.FontLogin, fontWeight: FontWeight.w400),
    );
  }
}
