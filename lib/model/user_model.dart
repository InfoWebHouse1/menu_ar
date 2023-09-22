import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? imageUrl;
  String? phoneNum;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.imageUrl,
    this.phoneNum,
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.get("id");
    name = documentSnapshot.get("name");
    email = documentSnapshot.get("email");
    imageUrl = documentSnapshot.get("imageUrl");
    phoneNum = documentSnapshot.get("phoneNo");
  }

}