import 'package:colibricmflutter/Widget/DrawelActtiionAmeen.dart';
import 'package:colibricmflutter/Widget/DrawerState.dart';
import 'package:colibricmflutter/Widget/DrawerStyleBuilder.dart';
import 'package:flutter/material.dart';

extension ZoomDrawerAmeenHamedFlutterCraftersContext on BuildContext {
  /// Drawer
  ZoomDrawerAmeenHamedFlutterCraftersState? get drawer =>
      ZoomDrawerAmeenHamedFlutterCrafters.of(this);

  /// drawerLastAction
  DrawerLastAction? get drawerLastAction =>
      ZoomDrawerAmeenHamedFlutterCrafters.of(this)?.drawerLastAction;

  /// drawerState
  DrawerState? get drawerState =>
      ZoomDrawerAmeenHamedFlutterCrafters.of(this)?.stateNotifier.value;

  /// drawerState notifier
  ValueNotifier<DrawerState>? get drawerStateNotifier =>
      ZoomDrawerAmeenHamedFlutterCrafters.of(this)?.stateNotifier;

  /// Screen Width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Screen Height
  double get screenHeight => MediaQuery.of(this).size.height;
}
