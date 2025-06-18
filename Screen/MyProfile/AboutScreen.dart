import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpdateAboutProfile.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final getimydata = Get.find<GetMyUserDataCont>();
  @override
  void initState() {
    ameen();
    super.initState();
  }

  TextEditingController about = TextEditingController();
  ameen() {
    setState(() {
      for (var i = 0; i < getimydata.data.length; i++) {
        about.text = getimydata.data[i].about_you;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: InkWell(
              onTap: () async {
                for (var i = 0; i < getimydata.data.length; i++) {
                  var fin = await ApiUpdateAboutProfile.edite(
                    about: about.text,
                    username: '',
                    first_name: '',
                    email: '',
                    last_name: '',
                    gender: '',
                    website: '',
                    country_id: '',
                  );
                  print(fin);

                  if (fin['code'] == await 200) {
                    getimydata.getUserdata();
                    Get.back(closeOverlays: true);
                  }
                  ;

                  await Get.snackbar('Update', fin['message']);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: ColorThame),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Save'.tr,
                      style: GoogleFonts.cairo(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        foregroundColor: Get.isDarkMode ? ColorThame : ColorThame,
        elevation: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          'About'.tr,
          style: GoogleFonts.cairo(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < getimydata.data.length; i++)
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage:
                          CachedNetworkImageProvider(getimydata.data[i].avatar),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < getimydata.data.length; i++)
                          Text(
                            '${getimydata.data[i].first_name} ${getimydata.data[i].last_name}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                        Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.public,
                                color: Colors.grey,
                                size: 18,
                              ),
                              SizedBox(
                                width: Get.width * 0.001,
                              ),
                              Text(
                                'Public'.tr,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.black
                        : Color.fromARGB(255, 245, 243, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: about,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    maxLength: 100,
                    maxLines: 10,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                // var fin = await ApiUpdateUserData.UpdateUserData(
                //   '',
                //   '',
                //   '',
                //   '',
                //   '',
                //   '',
                //   ' ',
                //   '',
                //   '',
                //   '',
                //   '',
                //   '',
                //   '',
                //   '',
                //   '',
                //   '',
                // );
                // if (fin['api_status'] == 200) Get.back(closeOverlays: true);
                // Get.snackbar('Update', fin['message']);
                // getimydata.getUserdata();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Iconly-Light-Delete.svg',
                      color: Color(0xffD03738),
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Text(
                      'Delete Bio'.tr,
                      style: GoogleFonts.cairo(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffD03738),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
