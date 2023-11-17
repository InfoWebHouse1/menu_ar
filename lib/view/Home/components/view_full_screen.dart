import 'package:flutter/material.dart';
import 'package:menu_ar/utills/utills.dart';

class ViewFullImageScreen extends StatelessWidget {
  const ViewFullImageScreen(this.url, {super.key});

  final url;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Utils.backgroundColor,
        appBar: AppBar(
          backgroundColor: Utils.backgroundColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Utils.primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: 'image',
            child: Image.network(
              url.toString(),
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}
