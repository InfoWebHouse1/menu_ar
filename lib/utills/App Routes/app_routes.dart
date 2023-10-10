import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_ar/view/Authentication/login_screen.dart';
import 'package:menu_ar/view/Home/home_screen.dart';
import 'package:menu_ar/view/Nav%20Bar/bottom_nav_bar_screen.dart';
import 'package:menu_ar/view/Profile/profile_screen.dart';
import 'package:menu_ar/view/Splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String bottomAppBarScreen = '/bottom_app_bar_screen';
  static const String homeScreen = '/home_screen';
  static const String profileScreen = '/profile_screen';


  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    bottomAppBarScreen: (context) => const CustomNavigationBar(),
    homeScreen: (context) => HomeScreen(),
    profileScreen: (context) => ProfileScreen(currentUserID: FirebaseAuth.instance.currentUser!.uid),
  };
}