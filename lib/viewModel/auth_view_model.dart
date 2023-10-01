
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:menu_ar/model/user_model.dart';
import 'package:menu_ar/services/firebase_services.dart';
import 'package:menu_ar/utills/App%20Routes/app_routes.dart';
import 'package:menu_ar/view/Home/home_screen.dart';

class AuthViewModel extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  User? get user => firebaseUser.value;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(auth.authStateChanges());
    super.onInit();
  }

  Future<String> signInWithGoogle({required BuildContext context}) async {
    String retVal = "Error";
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    UserModel user = UserModel();
    try {
      isLoading.value = false;
      update();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      UserCredential authResult = await auth.signInWithCredential(credential);
      if (authResult.additionalUserInfo!.isNewUser) {
        user.id = authResult.user!.uid;
        user.name = authResult.user!.displayName;
        user.email = authResult.user!.email;
        user.imageUrl = authResult.user!.photoURL;
        user.phoneNum = authResult.user!.phoneNumber;
        FirebaseServices().createNewUser(user);
      }
      await Navigator.pushNamed(context, AppRoutes.bottomAppBarScreen);
      retVal = "Success";
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    isLoading.value = true;
    update();
    return retVal;
  }
}