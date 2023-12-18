import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_ar/model/user_model.dart';
import 'package:menu_ar/utills/App%20Routes/app_routes.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  final String currentUserID;

  ProfileScreen({super.key, required this.currentUserID});

  final authController = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Utils.appBarColor,
        title: Text(
          "Profile",
          style: Utils.robotoRegular.copyWith(
            color: Utils.blackColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: StreamBuilder<DocumentSnapshot>(
          stream: Utils().userRef.doc(currentUserID).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Shimmer.fromColors(
                            baseColor: Utils.whiteColor,
                            highlightColor: Utils.primaryColor.withOpacity(0.3),
                            child: const CircleAvatar(
                              backgroundColor: Utils.whiteColor,
                              radius: 60,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 30,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Utils.whiteColor,
                                highlightColor: Utils.primaryLightColor.withOpacity(0.3),
                                child: Container(
                                  height: 15,
                                  width: width,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Utils.whiteColor),
                                ),
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              Shimmer.fromColors(
                                baseColor: Utils.whiteColor,
                                highlightColor: Utils.primaryLightColor.withOpacity(0.3),
                                child: Container(
                                  height: 15,
                                  width: width,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Utils.whiteColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    //todo: Privacy Policy Button
                    Shimmer.fromColors(
                      baseColor: Utils.whiteColor,
                      highlightColor: Utils.primaryColor.withOpacity(0.3),
                      child: Container(
                        height: 40,
                        width: width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Utils.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    //todo: Help Button
                    Shimmer.fromColors(
                      baseColor: Utils.whiteColor,
                      highlightColor: Utils.primaryColor.withOpacity(0.3),
                      child: Container(
                        height: 40,
                        width: width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Utils.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    //todo: About Button
                    Shimmer.fromColors(
                      baseColor: Utils.whiteColor,
                      highlightColor: Utils.primaryColor.withOpacity(0.3),
                      child: Container(
                        height: 40,
                        width: width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Utils.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    //todo: Logout Button
                    Shimmer.fromColors(
                      baseColor: Utils.whiteColor,
                      highlightColor: Utils.primaryColor.withOpacity(0.3),
                      child: Container(
                        height: 40,
                        width: width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Utils.whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                  ],
                ),
              );
            }
            UserModel user = UserModel.fromDocumentSnapshot(documentSnapshot: snapshot.data!);
            log("ID: ${user.id}");
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor: Utils.primaryColor.withOpacity(0.8),
                          radius: 60,
                          child: SizedBox(
                            width: user.imageUrl! == "" ? 100 : 110,
                            height: user.imageUrl! == "" ? 100 : 110,
                            child: user.imageUrl! == ""
                                ? Image.asset(
                                    Utils.defaultImg,
                                    fit: BoxFit.cover,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: CachedNetworkImage(
                                      imageUrl: user.imageUrl!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.name}",
                              style: Utils.robotoRegular.copyWith(
                                color: Utils.blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.5,
                              ),
                            ),
                            Text(
                              "${user.email}",
                              style: Utils.robotoRegular.copyWith(
                                color: Utils.blackColor,
                                fontWeight: FontWeight.w100,
                                fontSize: 14.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 10,
                  ),
                  //todo: Privacy Policy Button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.PPScreen);
                    },
                    child: const ProfileFields(
                      icon: Icons.privacy_tip_outlined,
                      text: "Privacy Policy",
                    ),
                  ),
                  const SizedBox(
                    child: Divider(),
                  ),
                  //todo: About Button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.aboutUsScreen);
                    },
                    child: const ProfileFields(
                      icon: Icons.info_outline,
                      text: "About",
                    ),
                  ),
                  const SizedBox(
                    child: Divider(),
                  ), //todo: Help Button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.helpScreen);
                    },
                    child: const ProfileFields(
                      icon: Icons.help_outline,
                      text: "Help",
                    ),
                  ),
                  const SizedBox(
                    child: Divider(),
                  ),
                  //todo: Logout Button
                  GestureDetector(
                    onTap: () {
                      Utils().customDialogBox(
                        context: context,
                        title: "Log Out",
                        content: "Note: Do you Want to Logout?",
                        onTapYes: () {
                          authController.signOut(context: context);
                        },
                        yesLabel: "Confirm",
                        noLabel: "Cancel",
                      );
                    },
                    child: const ProfileFields(
                      icon: Icons.logout,
                      text: "Log Out",
                    ),
                  ),
                  const SizedBox(
                    child: Divider(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
