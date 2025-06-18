import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/ProfileUserScreen/ProfileUserScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiShowLikes.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/ShowLikesModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowLikeScreen extends StatefulWidget {
  ShowLikeScreen({super.key, required this.post_id});
  String post_id;

  @override
  State<ShowLikeScreen> createState() => _ShowLikeScreenState();
}

class _ShowLikeScreenState extends State<ShowLikeScreen> {
  List<ShowLikesModel> data = [];
  GetShwLikce() {
    ApishowLik.fet(id: widget.post_id, offset: '0').then((value) {
      setState(() {
        data = value.toList();
      });
    });
  }

  @override
  void initState() {
    GetShwLikce();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Show Likes Post'),
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              for (var i = 0; i < data.length; i++)
                InkWell(
                  onTap: () {
                    Get.to(ProfileUserScreen(
                      user_id: data[i].user_id.toString(),
                      user_name: '',
                    ));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundImage:
                                CachedNetworkImageProvider(data[i].avatar),
                          ),
                          SizedBox(
                            width: Get.width * 0.01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                data[i].name,
                                style: SafeGoogleFont(Fonts.font1,
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                width: Get.height * 0.1,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(data[i].posts.toString()),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Text(
                                    'posts',
                                    style: SafeGoogleFont(Fonts.font1,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  Text(data[i].followers.toString()),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Text(
                                    'followers',
                                    style: SafeGoogleFont(Fonts.font1,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  Text(data[i].following.toString()),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Text(
                                    'following',
                                    style: SafeGoogleFont(Fonts.font1,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Container(
                        width: Get.width,
                        color: Color.fromARGB(110, 158, 158, 158),
                        height: 1,
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
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
