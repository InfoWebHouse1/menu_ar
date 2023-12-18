import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  int? index;
  ReviewScreen({super.key, this.index});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    if(widget.index == 0){
      Provider.of<HomeViewModel>(context, listen: false).getData(reviewID: "P2YyYVXddtu7RP82sC8k");
    }else if(widget.index == 1){
      Provider.of<HomeViewModel>(context, listen: false).getData(reviewID: "5VSCRSDcIgAZXCQMlGIS");
    }else if(widget.index == 2){
      Provider.of<HomeViewModel>(context, listen: false).getData(reviewID: "n51P2PPUeY9KPpDslMFc");
    }else if(widget.index == 3){
      Provider.of<HomeViewModel>(context, listen: false).getData(reviewID: "CzZ3Viv1KtqA6LfmWzug");
    }else if(widget.index == 4){
      Provider.of<HomeViewModel>(context, listen: false).getData(reviewID: "TxuP5ALxHCIuvG4U4ymB");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("index: ${widget.index}");
    }
    var homeProvide = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Utils.secondaryColor,
        title: Text(
          "Review",
          style: Utils.robotoRegular.copyWith(
            color: Utils.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () => Navigator.of(context).pop(),
        //   icon: const Icon(
        //     Icons.arrow_back_ios_new,
        //     color: Utils.primaryColor,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          ListTile(
            title: TextFormField(
              controller: homeProvide.commentController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Write a Review....",
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.4,
                ),
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  if(widget.index == 0){
                    homeProvide.createCommentInFirestore(commentID: "P2YyYVXddtu7RP82sC8k");
                  }else if(widget.index == 1){
                    homeProvide.createCommentInFirestore(commentID: "5VSCRSDcIgAZXCQMlGIS");
                  }else if(widget.index == 2){
                    homeProvide.createCommentInFirestore(commentID: "n51P2PPUeY9KPpDslMFc");
                  }else if(widget.index == 3){
                    homeProvide.createCommentInFirestore(commentID: "CzZ3Viv1KtqA6LfmWzug");
                  }else if(widget.index == 4){
                    homeProvide.createCommentInFirestore(commentID: "TxuP5ALxHCIuvG4U4ymB");
                  }
                },
                icon: const Icon(Icons.comment),
                color: Utils.primaryColor),
          ),
          const Divider(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return Provider.of<HomeViewModel>(context, listen: false).getData();
              },
              child: Consumer<HomeViewModel>(
                builder: (context, value, child) {
                  return value.isLoading == true
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: value.allData.length,
                          itemBuilder: (context, index) {
                            var data = value.allData[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                tileColor: Utils.whiteColor,
                                title: RichText(
                                  text: TextSpan(
                                    text: capitalizeFirstLetter(data["name"]),
                                    style: Utils.robotoRegular.copyWith(
                                      color: Utils.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "\t\t\t${data["email"]}",
                                        style: Utils.robotoRegular.copyWith(
                                          color: Utils.primaryColor.withOpacity(0.8),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Text(
                                  "${data["comment"]}",
                                  style: Utils.robotoRegular.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Utils.blackColor,
                                  ),
                                ),
                                trailing: RatingBar.builder(
                                  initialRating: double.parse(data["review"]),
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
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }

    return text[0].toUpperCase() + text.substring(1);
  }
}
