import 'package:colibricmflutter/Images.dart';
import 'package:colibricmflutter/Screen/HomeScreen/WidgetPosts.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/AddBookmark.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiPostsComment.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiRemovePost.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/Widget/WIdgetMore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReplayCommentScreen extends StatefulWidget {
  const ReplayCommentScreen({super.key, required this.id});
  final String id;

  @override
  State<ReplayCommentScreen> createState() => _ReplayCommentScreenState();
}

class _ReplayCommentScreenState extends State<ReplayCommentScreen> {
  List<feedsModel> data1 = [];

  getPostCommet() {
    ApiPostsComment.fet(id: widget.id).then((value) {
      setState(() {
        data1 = value.toList();
      });
    });
  }

  @override
  void initState() {
    getPostCommet();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Get.isDarkMode ? Colors.white : Colors.black,
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        title: Text(
          'Publication',
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            //AllPosts
            Column(
              children: [
                for (var i = 0; i < data1.length; i++)
                  WidgetPosts(
                    refresh: '',
                    thread_id: data1[i].datapost.donation_amount,
                    commentButton: 1,
                    donations_total: data1[i].datapost.donations_total,
                    donation_raised_percent:
                        data1[i].datapost.donation_raised_percent,
                    is_donation_post: data1[i].datapost.is_donation_post,
                    donation_raised: data1[i].datapost.donation_raised,
                    donation_amount: data1[i].datapost.donation_amount,
                    ontapSave: SavePost(i),
                    has_saved: data1[i].datapost.has_saved,
                    removepost: () {
                      ApiRemovePost.fo(poso: data1[i].datapost.id.toString());
                      setState(() {
                        data1.removeAt(i);
                      });
                      Get.back();
                    },
                    is_repost: data1[i].datapost.is_repost,
                    is_owner: data1[i].datapost.is_owner,
                    user_id: data1[i].datapost.user_id,
                    id: data1[i].datapost.id,
                    media: data1[i].datapost.media,
                    polls: data1[i].datapost.poll,
                    has_liked: data1[i].datapost.has_liked,
                    avatar: data1[i].datapost.avatar,
                    verified: data1[i].datapost.verified,
                    reposter_name: data1[i].datapost.reposter_name,
                    reposter_username: data1[i].datapost.reposter_username,
                    name: data1[i].datapost.name,
                    username: data1[i].datapost.username,
                    time: data1[i].datapost.time,
                    likes_count: int.parse(data1[i].datapost.likes_count),
                    text: data1[i].datapost.text,
                    og_image: data1[i].datapost.og_image,
                    type: data1[i].datapost.type,
                    replys_count: data1[i].datapost.replys_count,
                    reposts_count: int.parse(
                      data1[i].datapost.reposts_count,
                    ),
                  ),
              ],
            ),

            //AllPosts
            SizedBox(
              height: Get.height * 0.01,
            ),

            ////
            ///next data

            Column(
              children: [
                for (var l = 0; l < data1.length; l++)
                  for (var i = 0; i < data1[l].next.length; i++)
                    WidgetPosts(
                      refresh: '',
                      thread_id: data1[l].next[i]['thread_id'].toString(),
                      commentButton: 2,
                      donations_total:
                          data1[l].next[i]['donations_total'] == null
                              ? 0
                              : data1[l].next[i]['donations_total'],
                      donation_raised_percent: data1[l].next[i]
                          ['donation_raised_percent'],
                      is_donation_post: data1[l].next[i]['is_donation_post'],
                      donation_raised: data1[l].next[i]['donation_raised'],
                      donation_amount: data1[l].next[i]['donation_amount'],
                      ontapSave: SavePost(l),
                      has_saved: data1[l].next[i]['has_saved'],
                      removepost: () {
                        ApiRemovePost.fo(
                            poso: data1[l].next[i]['id'].toString());
                        setState(() {
                          data1.removeAt(l);
                        });
                        Get.back();
                      },
                      is_repost:
                          data1[l].next[i]['is_repost'] == null ? false : true,
                      is_owner: data1[l].next[i]['is_owner'],
                      user_id: data1[l].next[i]['user_id'],
                      id: data1[l].next[i]['id'],
                      media: data1[l].next[i]['media'],
                      polls: data1[l].next[i]['media'],
                      has_liked: data1[l].next[i]['has_liked'],
                      avatar: data1[l].next[i]['owner']['avatar'] == null
                          ? ''
                          : data1[l].next[i]['owner']['avatar'],
                      verified: data1[l].next[i]['owner']['verified'] == null
                          ? '0'
                          : data1[l].next[i]['owner']['verified'],
                      reposter_name: data1[l].next[i]['reposter_name'] == null
                          ? ''
                          : data1[l].next[i]['reposter_name'],
                      reposter_username:
                          data1[l].next[i]['reposter_username'] == null
                              ? ''
                              : data1[l].next[i]['reposter_username'],
                      name: data1[l].next[i]['owner']['name'] == null
                          ? ''
                          : data1[l].next[i]['owner']['name'],
                      username: data1[l].next[i]['owner']['username'] == null
                          ? ''
                          : data1[l].next[i]['owner']['username'],
                      time: data1[l].next[i]['time'],
                      likes_count: int.parse(
                        data1[l].next[i]['likes_count'],
                      ),
                      text: data1[l].next[i]['text'],
                      og_image: data1[l].next[i]['og_image'],
                      type: data1[l].next[i]['type'],
                      replys_count: data1[l].next[i]['replys_count'],
                      reposts_count: int.parse(
                        data1[l].next[i]['reposts_count'],
                      ),
                    ),
              ],
            ),

            ///next data

            //comment
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 12),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Get.isDarkMode
            //           ? Color.fromARGB(255, 27, 27, 27)
            //           : Color.fromARGB(255, 255, 246, 246),
            //     ),
            //     width: Get.width,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Row(
            //                 children: [
            //                   CircleAvatar(),
            //                   SizedBox(
            //                     width: Get.width * 0.01,
            //                   ),
            //                   Column(
            //                     mainAxisAlignment: MainAxisAlignment.start,
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Row(
            //                         children: [
            //                           Text(
            //                             overflow: TextOverflow.ellipsis,
            //                             'Ameen hamed',
            //                             style: SafeGoogleFont(Fonts.font1,
            //                                 fontWeight: FontWeight.bold,
            //                                 fontSize: 14),
            //                           ),
            //                           SizedBox(
            //                             width: Get.width * 0.01,
            //                           ),
            //                           Icon(
            //                             Icons.verified,
            //                             color: ColorThame,
            //                             size: 14,
            //                           )
            //                         ],
            //                       ),
            //                       Text(
            //                         'In response to your post',
            //                         style: SafeGoogleFont(Fonts.font1,
            //                             fontSize: 12, color: Colors.grey),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               Text('16 hours ago',
            //                   style: SafeGoogleFont(Fonts.font1,
            //                       fontWeight: FontWeight.w400,
            //                       fontSize: 14,
            //                       color: Colors.grey))
            //             ],
            //           ),

            //           ///postsss
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               children: [
            //                 Text(
            //                     'hugely popular in India, where youngsters often exchange many text messages, and companies provide alerts, infotainment, news, cricket scores updates, railway/airline booking, mobile billing, and banking services on SMS.')
            //               ],
            //             ),
            //           ),

            //           ///postsss

            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 SvgPicture.asset(
            //                   'assets/Svg/Comment.svg',
            //                   color: Colors.grey,
            //                 ),
            //                 SvgPicture.asset(
            //                   'assets/Svg/Like2.svg',
            //                   color: Colors.grey,
            //                 ),
            //                 SvgPicture.asset(
            //                   'assets/Svg/Replay2.svg',
            //                   color: Colors.grey,
            //                 ),
            //                 SvgPicture.asset(
            //                   'assets/Svg/Share2.svg',
            //                   color: Colors.grey,
            //                 ),
            //                 IconButton(
            //                     onPressed: () {},
            //                     icon: Icon(
            //                       Icons.more_horiz,
            //                       color: Colors.grey,
            //                     ))
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget SavePostPin(i) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         pin[i].has_saved != pin[i].has_saved;
  //         ApiAddBookmark.fo(poso: pin[i].id.toString());
  //         Get.back();
  //       });
  //     },
  //     child: WidgetMoreOprionsCansele(
  //       images: images.BookMark,
  //       name: pin[i].has_saved ? 'UnBookmark' : 'Bookmark'.tr,
  //       smallText: pin[i].has_saved
  //           ? 'Remove this post to your favorite list.'
  //           : 'Add this post to your favorite list.'.tr,
  //     ),
  //   );
  // }

  Widget SavePost(i) {
    return InkWell(
      onTap: () {
        setState(() {
          data1[i].datapost.has_saved != data1[i].datapost.has_saved;
          Get.back();
          ApiAddBookmark.fo(poso: data1[i].datapost.id.toString());
        });
      },
      child: WidgetMoreOprionsCansele(
        images: images.BookMark,
        name: data1[i].datapost.has_saved ? 'UnBookmark' : 'Bookmark'.tr,
        smallText: data1[i].datapost.has_saved
            ? 'Remove this post to your favorite list.'
            : 'Add this post to your favorite list.'.tr,
      ),
    );
  }
}
