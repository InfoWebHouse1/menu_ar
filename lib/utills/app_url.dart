class AppURl {

  static var baseUrl = "https://maps.googleapis.com";
  static var nearByPlacesUrl = "$baseUrl/maps/api/place/nearbysearch/json?"
      "location=31.5998633,74.340345"
      "&radius=1000.0"
      "&type=restaurant"
      "&key=AIzaSyBKZIi4t2Am1SdHAqNQD58B1m-uLA69mtE";
  static var nearByPlacesPhotosUrl = "/maps/api/place/photo";
}