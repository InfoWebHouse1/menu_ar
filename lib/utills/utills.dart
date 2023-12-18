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

  // /// colors
  // static const primaryColor = Color(0xFF9D432C);
  // static const primaryLightColor = Color(0xFFCDA788);
  // static const secondaryColor = Color(0xFFDB7B50);
  // static const backgroundColor = Color(0xFFEDD6C4);
  // static const blackColor = Color(0xFF000000);
  // static const whiteColor = Colors.white;
  // static const blueColor = Color(0XFF1886E7);
  // static const redColor = Color(0XFFBE2020);
  // static const lightRedColor = Color(0XFFFF5454);
  /// colors
  static const primaryColor = Color(0xFFcc0000);
  static const appBarColor = Color(0xFFcc0000);
  static const bottomBarColor = Color(0xFFcc0000);
  static const primaryLightColor = Color(0xFFCDA788);
  static const secondaryColor = Color(0XFFeeeeee);
  static const backgroundColor = Color(0xFFf8f8f8);
  static const blackColor = Color(0xFF000000);
  static const whiteColor = Colors.white;
  static const blueColor = Color(0XFF1886E7);
  static const redColor = Color(0XFFBE2020);
  static const lightRedColor = Color(0XFFFF5454);
  static const leftBoxColor = Color(0XFFeeeeee);
  static const rightBoxColor = Color(0XFFee0000);

  /// Slider
  static String imgSlider1 = "assets/images/1.jpg";
  static String imgSlider2 = "assets/images/2.jpg";
  static String imgSlider3 = "assets/images/3.jpg";

  /// logo
  static String imgLogo = "assets/images/logo.png";
  /// images
  static String imgOnboarding = "assets/images/img_login.png";
  static String imgSplash = "assets/images/img_splash.png";
  static String googleIcon = "assets/images/google_icon.png";
  static String defaultImg = "assets/images/cartoon.png";
  static String burgerImg = "assets/images/burger.png";

  //static String burgerModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/burger_model.glb?alt=media&token=2cba7d11-4767-444b-965c-c1159886bcae&_gl=1*1sdxci5*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzMDM4Ny4xLjEuMTY5OTEzMDYzOC4zLjAuMA..";
  static String burgerModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/uploads_files_2465920_burger_merged.glb?alt=media&token=43e1d64f-e868-4cf0-8794-156b79c4fddb&_gl=1*ykk2ty*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzNTQ0Ni4yLjEuMTY5OTEzNTQ2MS40NS4wLjA.";
  static String zingerImg = "assets/images/zinger_burger.png";
  static String zingerModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/zinger_burger.obj?alt=media&token=99752e85-3489-4391-bbe8-f053c20e19dd&_gl=1*10i9n3p*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzMDM4Ny4xLjEuMTY5OTEzMTU5Ny42MC4wLjA.";
  static String friesImg = "assets/images/fries.png";

  //static String friesModel = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/French%20Fries.obj?alt=media&token=7f28b84b-7598-480f-9c8e-13eecd09f959&_gl=1*laktq6*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzMDM4Ny4xLjEuMTY5OTEzMDg3MS42MC4wLjA.";
  static String friesModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/uploads_files_3313652_FRENCH%2BFRIES.glb?alt=media&token=48005488-bdfa-431e-9b2a-897bda6a989d&_gl=1*1ez6hyi*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTEzOTYwOC4zLjEuMTY5OTEzOTYxOS40OS4wLjA.";
  static String shawarmaImg = "assets/images/shawarma.png";
  static String sandwichImg = "assets/images/club_sandwich.png";
  static String sandwichModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/uploads_files_2721833_Loaf%2Bof%2BBread.glb?alt=media&token=6c6f2c85-eeeb-4c48-80c6-0e37a07ea2bd&_gl=1*17zi558*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTE0MzMxMS40LjEuMTY5OTE0MzMyMy40OC4wLjA.";
  static String cheeseBurgerImg = "assets/images/deal.PNG";
  static String cheeseBurgerModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/deal.glb?alt=media&token=d31b70dc-d495-4d96-9d5c-eab48d83e1c5";
  static String dealImg = "assets/images/deal1.PNG";
  static String dealModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/mcdonalds_lunch.glb?alt=media&token=c0203554-1179-4992-9bbe-cf6c62ac2a4f";
  static String doublePettyBurgerImg = "assets/images/pettyBurger.PNG";
  static String doublePettyBurgerModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/king.glb?alt=media&token=061f2ac2-3bef-4d2b-a6d2-1405b28044ae";
  static String coffeeCupImg = "assets/images/coffee_cup.PNG";
  static String coffeeCupModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/Paper%20cup.glb?alt=media&token=e85b99dd-456c-40ee-9b9d-3d91b6b793a7&_gl=1*1p6bu9p*_ga*MTc0MDM1NDc5MC4xNjk5MTMwMzg3*_ga_CW55HF8NVT*MTY5OTMyNzY2Ny41LjEuMTY5OTMyOTI0My41MC4wLjA.";
  static String pizzaImg = "assets/images/pizza.PNG";
  static String pizzaModel =
      "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/pizza.glb?alt=media&token=ffed66cb-020b-4451-9b9a-74cfa019b21d";

  /// qr Code
  static String qrScanCode = "https://firebasestorage.googleapis.com/v0/b/menu-ar-52c3a.appspot.com/o/AR%20Menu.pdf?alt=media&token=4f3dda73-7b44-4979-b3f9-898fe663a483";
  /// privacy Text
  static String privacy_data = """
Privacy Policy for MenuAR
This Privacy Policy was last updated on 15 Nov 2023
1. Introduction
Welcome to MenuAR ("we," "us," or "our"). This Privacy Policy is designed to help you understand how we collect, use, share, and safeguard your personal information when you use our augmented reality application.
2. Information We Collect
\t2.1 Information You Provide
When you use MenuAR, we may collect information that you voluntarily provide, such as your name, email address, and other contact details. This information is used to enhance your experience with our app.
\t2.2 Information Collected Automatically
We may also collect certain information automatically when you use our app, including but not limited to device information, location data, and usage statistics. This information helps us improve our services and user experience.
3. How We Use Your Information
We use the information we collect for various purposes, including:
•   Providing and improving our app
•   Personalizing your experience
•   Analyzing usage patterns
•   Sending you relevant communications
4. Sharing Your Information
We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as described in this Privacy Policy.
5. Third-Party Links and Services
Our app may contain links to third-party websites or services. We are not responsible for the privacy practices or content of these third-party sites.
6. Security
We take reasonable measures to protect the information we collect from unauthorized access or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure.
7. Changes to this Privacy Policy
We reserve the right to update this Privacy Policy at any time. We will notify you of any changes by posting the new Privacy Policy on this page.
8. Contact Us
If you have any questions or concerns about this Privacy Policy, please contact us at [your contact information].
By using MenuAR, you agree to the terms outlined in this Privacy Policy.
""";

  /// about us
  static String aboutUs_data = """
Welcome to MenuAR, where technology meets gastronomy in an immersive dining experience!

Our Mission
At MenuAR, our mission is to revolutionize the way you explore and interact with restaurant menus. We believe that dining is not just about satisfying your hunger but creating a memorable and visually delightful experience.

What Sets Us Apart
Innovation in Every Bite: We bring innovation to the table, quite literally! With our augmented reality technology, we transform traditional menus into a visual feast, allowing you to preview dishes in stunning 3D models before making your selection.

Enhancing Dining Experiences: We understand that dining is a multisensory journey, and our app is designed to heighten your culinary adventure. Immerse yourself in a world where the virtual and real merge seamlessly, enhancing your connection with food.

How It Works
Simply scan a restaurant's menu card with MenuAR, and watch as the dishes come to life in vivid detail. Explore each plate, visualize ingredients, and get a sneak peek into the culinary artistry behind every creation.

Our Commitment to Privacy
Your privacy is of utmost importance to us. We adhere to strict privacy standards, ensuring that your personal information is handled with care and only used to enhance your experience with our app. For more details, please refer to our Privacy Policy.

Join Us on This Journey
Embark on a culinary journey like never before. Join us in embracing the future of dining, where technology and taste unite to create unforgettable moments.

Thank you for choosing MenuAR. Let's explore, indulge, and savor together!

Feel free to customize the content based on the specific features, values, and goals of your app.
  """;

  static String help_data = """
Help Center
Getting Started
1. Download and Installation:
•   Visit the App Store/Google Play Store.
•   Search for "MenuAR" and download the app.
•   Install the app on your device.
2. Account Setup:
•   Open the app and follow the on-screen instructions to set up your account.
•   Provide the necessary information, including your name and email address.
Using MenuAR
1. Menu Scanning:
•   Open the app and grant camera permissions.
•   Point your device's camera at the restaurant's menu card.
•   Hold steady as the app scans the menu, bringing 3D models to life.
2. Exploring Dishes:
•   Tap on a dish to explore it in detail.
•   Swipe to rotate the 3D model.
•   Pinch to zoom in for a closer look.
3. Making Selections:
•   Once you've found a dish you love, tap to view additional details.
•   Make your selection and place your order with the restaurant.
Troubleshooting
1. Camera Issues:
•   Ensure camera permissions are enabled for the app.
•   Clean your camera lens for optimal scanning.
2. App Crashes:
•   Update the app to the latest version.
•   Restart your device if the issue persists.
3. Connectivity Problems:
•   Check your internet connection.
•   If using AR features, ensure your device supports AR capabilities.
Privacy and Security
1. Protecting Your Privacy:
•   Read our Privacy Policy to understand how we handle your data.
•   Adjust privacy settings in the app as needed.
2. Security Measures:
•   Learn about the security measures we've implemented to protect your information.
Contact Us
For further assistance or inquiries, contact our support team at [support@[YourAppName].com]. We're here to help!
FAQs
Visit our [FAQs] section for answers to common questions.
 
Feel free to customize the content based on the specific functionalities and features of your AR restaurant menu app. Providing a user-friendly and informative help section will contribute to a positive user experience.
Regenerate   
   """;

  /// font
  static const TextStyle robotoRegular = TextStyle(
    fontFamily: "RobotoRegular",
  );

  /// Custom Dialog Box
  customDialogBox({
    required BuildContext context,
    VoidCallback? onTapYes,
    String? title,
    String? content,
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
            content!,
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
      )
        ..show(context),
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
