// ignore_for_file: must_be_immutable

import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Utlit/Serves/Api/ApiFollow.dart';
import 'package:colibricmflutter/Utlit/TextUtil.dart';
import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:flutter/material.dart';

class WidgetFollow extends StatefulWidget {
  WidgetFollow({super.key, required this.is_following, required this.user_id});
  bool is_following;
  String user_id;
  @override
  State<WidgetFollow> createState() => _WidgetFollowState();
}

class _WidgetFollowState extends State<WidgetFollow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {});
        widget.is_following = !widget.is_following;
        await ApiFollow.fo(usd: widget.user_id);
      },
      child: Container(
          decoration: BoxDecoration(
              color: ColorThame, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              widget.is_following ? 'UnFollow' : 'Follow',
              style: SafeGoogleFont(Fonts.font1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )),
    );
  }
}
