import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menu_ar/model/near_by_restaurant.dart';
import 'package:menu_ar/utills/app_url.dart';
import 'package:menu_ar/utills/utills.dart';

class DetailRestaurantScreen extends StatefulWidget {
  final Results nearByRestaurantModel;

  const DetailRestaurantScreen({super.key, required this.nearByRestaurantModel});

  @override
  State<DetailRestaurantScreen> createState() => _DetailRestaurantScreenState();
}

class _DetailRestaurantScreenState extends State<DetailRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Utils.secondaryColor,
        title: Text(
          "${widget.nearByRestaurantModel.name}",
          style: Utils.robotoRegular.copyWith(
            color: Utils.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Utils.primaryColor,
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
                color: Utils.primaryColor,
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
                        color: Utils.secondaryColor,
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
                                      color: Utils.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${widget.nearByRestaurantModel.name}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.greyColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Rated By: ",
                                    style: Utils.robotoRegular.copyWith(
                                      color: Utils.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${widget.nearByRestaurantModel.scope}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.greyColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Business Status: ",
                                    style: Utils.robotoRegular.copyWith(
                                      color: Utils.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${widget.nearByRestaurantModel.businessStatus}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.greyColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Address: ",
                                    style: Utils.robotoRegular.copyWith(
                                      color: Utils.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${widget.nearByRestaurantModel.vicinity}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.greyColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ]),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "Ratings: ",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "${widget.nearByRestaurantModel.rating}",
                                            style: Utils.robotoRegular.copyWith(
                                              color: Utils.greyColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ]),
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
                          color: Utils.primaryColor,
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
                                  color: Utils.greyColor,
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
                                  return SizedBox(
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
