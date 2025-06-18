import 'package:colibricmflutter/Images.dart';
import 'package:colibricmflutter/Screen/HomeScreen/WidgetPosts.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/AddBookmark.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiGetMyPost.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiRemovePost.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/LodingPostsWidget.dart';
import 'package:colibricmflutter/Widget/WIdgetMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WidgetMyPosts extends StatefulWidget {
  const WidgetMyPosts({
    required this.user_id,
    super.key,
  });
  final String user_id;

  @override
  State<WidgetMyPosts> createState() => _WidgetMyPostsState();
}

class _WidgetMyPostsState extends State<WidgetMyPosts> {
  bool lodingPosts = true;
  List<feedsModel> data = [];
  List<feedsModel> pin = [];

  Future<void> getPost() async {
    ApiGetMyPost.fet(id: widget.user_id, media: '', username: '').then((value) {
      setState(() {
        data = value.toList();
        lodingPosts = false;
      });
    });
    ApiGetMyPostPin.fet(id: widget.user_id).then((value) {
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
                ),
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
