import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menu_ar/model/near_by_restaurant.dart';
import 'package:menu_ar/utills/App%20Routes/app_routes.dart';
import 'package:menu_ar/utills/app_url.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/view/Home/components/view_full_screen.dart';
import 'package:menu_ar/view/Home/review_screen.dart';
import 'package:menu_ar/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class DetailRestaurantScreen extends StatefulWidget {
  final int? index;
  final Results nearByRestaurantModel;
  final lat;
  final long;
  final placeID;

  const DetailRestaurantScreen({super.key, required this.nearByRestaurantModel, this.index, this.lat, this.long, this.placeID});

  @override
  State<DetailRestaurantScreen> createState() => _DetailRestaurantScreenState();
}

class _DetailRestaurantScreenState extends State<DetailRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Utils.appBarColor,
        title: Text(
          "${widget.nearByRestaurantModel.name}",
          style: Utils.robotoRegular.copyWith(
            color: Utils.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Utils.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Utils.leftBoxColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl: widget.nearByRestaurantModel.icon.toString(),
                        width: width,
                        height: height,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Utils.rightBoxColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "Restaurant Name: ",
                                    style: Utils.robotoRegular.copyWith(
                                      color: Utils.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${widget.nearByRestaurantModel.name}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.whiteColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Rated By: ",
                                    style: Utils.robotoRegular.copyWith(
                                      color: Utils.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${widget.nearByRestaurantModel.scope}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.whiteColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Business Status: ",
                                    style: Utils.robotoRegular.copyWith(
                                      color: Utils.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${widget.nearByRestaurantModel.businessStatus}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.whiteColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Utils().customDialogBox(
                                    context: context,
                                    title: "Are you sure, you want to go to the map?",
                                    content: "",
                                    onTapYes: () {
                                      //homeViewModel.openMaps("${widget.nearByRestaurantModel.vicinity}");
                                      homeViewModel.openMaps(widget.lat, widget.long, widget.placeID);
                                    },
                                    yesLabel: "Confirm",
                                    noLabel: "Cancel",
                                  );
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: "Address: ",
                                      style: Utils.robotoRegular.copyWith(
                                        color: Utils.blackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${widget.nearByRestaurantModel.vicinity}",
                                          style: Utils.robotoRegular.copyWith(
                                            color: Utils.whiteColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Ratings: ",
                                      style: Utils.robotoRegular.copyWith(
                                        color: Utils.blackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${widget.nearByRestaurantModel.rating}",
                                          style: Utils.robotoRegular.copyWith(
                                            color: Utils.whiteColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3.0,
                                  ),
                                  RatingBar.builder(
                                    initialRating: double.parse(widget.nearByRestaurantModel.rating.toString()),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ReviewScreen(
                                        index: widget.index,
                                      ),
                                    ),
                                  );
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: "Review: ",
                                      style: Utils.robotoRegular.copyWith(
                                        color: Utils.blackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Check and Add",
                                          style: Utils.robotoRegular.copyWith(
                                            color: Utils.whiteColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Overview",
                        style: Utils.robotoRegular.copyWith(
                          color: Utils.blackColor,
                          fontSize: 18.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      widget.nearByRestaurantModel.photos == null
                          ? Center(
                              child: Text(
                                "No image yet",
                                style: Utils.robotoRegular.copyWith(
                                  color: Utils.blackColor,
                                  fontSize: 18.6,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          : Expanded(
                              child: GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: widget.nearByRestaurantModel.photos!.length,
                                itemBuilder: (context, index) {
                                  var photoReference = widget.nearByRestaurantModel.photos![index].photoReference;
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ViewFullImageScreen(
                                              "${AppURl.baseUrl}${AppURl.nearByPlacesPhotosUrl}?maxwidth=${width.round()}&maxheight=${height.round()}&photoreference=$photoReference&key=${Utils.googleApiKey}"),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "${AppURl.baseUrl}${AppURl.nearByPlacesPhotosUrl}?maxwidth=${width.round()}&maxheight=${height.round()}&photoreference=$photoReference&key=${Utils.googleApiKey}",
                                            width: width,
                                            height: height,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
