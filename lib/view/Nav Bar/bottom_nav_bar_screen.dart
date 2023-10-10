import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_ar/utills/App%20Routes/app_routes.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/view/Home/home_screen.dart';
import 'package:menu_ar/view/Profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      ProfileScreen(currentUserID: FirebaseAuth.instance.currentUser!.uid,),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        navBarStyle: NavBarStyle.neumorphic,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(1),
        ),
        navBarHeight: 60,
        backgroundColor: Utils.secondaryColor,
        items: [
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.home_filled, color: Utils.primaryColor,),
              inactiveIcon: const Icon(Icons.home_filled, color: Utils.greyColor),
              contentPadding: 10,
              routeAndNavigatorSettings: RouteAndNavigatorSettings(routes: AppRoutes.routes)),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.person_outlined, color: Utils.primaryColor,),
              inactiveIcon: const Icon(Icons.person_outlined, color: Utils.greyColor),
              contentPadding: 10,
              routeAndNavigatorSettings: RouteAndNavigatorSettings(routes: AppRoutes.routes)),
        ],
      ),
    );
  }
}
