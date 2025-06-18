// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:colibricmflutter/Images.dart';
// import 'package:colibricmflutter/Screen/Chat/MessagesChatScreen.dart';
// import 'package:colibricmflutter/Screen/HomeScreen/WidgetPosts.dart';
// import 'package:colibricmflutter/Screen/ProfileUserScreen/WidgetPostsProfile.dart';
// import 'package:colibricmflutter/Screen/ScreenFollow/FollowingScreen.dart';
// import 'package:colibricmflutter/String.dart';
// import 'package:colibricmflutter/Themes.dart';
// import 'package:colibricmflutter/Utlit/Serves/Api/AddBookmark.dart';
// import 'package:colibricmflutter/Utlit/Serves/Api/ApiBlockUser.dart';
// import 'package:colibricmflutter/Utlit/Serves/Api/ApiFollow.dart';
// import 'package:colibricmflutter/Utlit/Serves/Api/ApiGetDataProfileId.dart';
// import 'package:colibricmflutter/Utlit/Serves/Api/ApiGetMyPost.dart';
// import 'package:colibricmflutter/Utlit/Serves/Api/ApiRemovePost.dart';
// import 'package:colibricmflutter/Utlit/Serves/Api/ApiReportUser.dart';
// import 'package:colibricmflutter/Utlit/Serves/Models/GetProfileDataModel.dart';
// import 'package:colibricmflutter/Utlit/Serves/Models/feedsModel.dart';
// import 'package:colibricmflutter/Utlit/TextUtil.dart';
// import 'package:colibricmflutter/Widget/Colors.dart';
// import 'package:colibricmflutter/Widget/WIdgetMore.dart';
// import 'package:colibricmflutter/Widget/WidgetFollwo.dart';
// import 'package:colibricmflutter/controllers/SharedPreferences.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:material_dialogs/material_dialogs.dart';
// import 'package:material_dialogs/widgets/buttons/icon_button.dart';
// import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

// class ProfileUserScreen extends StatefulWidget {
//   const ProfileUserScreen(
//       {super.key, required this.user_id, required this.user_name});
//   final String user_id;
//   final String user_name;

//   @override
//   State<ProfileUserScreen> createState() => _ProfileUserScreenState();
// }

// class _ProfileUserScreenState extends State<ProfileUserScreen> {
//   int postViews = 0;

//   List<GetProfileDataModel> data = [];
//   String ids = '0';
//   void getUserdata() async {
//     String id = await SharedP.Get('tok');
//     ApiGetDataProfileId.fetch(widget.user_id.toString(), widget.user_name)
//         .then((ameen) {
//       setState(() {
//         setState(() {
//           ids = id;
//         });
//         data = ameen.toList();
//       });
//     });
//   }

