import 'package:flutter/material.dart';
import 'package:menu_ar/utills/utills.dart';

class ResultTextScreen extends StatefulWidget {
  String? text;

  ResultTextScreen({super.key, this.text});

  @override
  State<ResultTextScreen> createState() => _ResultTextScreenState();
}

class _ResultTextScreenState extends State<ResultTextScreen> {
  String? resultMessage;

  bool? isWordFound;

  @override
  void initState() {
    super.initState();
    isWordFound = false;
  }

  @override
  Widget build(BuildContext context) {
    //String paragraph = "This is a sample paragraph for scanning text in Flutter.";
    String targetWord = "burger"; // Change this to the word you want to find

    List<String> scanTexts = widget.text!.split(' ');
    for (String word in scanTexts) {
      if (word.toLowerCase() == targetWord.toLowerCase()) {
        isWordFound = true;
        break;
      }
    }

    // Display the result
    //resultMessage = isWordFound! ? "The word '$targetWord' was found in the paragraph." : "The word '$targetWord' was not found in the paragraph.";
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Utils.secondaryColor,
        title: Text(
          "Result",
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
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: isWordFound == true ?  Image.asset(Utils.burgerImg) : const Text("No Matching"),
      ),
    );
  }
}
