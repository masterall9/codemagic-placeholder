import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/Chat/MessagesChatScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiDeleteChat.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiGetChat.dart';
import 'package:colibricmflutter/Utlit/Serves/Models/GetChatModel.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class HomeScreenChat extends StatefulWidget {
  const HomeScreenChat({super.key});

  @override
  State<HomeScreenChat> createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {
  bool deleteTreu = false;
  List<GetChatModel> data = [];
  void GetChat() {
    ApiGetChat.fetch().then((value) {
      setState(() {
        data = value.toList();
      });
    });
  }

  @override
  void initState() {
    GetChat();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Messages'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < data.length; i++)
              Dismissible(
                background: slideRightBackground(),
                secondaryBackground: slideLeftBackground(),
                key: Key(data[i].name),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    await Dialogs.materialDialog(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        msg: 'Are you sure you want to delete his incident?',
                        title: data[i].name,
                        lottieBuilder: Lottie.asset(
                          'assets/Svg/animation_lmi7dvgz.json',
                          fit: BoxFit.contain,
                        ),
                        // customView: MySuperWidget(),
                        customViewPosition: CustomViewPosition.BEFORE_TITLE,
                        context: context,
                        actions: [
                          IconsButton(
                            onPressed: () {
                              setState(() {
                                deleteTreu = false;
                              });
                              Get.back();
                            },
                            text: 'No',
                            iconData: Icons.cancel,
                            color: Colors.blue,
                            textStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                          ),
                          IconsButton(
                            onPressed: () {
                              setState(() {
                                data.removeAt(i);
                                deleteTreu = true;
                              });
                              ApiDeleteChat.delte(
                                  usd: data[i].user_id.toString());
                              Get.back();
                            },
                            text: 'Yes',
                            iconData: Icons.done,
                            color: Colors.red,
                            textStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                          ),
                        ]);

                    return deleteTreu;
                  } else {
                    // TODO: Navigate to edit page;
                  }
                },
                child: InkWell(
                  onTap: () {
                    Get.to(MessagesChatScreen(
                      avat: data[i].avatar,
                      title: data[i].name,
                      id: data[i].user_id.toString(),
                    ));
                    setState(() {
                      data[i].new_messages = '';
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              data[i].avatar),
                                      maxRadius: 25,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.01,
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
                                        SizedBox(
                                          height: Get.height * 0.001,
                                        ),
                                        Text(
                                          data[i].username,
                                          style: SafeGoogleFont(Fonts.font1,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      data[i].time,
                                      style: SafeGoogleFont(Fonts.font1,
                                          color: Colors.grey),
                                    ),
                                    if (data[i]
                                        .new_messages
                                        .toString()
                                        .isNotEmpty)
                                      CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                            255, 122, 16, 9),
                                        maxRadius: 9,
                                        child: Center(
                                            child: Text(
                                          '${data[i].new_messages}',
                                          style: SafeGoogleFont(Fonts.font1,
                                              color: Colors.white, fontSize: 9),
                                        )),
                                      )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.13,
                                ),
                                Text(
                                  data[i].last_message,
                                  style: SafeGoogleFont(Fonts.font1,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.archive,
              color: Colors.white,
            ),
            Text(
              " Archive",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
