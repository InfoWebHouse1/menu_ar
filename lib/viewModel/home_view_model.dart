import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:menu_ar/data/response/api_response.dart';
import 'package:menu_ar/model/near_by_restaurant.dart';
import 'package:menu_ar/repository/home_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final _homeRepo = HomeRepository();
  String? _address;
  String? _longitude;
  String? _latitude;

  String? get address => _address;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  ApiResponse<NearByRestaurantModel> defaultRestaurantList = ApiResponse.loading();

  setRestaurantCardData(ApiResponse<NearByRestaurantModel> response) {
    defaultRestaurantList = response;
    notifyListeners();
    if (kDebugMode) {
      print("Response Status: $response");
    }
  }

  Future<void> fetchRestaurantResult() async {
    setRestaurantCardData(ApiResponse.loading());
    if (kDebugMode) {
      print("From Api: ${_homeRepo.fetchRestaurantResultApi()}");
    }
    _homeRepo.fetchRestaurantResultApi().then((value) {
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

  Future getGeoLocation() async {
    try{
      Position position = await determinePosition();
      _latitude = position.latitude.toString();
      notifyListeners();
      log("latitude: $_latitude");
      _longitude = position.longitude.toString();
      notifyListeners();
      log("latitude: $_longitude");
      List<Placemark> coordinates = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placeMark = coordinates[0];
      String formatAddress = "${placeMark.locality}, ${placeMark.country}";
      getAddress(formatAddress);
    }catch (e){
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
}
