import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/HomeScreen/HomeScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreenWallet extends StatefulWidget {
  const HomeScreenWallet({super.key});

  @override
  State<HomeScreenWallet> createState() => _HomeScreenWalletState();
}

class _HomeScreenWalletState extends State<HomeScreenWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          centerTitle: true,
          title: Text('Wallet'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(contmydata.avatar.value),
              ),
            )
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YOUR CREDIT',
                      style: SafeGoogleFont(Fonts.font1,
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(59, 33, 149, 243)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '5.000\$',
                                    style: SafeGoogleFont(Fonts.font1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'YOUR ACCOUNT\'S AVAILABLE FUNDS',
                                    style: SafeGoogleFont(Fonts.font1,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/Svg/Wallet2.svg',
                              color: ColorThame,
                              height: Get.height * 0.05,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'You may withdraw funds or use them in your account for advertising, subscription or other purposes',
                        style: SafeGoogleFont(Fonts.font3,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: ColorThame,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add money',
                                style: SafeGoogleFont(Fonts.font1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorThame,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Send money',
                                style: SafeGoogleFont(Fonts.font1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'WALLET TRANSACTIONS',
                    style: SafeGoogleFont(Fonts.font1,
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Card(
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
                                  backgroundImage: CachedNetworkImageProvider(
                                      contmydata.avatar.value),
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                Text(
                                  'Administrator',
                                  style: SafeGoogleFont(Fonts.font2,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text('5 days ago'),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text('-200\$'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
