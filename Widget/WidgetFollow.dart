import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiFollow.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:flutter/material.dart';

class WidgetFlollow extends StatefulWidget {
  WidgetFlollow({
    super.key,
    required this.is_following,
    required this.user_id,
  });
  bool is_following;
  String user_id;

  @override
  State<WidgetFlollow> createState() => _WidgetFlollowState();
}

class _WidgetFlollowState extends State<WidgetFlollow> {
  void folow() {
    setState(() {
      widget.is_following = !widget.is_following;
      ApiFollow.fo(usd: widget.user_id);
    });
    print(widget.is_following);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: folow,
      child: Container(
        decoration: BoxDecoration(
            color: ColorThame, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.is_following ? 'UnFollow' : 'Follow',
            style: SafeGoogleFont(Fonts.font1, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
