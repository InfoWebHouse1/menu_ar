import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menu_ar/data/response/status.dart';
import 'package:menu_ar/model/restaurant_model.dart';
import 'package:menu_ar/utills/App%20Routes/app_routes.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/view/Home/detail_restaurant_screen.dart';
import 'package:menu_ar/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<RestaurantModel> dataModel = RestaurantModel.getListRest();

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  Future initLocation() async {
    try {
      await Provider.of<HomeViewModel>(context, listen: false).getGeoLocation();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    Provider.of<HomeViewModel>(context, listen: false).fetchRestaurantResult(lat: 31.5998633, long: 74.340345);
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Utils.appBarColor,
        title: Text(
          "MENU",
          style: Utils.robotoRegular.copyWith(
            color: Utils.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              Utils.imgLogo,
            ),
          ),
        ),
        actions: [
          Consumer<HomeViewModel>(
            builder: (context, value, child) {
              return Row(
                children: [
                  FittedBox(
                    child: Text(
                      "${value.address}",
                      textAlign: TextAlign.center,
                      style: Utils.robotoRegular.copyWith(
                        color: Utils.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.location_pin,
                    color: Utils.blackColor,
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          log("lat: ${homeViewModel.latitude}");
          log("long: ${homeViewModel.longitude}");
          return Provider.of<HomeViewModel>(context, listen: false).fetchRestaurantResult(lat: homeViewModel.latitude, long: homeViewModel.longitude);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Restaurants",
                textAlign: TextAlign.center,
                style: Utils.robotoRegular.copyWith(
                  color: Utils.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.75,
                    aspectRatio: 16 / 9,
                    enlargeFactor: 0.3,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(Utils.imgSlider1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(Utils.imgSlider2),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(Utils.imgSlider3),
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<HomeViewModel>(
                builder: (context, value, child) {
                  switch (value.defaultRestaurantList.status!) {
                    case Status.LOADING:
                      return const Center(child: CircularProgressIndicator());
                    case Status.ERROR:
                      return Text("Message Error: ${value.defaultRestaurantList.message!.toString()}");
                    case Status.COMPLETE:
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.defaultRestaurantList.data!.results!.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemBuilder: (context, index) {
                            return ListTile(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailRestaurantScreen(
                                      nearByRestaurantModel: value.defaultRestaurantList.data!.results![index],
                                      index: index,
                                      lat: value.defaultRestaurantList.data!.results![index].geometry!.location!.lat,
                                      long: value.defaultRestaurantList.data!.results![index].geometry!.location!.lng,
                                      placeID: value.defaultRestaurantList.data!.results![index].placeId,
                                    ),
                                  ),
                                );
                              },
                              tileColor: Utils.secondaryColor,
                              visualDensity: const VisualDensity(horizontal: 3.0, vertical: 3.0),
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundColor: Utils.rightBoxColor,
                                backgroundImage: NetworkImage(value.defaultRestaurantList.data!.results![index].icon.toString()),
                              ),
                              title: Text(
                                value.defaultRestaurantList.data!.results![index].name.toString(),
                                textAlign: TextAlign.left,
                                style: Utils.robotoRegular.copyWith(
                                  color: Utils.primaryColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              subtitle: value.defaultRestaurantList.data!.results![index].openingHours == null
                                  ? Text(
                                      "Not Specified",
                                      style: Utils.robotoRegular.copyWith(
                                        color: Utils.blackColor,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    )
                                  : RichText(
                                      text: TextSpan(
                                        text: "Opening Hour: ",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.blackColor,
                                          fontWeight: FontWeight.w100,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: value.defaultRestaurantList.data!.results![index].openingHours!.openNow == false ? "Close Now" : "Open Now",
                                            style: Utils.robotoRegular.copyWith(
                                              color: Utils.primaryColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            );
                          },
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