//   @override
//   void initState() {
//     getUserdata();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               // SliverAppBar(
//               //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//               //   foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
//               //   actions: [
//               //     IconButton(onPressed: () {}, icon: Icon(Icons.settings))
//               //   ],
//               // ),
//             ];
//           },
//           body: Column(
//             children: [
//               SizedBox(
//                 height: Get.height * 0.04,
//               ),
//               Container(
//                 height: Get.height * 0.96,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: Get.height * 0.45,
//                         width: Get.width,
//                         child: Stack(
//                           children: [
//                             for (var i = 0; i < data.length; i++)
//                               Container(
//                                 width: Get.width,
//                                 height: Get.height * 0.23,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: CachedNetworkImageProvider(
//                                             data[i].cover))),
//                               ),
//                             Positioned(
//                               top: 5,
//                               left: 5,
//                               child: Container(
//                                 width: Get.width * 0.80,
//                                 child: Row(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         for (var i = 0; i < data.length; i++)
//                                           Get.bottomSheet(MorePfofileUser(
//                                             usd: data[i].id.toString(),
//                                             username:
//                                                 '${data[i].first_name} ${data[i].last_name}',
//                                           ));
//                                       },
//                                       child: CircleAvatar(
//                                         backgroundColor:
//                                             Colors.black.withOpacity(0.7),
//                                         child: Icon(
//                                           Icons.more_horiz,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Get.back();
//                                       },
//                                       child: CircleAvatar(
//                                         backgroundColor:
//                                             Colors.black.withOpacity(0.7),
//                                         child: Icon(
//                                           Icons.arrow_back_ios_new,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             for (var i = 0; i < data.length; i++)
//                               Positioned(
//                                 left: Get.width * 0.05,
//                                 bottom: Get.height * 0.09,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CircleAvatar(
//                                       maxRadius: 55,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(2.0),
//                                         child: CircleAvatar(
//                                           maxRadius: 55,
//                                           backgroundImage:
//                                               CachedNetworkImageProvider(
//                                                   data[i].avatar),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: Get.height * 0.01,
//                                     ),
//                                     Container(
//                                       width: Get.width * 0.90,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             data[i].first_name +
//                                                 ' ' +
//                                                 data[i].last_name,
//                                             style: SafeGoogleFont(Fonts.font1,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 16),
//                                           ),
//                                           InkWell(
//                                             onTap: () {
//                                               Get.to(MessagesChatScreen(
//                                                   title: data[i].first_name +
//                                                       ' ' +
//                                                       data[i].last_name,
//                                                   id: widget.user_id,
//                                                   avat: data[i].avatar));
//                                             },
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                       .symmetric(
//                                                       horizontal: 10),
//                                                   child: CircleAvatar(
//                                                     backgroundColor: ColorThame,
//                                                     child: SvgPicture.asset(
//                                                       'assets/Svg/message-text-1-svgrepo-com.svg',
//                                                       height: 30,
//                                                       color: Colors.white,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 InkWell(
//                                                   onTap: () {
//                                                     ApiFollow.fo(
//                                                         usd: widget.user_id);
//                                                     setState(() {
//                                                       data[i].is_following =
//                                                           !data[i].is_following;
//                                                     });
//                                                   },
//                                                   child: Container(
//                                                     decoration: BoxDecoration(
//                                                         color: ColorThame,
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(20)),
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text(
//                                                         data[i].is_following
//                                                             ? 'Unfollow'
//                                                             : 'Follow',
//                                                         style: SafeGoogleFont(
//                                                             Fonts.font2,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Text(
//                                       '@' + data[i].user_name,
//                                       style: SafeGoogleFont(
//                                         Fonts.font1,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             for (var i = 0; i < data.length; i++)
//                               Positioned(
//                                   bottom: 0,
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10),
//                                     child: Container(
//                                       width: Get.width * 0.90,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           SizedBox(
//                                             height: Get.height * 0.01,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.public,
//                                                     color: Colors.grey,
//                                                   ),
//                                                   SizedBox(
//                                                       width: Get.width * 0.01),
//                                                   Text(data[i].country),
//                                                   SizedBox(
//                                                       width: Get.width * 0.02),
//                                                   if (data[i].gender == 'M')
//                                                     Icon(
//                                                       Icons.male,
//                                                       color: Colors.blue,
//                                                     ),
//                                                   SizedBox(
//                                                       width: Get.width * 0.01),
//                                                   if (data[i].gender == 'M')
//                                                     Text('Male'),
//                                                   if (data[i].gender == 'F')
//                                                     Icon(
//                                                       Icons.female,
//                                                       color: Colors
//                                                           .deepPurpleAccent,
//                                                     ),
//                                                   SizedBox(
//                                                       width: Get.width * 0.01),
//                                                   if (data[i].gender == 'F')
//                                                     Text('Female'),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Text('Follower'),
//                                                       SizedBox(
//                                                         width: Get.width * 0.01,
//                                                       ),
//                                                       Text(data[i]
//                                                           .follower_count
//                                                           .toString())
//                                                     ],
//                                                   ),
//                                                   SizedBox(
//                                                     width: Get.width * 0.01,
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       Text('Following'),
//                                                       SizedBox(
//                                                         width: Get.width * 0.01,
//                                                       ),
//                                                       Text(data[i]
//                                                           .following_count
//                                                           .toString())
//                                                     ],
//                                                   ),
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               data[i].website.isNotEmpty
//                                                   ? Row(
//                                                       children: [
//                                                         Icon(
//                                                           Icons.link,
//                                                           color: Colors.grey,
//                                                         ),
//                                                         Text(data[i].website)
//                                                       ],
//                                                     )
//                                                   : SizedBox(),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ))
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: Get.height * 0.01,
//                       ),
//                       Container(
//                         width: Get.width,
//                         color:
//                             Get.isDarkMode ? ColorDarkComponents : Colors.white,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   postViews = 0;
//                                 });
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 5),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 7),
//                                 decoration: BoxDecoration(
//                                     color: postViews == 0 ? ColorThame : null,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: Text(
//                                   'Posts'.tr,
//                                   style: SafeGoogleFont(Fonts.font1,
//                                       fontWeight: FontWeight.bold,
//                                       color: postViews == 0
//                                           ? Colors.white
//                                           : Colors.grey),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   postViews = 1;
//                                 });
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 5),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 7),
//                                 decoration: BoxDecoration(
//                                     color: postViews == 1 ? ColorThame : null,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: Text(
//                                   'Media'.tr,
//                                   style: SafeGoogleFont(Fonts.font1,
//                                       fontWeight: FontWeight.bold,
//                                       color: postViews == 1
//                                           ? Colors.white
//                                           : Colors.grey),
//                                 ),
//                                 // Container(
//                                 //   height: 1,
//                                 //   width: Get.width,
//                                 //   color: postViews == 0 ? ColorTheme : Colors.grey,
//                                 // )
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   postViews = 2;
//                                 });
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 5),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 7),
//                                 decoration: BoxDecoration(
//                                     color: postViews == 2 ? ColorThame : null,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: Text(
//                                   'Likes'.tr,
//                                   style: SafeGoogleFont(Fonts.font1,
//                                       fontWeight: FontWeight.bold,
//                                       color: postViews == 2
//                                           ? Colors.white
//                                           : Colors.grey),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       for (var i = 0; i < data.length; i++)
//                         if (postViews == 0)
//                           WidgetMyPosts(
//                             user_id: data[i].id.toString(),
//                           ),
//                       if (postViews == 1) Text('media'),
//                       if (postViews == 2) Text('likes'),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }

