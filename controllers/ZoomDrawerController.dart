import 'package:colibricmflutter/String.dart';
import 'package:colibricmflutter/Widget/DrawerState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screen/NavBar/HomeNavBar.dart';

class ZoomDrawerAmeenHamedFlutterCraftersController {
  /// Open drawer
  TickerFuture? Function()? open;

  /// Close drawer
  TickerFuture? Function()? close;

  /// Toggle drawer
  TickerFuture? Function({bool forceToggle})? toggle;

  /// Determine if status of drawer equals to Open
  bool Function()? isOpen;

  /// Drawer state notifier
  /// opening, closing, open, closed
  ValueNotifier<DrawerState>? stateNotifier;
}

void geToDrawer({required getTo}) {
  if (drawerNavi) {
    z.close?.call()?.then((value) => Get.to(getTo));
  } else {
    Get.to(getTo);
  }
}
