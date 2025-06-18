import 'package:colibricmflutter/Screen/Auh/LoginScreen.dart';
import 'package:colibricmflutter/Screen/Auh/Welcome.dart';
import 'package:colibricmflutter/Screen/NavBar/HomeNavBar.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initalRoute

  static const Loginscreen = Routes.lgoin;
  static const WilcomeSCREEN = Routes.wicomescreen;
  static const hoMeNavBar = Routes.homenavebar;
  // static const ObsObs = Routes.obsobs;

  //GetPage
  static final routes = [
    GetPage(name: Routes.lgoin, page: (() => LoginScreen()), bindings: []),
    GetPage(
        name: Routes.wicomescreen, page: (() => WilcomeScreen()), bindings: []),

    // GetPage(name: Routes.obsobs, page: (() => ObBoos()), bindings: [
    //   MainBininding(),
    // ]),
    // //navbar
    GetPage(name: Routes.homenavebar, page: (() => HomeNavBar()), bindings: [
      // MainBininding(),
    ]),
  ];
}

// CreatePostScreen OnBoardingScreen
class Routes {
  static const wicomescreen = '/WilcomeScreen';
  static const lgoin = '/LoginScreen';
  static const homenavebar = '/HomeNavBar';
}
