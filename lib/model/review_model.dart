import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel{
  String? id;
  Map? review;

  ReviewModel({this.id, this.review});

  ReviewModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.get("id");
    review = documentSnapshot.get("review");

  }

  Map toMap(ReviewModel userModel) {
    var data = <String, dynamic>{};
    data["id"] = userModel.id;
    data["review"] = userModel.review;
    return data;
  }

  ReviewModel.fromMap(Map<String, dynamic> mapData) {
    id = mapData["id"];
    review = mapData["review"];
  }
}