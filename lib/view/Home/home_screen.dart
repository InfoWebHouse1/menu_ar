import 'package:flutter/material.dart';
import 'package:menu_ar/model/restaurant_model.dart';
import 'package:menu_ar/utills/utills.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<RestaurantModel> dataModel = RestaurantModel.getListRest();

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
          "MENU",
          style: Utils.robotoRegular.copyWith(
            color: Utils.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(
              Icons.document_scanner,
              color: Utils.primaryColor,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              Text(
                "RESTAURANTS",
                textAlign: TextAlign.center,
                style: Utils.robotoRegular.copyWith(
                  color: Utils.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: dataModel.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){

                        },
                        tileColor: Utils.secondaryColor,
                        visualDensity: const VisualDensity(horizontal: 3.0, vertical: 3.0),
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundColor: Utils.primaryColor,
                          backgroundImage: AssetImage(dataModel[index].image),
                        ),
                        title: Text(
                          dataModel[index].name,
                          textAlign: TextAlign.left,
                          style: Utils.robotoRegular.copyWith(
                            color: Utils.primaryColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        subtitle: Text(
                          dataModel[index].description.trim(),
                          textAlign: TextAlign.left,
                          style: Utils.robotoRegular.copyWith(
                            color: Utils.greyColor,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
