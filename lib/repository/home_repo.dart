import 'package:flutter/foundation.dart';
import 'package:menu_ar/data/network/base_ApiServices.dart';
import 'package:menu_ar/data/network/network_ApiServices.dart';
import 'package:menu_ar/model/near_by_restaurant.dart';
import 'package:menu_ar/utills/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<NearByRestaurantModel> fetchRestaurantResultApi() async {
    try {
      var response = await _apiServices.getGetApiResponse(
        AppURl.nearByPlacesUrl,
      );
      if (kDebugMode) {
        print("Data Resp: $response");
      }
      return response = NearByRestaurantModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
