import 'package:flutter/material.dart';
import 'package:menu_ar/utills/utills.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Utils.secondaryColor,
        title: Text(
          "Help",
          style: Utils.robotoRegular.copyWith(
            color: Utils.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Utils.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Text(
            Utils.help_data,
            style: Utils.robotoRegular,
          ),
        ),
      ),
    );
  }
}
