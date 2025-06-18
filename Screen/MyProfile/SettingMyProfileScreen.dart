import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibricmflutter/Screen/MyProfile/AboutScreen.dart';
import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpditeAvat.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUpditeCover.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiUplodeImage.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:colibricmflutter/controllers/GetMyUserDataCont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EditProfileSreen extends StatefulWidget {
  EditProfileSreen(
      {required this.avat, required this.cover, required this.bio});
  String avat;
  String cover;
  String bio;

  @override
  State<EditProfileSreen> createState() => _EditProfileSreenState();
}

class _EditProfileSreenState extends State<EditProfileSreen> {
  final getimydata = Get.find<GetMyUserDataCont>();
  bool lod = false;
  XFile? ImagePost;
  String? filename;
  XFile? ImagePost2;
  String? filename2;
  String about = '';
  @override
  void initState() {
    anoutte();
    super.initState();
  }

  anoutte() {
    setState(() {
      for (var i = 0; i < getimydata.data.length; i++)
        about = about = getimydata.data[i].about_you;
    });
  }

  final ImagePicker _picker = ImagePicker();
  void ImageUplode() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    image = await _cropImage(image!);
    image;

    setState(() {
      filename = image!.path.split('/').last;
      ImagePost = image;
      print(image.path);

      ;
    });
  }

  Future<XFile?> _cropImage(XFile filePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath.path,
      cropStyle: CropStyle.circle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    return XFile(croppedFile!.path);
  }

  final ImagePicker _picker2 = ImagePicker();
  void ImageUplode2() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    image = await _cropImage2(image!);
    image;

    setState(() {
      filename2 = image!.path.split('/').last;
      ImagePost2 = image;
      print(image.path);

      ;
    });
  }

  Future<XFile?> _cropImage2(XFile filePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'test',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper'.tr,
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    return XFile(croppedFile!.path);
  }

  void OnTap() async {
    setState(() {
      lod = true;
    });

    if (ImagePost != null) {
      var ameen = await ApiUpditeAvat.add(file: ImagePost!.path);

      print('amneen $ameen');
      if (ameen == 'OK') {
        await Get.put(GetMyUserDataCont());
        getimydata.getUserdata();

        lod = false;

        setState(() {});
      }
    } else if (ImagePost2 != null) {
      var ameen = await ApiUpditeCover.add(file: ImagePost2!.path);

      print('amneen $ameen');
      if (ameen == 'OK') {
        await Get.put(GetMyUserDataCont());
        getimydata.getUserdata();

        lod = false;
        Get.back();
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    anoutte();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile'.tr,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        actions: [
          InkWell(
            onTap: OnTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorThame,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Done'.tr,
                    style: SafeGoogleFont(Fonts.font1,
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: lod
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Image Profile'.tr,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        InkWell(
                          onTap: ImageUplode,
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: ColorThame,
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              Text(
                                'Edit'.tr,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    ImagePost == null
                        ? Container(
                            decoration: BoxDecoration(
                              color: Get.isDarkMode ? Colors.black : ColorThame,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: Get.height * 0.17,
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(widget.avat))),
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Get.isDarkMode ? Colors.black : ColorThame,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            height: Get.height * 0.17,
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            FileImage(File(ImagePost!.path)))),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),

                    //////cover image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Image Cover'.tr,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        InkWell(
                          onTap: () {
                            ImageUplode2();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: ColorThame,
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              Text(
                                'Edit'.tr,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? Colors.black : ColorThame,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: Get.height * 0.2,
                      width: Get.width,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: ImagePost2 == null
                                  ? CachedNetworkImage(
                                      imageUrl: widget.cover,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(ImagePost2!.path),
                                      fit: BoxFit.cover,
                                    )),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _DetailsWidget extends StatelessWidget {
  String assets;
  String name;
  _DetailsWidget({required this.assets, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/images/$assets'),
        SizedBox(
          width: Get.width * 0.01,
        ),
        Text(
          name,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }
}
