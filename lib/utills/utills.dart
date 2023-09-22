import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  /// colors
  static const primaryColor = Color(0xFFEB89B5);
  static const primaryLightColor = Color(0xFFFFD7E9);
  static const secondaryColor = Color(0xFFFFF8D2);
  static const backgroundColor = Color(0xFFFFFBF3);


  /// images
  static String imgOnboarding = "assets/images/img_login.png";
  static String imgSplash = "assets/images/img_splash.png";
  static String googleIcon = "assets/images/google_icon.png";

  /// font
  static const TextStyle robotoRegular = TextStyle(
    fontFamily: "RobotoRegular",
  );


  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void flushBarErrorMessages(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        titleColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        reverseAnimationCurve: Curves.easeInOut,
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
          size: 28,
        ),
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        title: "Sad",
        messageColor: Colors.white,
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}