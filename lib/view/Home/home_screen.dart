import 'package:flutter/material.dart';
import 'package:menu_ar/utills/utills.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: const Scaffold(
        backgroundColor: Utils.backgroundColor,
        body: Center(child: Text("Home Screen"),),
      ),
    );
  }
}
