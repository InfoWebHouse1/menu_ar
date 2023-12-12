import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:menu_ar/data/response/api_response.dart';
import 'package:menu_ar/model/near_by_restaurant.dart';
import 'package:menu_ar/model/user_model.dart';
import 'package:menu_ar/repository/home_repo.dart';
import 'package:menu_ar/utills/app_url.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends ChangeNotifier {
  final _homeRepo = HomeRepository();
  String? _address;
  double? _longitude;
  double? _latitude;

  String? get address => _address;

  double? get longitude => _longitude;

  double? get latitude => _latitude;
  ApiResponse<NearByRestaurantModel> defaultRestaurantList = ApiResponse.loading();
  final commentController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<dynamic> _allData = [];

  List<dynamic> get allData => _allData;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<DocumentSnapshot?> getData({reviewID}) async {
    try {
      _isLoading == true;
      _allData.isEmpty;
      var dataOfItem = FirebaseFirestore.instance.collection("RestaurantReview").doc(reviewID).get().then((value) {
        _allData = value.get("review");
        notifyListeners();
        if (kDebugMode) {
          print("allData = $_allData");
        }
        // value.data()!.forEach((key, value) {
        //   _allData = value["review"];
        //   notifyListeners();
        //   if (kDebugMode) {
        //     print("allData = $_allData");
        //   }
        // });
      });
      // var dataOfItem = FirebaseFirestore.instance.collection('RestaurantReview').get().then(
      //   (QuerySnapshot? querySnapshot) {
      //     querySnapshot!.docs.forEach(
      //       (doc) {
      //         _allData = doc["review"];
      //         notifyListeners();
      //         if (kDebugMode) {
      //           print("allData = $_allData");
      //         }
      //         //  print("getData = ${doc["item_text_"]}");
      //       },
      //     );
      //   },
      // );
      _isLoading == false;
      return dataOfItem;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future createCommentInFirestore({commentID}) async {
    var user = await getUser(FirebaseAuth.instance.currentUser!.uid);
    FirebaseFirestore.instance.collection('RestaurantReview').doc(commentID).update({
      "id": commentID,
      "review": FieldValue.arrayUnion([
        {
          "comment": commentController.text,
          "email": "${user!.email}",
          "review": "2.5",
          "name": "${user.name}",
        }
      ])
    });
    commentController.clear();
  }

  Future getGeoLocation() async {
    try {
      Position position = await determinePosition();
      _latitude = position.latitude;
      notifyListeners();
      log("latitude: $_latitude");
      _longitude = position.longitude;
      notifyListeners();
      log("longitude: $_longitude");
      List<Placemark> coordinates = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placeMark = coordinates[0];
      String formatAddress = "${placeMark.subLocality}, ${placeMark.locality}";
      getAddress(formatAddress);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getUser(String? uid) async {
    try {
      DocumentSnapshot doc = await firestore.collection("Users").doc(uid!).get();
      return UserModel.fromDocumentSnapshot(documentSnapshot: doc);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("User Denied");
      }
    }
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  setRestaurantCardData(ApiResponse<NearByRestaurantModel> response) {
    defaultRestaurantList = response;
    notifyListeners();
    if (kDebugMode) {
      print("Response Status: $response");
    }
  }

  double setLatitude(double value) {
    _latitude = value;
    notifyListeners();
    return _latitude!;
  }

  double setLongitude(double value) {
    _longitude = value;
    notifyListeners();
    return _longitude!;
  }

  Future<void> fetchRestaurantResult({double? lat, double? long}) async {
    setRestaurantCardData(ApiResponse.loading());
    if (kDebugMode) {
      print("From Api: ${_homeRepo.fetchRestaurantResultApi(lat: setLatitude(lat!), long: setLongitude(long!))}");
    }
    await _homeRepo.fetchRestaurantResultApi(lat: setLatitude(lat!), long: setLongitude(long!)).then((value) {
      setRestaurantCardData(ApiResponse.completed(value));
      if (kDebugMode) {
        print("Data-fetch After Complete: ${value.results![0].name}");
      }
    }).onError((error, stackTrace) {
      setRestaurantCardData(ApiResponse.error(error.toString()));
    });
  }

  getAddress(String newAddress) {
    _address = newAddress;
    notifyListeners();
  }

  Future<void> openMaps(double lat,double lng, placeID) async {
    String mapUrl = '${AppURl.googleMapUrl}api=1&query=$lat,$lng&query_place_id=$placeID';

    if (await canLaunchUrl(Uri.parse(mapUrl))) {
      await launchUrl(Uri.parse(mapUrl));
    } else {
      throw 'Could not launch $mapUrl';
    }
  }
}