// class MorePfofileUser extends StatelessWidget {
//   const MorePfofileUser({
//     super.key,
//     required this.usd,
//     required this.username,
//   });
//   final String usd;
//   final String username;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         height: Get.height * 0.25,
//         decoration: BoxDecoration(
//             color: Get.isDarkMode
//                 ? ColorDarkBackground
//                 : Theme.of(context).scaffoldBackgroundColor,
//             borderRadius: BorderRadius.circular(
//               20,
//             )),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: Get.width * 0.20,
//                     height: 4,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Color(0xffE2E8F0),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                       child: Text(
//                     'More Oprions'.tr,
//                     style: SafeGoogleFont(Fonts.font2,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//                 SizedBox(
//                   height: Get.height * 0.01,
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                         color: Get.isDarkMode
//                             ? ColorDarkComponents
//                             : Theme.of(context).scaffoldBackgroundColor,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Column(children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         color: Colors.grey.withOpacity(0.3),
//                         height: 1,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Get.back();
//                           Dialogs.materialDialog(
//                               msg: 'Are you sure ? Block The ${username} ',
//                               title: "Block",
//                               color: Colors.white,
//                               context: context,
//                               actions: [
//                                 IconsOutlineButton(
//                                   onPressed: () {
//                                     Get.back();
//                                   },
//                                   text: 'Cancel',
//                                   iconData: Icons.cancel_outlined,
//                                   textStyle: TextStyle(color: Colors.grey),
//                                   iconColor: Colors.grey,
//                                 ),
//                                 IconsButton(
//                                   onPressed: () {
//                                     ApiBlockUser.block(usd: usd);
//                                     Get.back();
//                                     Get.back();
//                                   },
//                                   text: 'Block',
//                                   iconData: Icons.delete,
//                                   color: Colors.red,
//                                   textStyle: TextStyle(color: Colors.white),
//                                   iconColor: Colors.white,
//                                 ),
//                               ]);
//                         },
//                         child: WidgetMoreOprions(
//                           images: images.block,
//                           name: 'Block the user'.tr,
//                           smallText:
//                               'If he is blocked, you will not see his posts'.tr,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         color: Colors.grey.withOpacity(0.3),
//                         height: 1,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Get.back();
//                           Get.dialog(ReportPorfile(
//                             post_id: usd,
//                           ));
//                         },
//                         child: WidgetMoreOprions(
//                           images: images.infocircle,
//                           name: 'Report'.tr,
//                           smallText: 'Report the user'.tr,
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         color: Colors.grey.withOpacity(0.3),
//                         height: 1,
//                       ),
//                     ])),
//               ],
//             ),
//           ]),
//         ));
//   }
// }

