import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:menu_ar/model/user_model.dart';

class FirebaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool?> createNewUser(UserModel user) async {
    try {
      await firestore.collection("Users").doc(user.id).set({
        "id": user.id,
        "name": user.name,
        "email": user.email,
        "imageUrl": user.imageUrl,
        "phoneNo": user.phoneNum,
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

}