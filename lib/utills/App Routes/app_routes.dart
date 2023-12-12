import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_ar/view/Authentication/login_screen.dart';
import 'package:menu_ar/view/Home/camera_screen.dart';
import 'package:menu_ar/view/Home/home_screen.dart';
import 'package:menu_ar/view/Home/qr_view.dart';
import 'package:menu_ar/view/Home/result_screen.dart';
import 'package:menu_ar/view/Home/review_screen.dart';
import 'package:menu_ar/view/Nav%20Bar/bottom_nav_bar_screen.dart';
import 'package:menu_ar/view/Profile/about_us_screen.dart';
import 'package:menu_ar/view/Profile/help_screen.dart';
import 'package:menu_ar/view/Profile/privacy_policy_screen.dart';
import 'package:menu_ar/view/Profile/profile_screen.dart';
import 'package:menu_ar/view/Splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String bottomAppBarScreen = '/bottom_app_bar_screen';
  static const String homeScreen = '/home_screen';
  static const String profileScreen = '/profile_screen';
  static const String cameraScreen = '/camera_screen';
  static const String resultScreen = '/result_screen';
  static const String QRScreen = '/qr_screen';
  static const String PPScreen = '/privacy_policy_screen';
  static const String aboutUsScreen = '/about_us_screen';
  static const String helpScreen = '/help_screen';
  static const String reviewScreen = '/review_screen';


  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    bottomAppBarScreen: (context) => const CustomNavigationBar(),
    homeScreen: (context) => HomeScreen(),
    profileScreen: (context) => ProfileScreen(currentUserID: FirebaseAuth.instance.currentUser!.uid),
    cameraScreen: (context) => const CameraScreen(),
    resultScreen: (context) => ResultTextScreen(),
    QRScreen: (context) => const QRViewScreen(),
    PPScreen: (context) => const PrivacyPolicyScreen(),
    aboutUsScreen: (context) => const AboutUsScreen(),
    helpScreen: (context) => const HelpScreen(),
    reviewScreen: (context) => ReviewScreen(),
  };
}