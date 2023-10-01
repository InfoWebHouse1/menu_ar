import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  ///Firebase Document Ref
  final userRef = FirebaseFirestore.instance.collection("Users");

  /// colors
  static const primaryColor = Color(0xFFEB89B5);
  static const primaryLightColor = Color(0xFFFFD7E9);
  static const secondaryColor = Color(0xFFFFF8D2);
  static const backgroundColor = Color(0xFFFFFBF3);
  static const blackColor = Color(0xFF000000);
  static const greyColor = Colors.grey;
  static const blueColor = Color(0XFF1886E7);
  static const redColor = Color(0XFFBE2020);
  static const lightRedColor = Color(0XFFFF5454);

  /// images
  static String imgOnboarding = "assets/images/img_login.png";
  static String imgSplash = "assets/images/img_splash.png";
  static String googleIcon = "assets/images/google_icon.png";
  static String defaultImg = "assets/images/cartoon.png";

  /// font
  static const TextStyle robotoRegular = TextStyle(
    fontFamily: "RobotoRegular",
  );

  /// Custom Dialog Box
  customDialogBox({
    BuildContext? context,
    VoidCallback? onTapYes,
    String? title,
    String? yesLabel,
    String? noLabel,
  }) {
    return showDialog(
      context: context!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title!,
            style: robotoRegular.copyWith(
              color: blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          content: Text(
            "Note: Do you Want to Logout?",
            maxLines: 2,
            style: robotoRegular.copyWith(
              color: redColor,
              fontWeight: FontWeight.w300,
              fontSize: 14.6,
            ),
          ),
          actions: [
            CupertinoButton(
              child: Text(
                yesLabel!,
                style: robotoRegular.copyWith(
                  color: blueColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.6,
                ),
              ),
              onPressed: () {
                onTapYes!.call();
              },
            ),
            CupertinoButton(
              child: Text(
                noLabel!,
                style: robotoRegular.copyWith(
                  color: lightRedColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.6,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


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

class ProfileFields extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileFields({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25.8,
          ),
          const SizedBox(
            width: 25,
          ),
          Text(
            text,
            style: Utils.robotoRegular,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
