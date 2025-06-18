import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class WidgetZoomImages extends StatefulWidget {
  const WidgetZoomImages({super.key, required this.images});
  final String images;

  @override
  State<WidgetZoomImages> createState() => _WidgetZoomImagesState();
}

class _WidgetZoomImagesState extends State<WidgetZoomImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: Get.width,
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(widget.images),
        ),
      ),
    );
  }
}
