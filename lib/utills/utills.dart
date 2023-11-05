import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  /// google APi
  static const googleApiKey = "AIzaSyBKZIi4t2Am1SdHAqNQD58B1m-uLA69mtE";

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
  static String burgerImg = "assets/images/burger.png";
  //static String burgerModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/burger_model.glb?alt=media&token=2cba7d11-4767-444b-965c-c1159886bcae&_gl=1*1sdxci5*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzMDM4Ny4xLjEuMTY5OTEzMDYzOC4zLjAuMA..";
  static String burgerModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/uploads_files_2465920_burger_merged.glb?alt=media&token=43e1d64f-e868-4cf0-8794-156b79c4fddb&_gl=1*ykk2ty*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzNTQ0Ni4yLjEuMTY5OTEzNTQ2MS40NS4wLjA.";
  static String zingerImg = "assets/images/zinger_burger.png";
  static String zingerModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/zinger_burger.obj?alt=media&token=99752e85-3489-4391-bbe8-f053c20e19dd&_gl=1*10i9n3p*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzMDM4Ny4xLjEuMTY5OTEzMTU5Ny42MC4wLjA.";
  static String friesImg = "assets/images/fries.png";
  //static String friesModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/French%20Fries.obj?alt=media&token=7f28b84b-7598-480f-9c8e-13eecd09f959&_gl=1*laktq6*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzMDM4Ny4xLjEuMTY5OTEzMDg3MS42MC4wLjA.";
  static String friesModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/uploads_files_3313652_FRENCH%2BFRIES.glb?alt=media&token=48005488-bdfa-431e-9b2a-897bda6a989d&_gl=1*1ez6hyi*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzOTYwOC4zLjEuMTY5OTEzOTYxOS40OS4wLjA.";
  static String shawarmaImg = "assets/images/shawarma.png";
  static String sandwichImg = "assets/images/club_sandwich.png";
  static String sandwichModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/uploads_files_2721833_Loaf%2Bof%2BBread.glb?alt=media&token=6c6f2c85-eeeb-4c48-80c6-0e37a07ea2bd&_gl=1*17zi558*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTE0MzMxMS40LjEuMTY5OTE0MzMyMy40OC4wLjA.";

  /// font
  static const TextStyle robotoRegular = TextStyle(
    fontFamily: "RobotoRegular",
  );

  /// Custom Dialog Box
  customDialogBox({
    required BuildContext context,
    VoidCallback? onTapYes,
    String? title,
    String? yesLabel,
    String? noLabel,
  }) {
    return showDialog(
      context: context,
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
