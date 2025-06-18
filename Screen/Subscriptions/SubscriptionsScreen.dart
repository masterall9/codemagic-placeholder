import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiFetchSubscriptin.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/GetSubscriptionModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  bool lod = false;
  bool notFound = false;
  void loding() {
    setState(() {
      lod = !lod;
    });
  }

  List<GetSubscriptionModel> data = [];

  Future<void> ameen() async {
    setState(() {
      loding();
    });
    var ameen = await ApiFetchSubscriptin.fet().then((value) {
      setState(() {
        data = value.toList();

        loding();
        if (value.length == 0) {
          notFound = !notFound;
        }
      });
    });
  }

  @override
  void initState() {
    ameen();
    super.initState();
  }

  Widget build(BuildContext context) {
    final df = new DateFormat('dd-MM-yyyy hh:mm a');

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(contmydata.avatar.value),
            ),
          )
        ],
        elevation: 0,
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        title: Text('Subscriptions'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: lod
          ? Center(
              child: CircularProgressIndicator(),
            )
          : notFound
              ? Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          'assets/Svg/avatar-thinking-8-svgrepo-com.svg'),
                      Text(
                        'You are not a subscriber',
                        style: SafeGoogleFont(Fonts.font1,
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i < data.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 14),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                data[i].avatar),
                                        maxRadius: 21,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[i].name,
                                            style: SafeGoogleFont(Fonts.font1,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Row(
                                            children: [
                                              _WidgetBodyName(
                                                title: 'posts',
                                                numper:
                                                    data[i].posts.toString(),
                                              ),
                                              _WidgetBodyName(
                                                title: 'followers',
                                                numper: data[i]
                                                    .followers
                                                    .toString(),
                                              ),
                                              _WidgetBodyName(
                                                title: 'following',
                                                numper: data[i]
                                                    .following
                                                    .toString(),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            87, 158, 158, 158),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: Get.width,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${data[i].left_days} days left',
                                              style: SafeGoogleFont(
                                                Fonts.font2,
                                                color: const Color.fromARGB(
                                                    255, 117, 116, 116),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'end ${df.format(new DateTime.fromMillisecondsSinceEpoch(int.parse(data[i].subscription_end) * 1000))}',
                                              style: SafeGoogleFont(
                                                Fonts.font2,
                                                color: const Color.fromARGB(
                                                    255, 117, 116, 116),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Container(
                                width: Get.width,
                                height: Get.height * 0.001,
                                color: Color.fromARGB(94, 90, 90, 90),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
    );
  }
}

class _WidgetBodyName extends StatelessWidget {
  const _WidgetBodyName({
    super.key,
    required this.numper,
    this.title,
  });
  final String numper;
  final title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          numper,
          style: SafeGoogleFont(Fonts.font1, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: Get.width * 0.01,
        ),
        Text(
          title,
          style: SafeGoogleFont(Fonts.font1,
              color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: Get.width * 0.1,
        ),
      ],
    );
  }
}