// class ReportPorfile extends StatefulWidget {
//   const ReportPorfile({
//     super.key,
//     required this.post_id,
//   });
//   final String post_id;

//   @override
//   State<ReportPorfile> createState() => _ReportPorfileState();
// }

// class _ReportPorfileState extends State<ReportPorfile> {
//   final TextEditingController commment = TextEditingController();
//   String cilic = 'click here';
//   int num = 0;
//   List report = [
//     '',
//     'This user using this account for smap',
//     'This user pretended to be someone',
//     'This user posting inappropriate content',
//     'This is a fake account',
//     'This is a fraudulent account',
//     'Other',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 2,
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     borderRadius: BorderRadius.circular(20)),
//                 width: Get.width,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Scaffold(
//                       appBar: AppBar(
//                         elevation: 0,
//                         foregroundColor:
//                             Get.isDarkMode ? Colors.white : ColorThame,
//                         backgroundColor:
//                             Theme.of(context).scaffoldBackgroundColor,
//                         title: Text('Report'.tr),
//                       ),
//                       body: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       color: ColorThame,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: PopupMenuButton(
//                                       offset: Offset(0, Get.height * 0.01),
//                                       onSelected: (int index) {
//                                         print('index is $index');
//                                         setState(() {
//                                           num = index;
//                                         });
//                                       },
//                                       onCanceled: () {
//                                         print('cancelled!');
//                                       },
//                                       child: Center(
//                                           child: Text(
//                                         num.toString() == '0'
//                                             ? cilic
//                                             : report[num],
//                                         style: SafeGoogleFont(Fonts.font1,
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 16),
//                                       )),
//                                       itemBuilder: (context) {
//                                         return List.generate(report.length,
//                                             (index) {
//                                           return PopupMenuItem(
//                                             value: index,
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   report[index],
//                                                   style: SafeGoogleFont(
//                                                       Fonts.font1,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 16),
//                                                   textAlign: TextAlign.center,
//                                                 ),
//                                                 Divider()
//                                               ],
//                                             ),
//                                           );
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(42, 158, 158, 158),
//                                   borderRadius: BorderRadius.circular(20)),
//                               width: Get.width,
//                               height: Get.height * 0.30,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: TextField(
//                                   controller: commment,
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: 'Comment...'),
//                                   maxLines: null,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               InkWell(
//                                 onTap: () async {
//                                   Get.back();
//                                 },
//                                 child: Container(
//                                   width: Get.width * 0.30,
//                                   height: Get.height * 0.05,
//                                   decoration: BoxDecoration(
//                                       color: ColorThame,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Center(
//                                       child: Text(
//                                     'Cancel'.tr,
//                                     style: SafeGoogleFont(Fonts.font1,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold),
//                                   )),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () async {
//                                   print('Submit');
//                                   ApiReportUser.fo(
//                                       usd: widget.post_id,
//                                       reason: num.toString(),
//                                       comment: commment.text);
//                                   Get.back();
//                                 },
//                                 child: Container(
//                                   width: Get.width * 0.30,
//                                   height: Get.height * 0.05,
//                                   decoration: BoxDecoration(
//                                       color: ColorThame,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Center(
//                                       child: Text(
//                                     'Submit'.tr,
//                                     style: SafeGoogleFont(Fonts.font1,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold),
//                                   )),
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       )),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
