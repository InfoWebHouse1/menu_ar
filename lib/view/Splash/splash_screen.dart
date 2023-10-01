import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/view/Authentication/login_screen.dart';
import 'package:menu_ar/view/Home/home_screen.dart';
import 'package:menu_ar/viewModel/auth_view_model.dart';
import 'package:page_transition/page_transition.dart';

import '../../utills/App Routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.pushNamed(context, AppRoutes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: Center(
        child: Image.asset(
          Utils.imgSplash,
          fit: BoxFit.cover,
          width: width,
        ),
      ),
    );
  }
}
