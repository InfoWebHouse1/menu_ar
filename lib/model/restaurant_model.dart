class RestaurantModel {
  final String id;
  final String name;
  final String image;
  final double rating;
  final String description;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
  });

  static List<RestaurantModel> getListRest() => [
        RestaurantModel(
          id: "1",
          name: "Food Point",
          image: "assets/dummy/1.png",
          rating: 4.5,
          description: "This is an old food point with enrich taste",
        ),
        RestaurantModel(
          id: "2",
          name: "Lahore Charsi Tikka",
          image: "assets/dummy/2.png",
          rating: 4,
          description: "This is an old food point with enrich taste",
        ),
        RestaurantModel(
          id: "3",
          name: "Butt Karahi",
          image: "assets/dummy/3.png",
          rating: 4.5,
          description: "This is an old food point with enrich taste",
        ),
        RestaurantModel(
          id: "4",
          name: "Rizwan Food",
          image: "assets/dummy/4.png",
          rating: 3.5,
          description: "This is an old food point with enrich taste",
        ),
        RestaurantModel(
          id: "5",
          name: "Shah Restaurant",
          image: "assets/dummy/5.png",
          rating: 2.5,
          description: "This is an old food point with enrich taste",
        ),
        RestaurantModel(
          id: "6",
          name: "Ice Cream Parlor",
          image: "assets/dummy/6.png",
          rating: 4.5,
          description: "This is an old food point with enrich taste",
        ),
      ];
}
