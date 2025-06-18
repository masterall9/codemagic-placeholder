import 'dart:async';

import 'package:colibricmflutter/Screen/Chat/HomeScreenChat.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/Screen/Notifications/HomeNotificationsScreen.dart';
import 'package:colibricmflutter/Screen/Search/HomeScreenSearch.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Themes.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiContNotfi.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:colibricmflutter/controllers/ZoomDrawerController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

final ZoomDrawerAmeenHamedFlutterCraftersController z =
    ZoomDrawerAmeenHamedFlutterCraftersController();

class HomeNavBar extends StatefulWidget {
  HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> with TickerProviderStateMixin {
  Timer? _timer;
  final cont = Get.put(GetMyUserDataCont());
  PageController _controller = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int contNotfi = 0;
  int contMessages = 0;
  getNofi() async {
    var not = await ApiNofiCont.Cont();
    setState(() {
      contNotfi = not['ameen_notf'] - 1;
      contMessages = not['amee_mess'];
    });
  }

  TimerTimer() {
    Timer.periodic(Duration(seconds: GetMessagesAndNofi), (timer) async {
      var not = await ApiNofiCont.Cont();
      setState(() {
        contNotfi = not['ameen_notf'] - 1;
        contMessages = not['amee_mess'];
      });
    });
  }

  late Animation<double> _animation;
  late AnimationController _animationController;
  int tabIndex = 0;

  void changePageTo(int index) {
    tabIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    getNofi();
    TimerTimer();
    tabIndex = 0;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.bounceIn, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 0).animate(curvedAnimation);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottomNavigationBar: BottomAppBar(
          color: Get.isDarkMode ? ColorDarkComponents : Colors.white,
          child: Container(
              height: Get.height * 0.07,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.7)]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        changePageTo(0);
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/Svg/home-1-svgrepo-com.svg',
                              color: tabIndex == 0
                                  ? ColorThame
                                  : Get.isDarkMode
                                      ? Colors.grey
                                      : Get.isDarkMode
                                          ? Colors.grey
                                          : null,
                              // color: Color.fromARGB(255, 255, 255, 255),
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changePageTo(1);
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/Svg/search-status-svgrepo-com.svg',
                              color: tabIndex == 1
                                  ? ColorThame
                                  : Get.isDarkMode
                                      ? Colors.grey
                                      : null,
                              // color: Color.fromARGB(255, 255, 255, 255),
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          changePageTo(2);
                        },
                        child: Container(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/Svg/notification-bing-svgrepo-com.svg',
                                    color: tabIndex == 2
                                        ? ColorThame
                                        : Get.isDarkMode
                                            ? Colors.grey
                                            : null,
                                    // color: Color.fromARGB(255, 255, 255, 255),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              if (contNotfi > 0)
                                Positioned(
                                  top: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorThame),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        contNotfi > 99
                                            ? '99+'
                                            : contNotfi.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        )),
                    InkWell(
                        onTap: () {
                          changePageTo(4);
                        },
                        child: Container(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/Svg/messages-1-svgrepo-com.svg',
                                    color: tabIndex == 4
                                        ? ColorThame
                                        : Get.isDarkMode
                                            ? Colors.grey
                                            : null,
                                    // color: Color.fromARGB(255, 255, 255, 255),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              if (contMessages > 0)
                                Positioned(
                                  top: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorThame),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        contMessages > 99
                                            ? '99+'
                                            : contMessages.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        )),
                  ],
                ),
              )),
        ),
        body: PageView(
          onPageChanged: (index) {
            changePageTo(index);
          },
          controller: PageController(initialPage: tabIndex),
          children: [
            if (tabIndex == 0) HomeScreen(),
            if (tabIndex == 1)
              HomeScreenSearch(
                initialIndex: 0,
              ),
            if (tabIndex == 2) HomeNotificationsScreen(),
            if (tabIndex == 4) HomeScreenChat(),
          ],
        ));
  }
}
