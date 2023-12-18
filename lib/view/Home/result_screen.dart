import 'package:flutter/material.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/view/Home/ar_view.dart';

class ResultTextScreen extends StatefulWidget {
  //String? text;

  ResultTextScreen({super.key});

  @override
  State<ResultTextScreen> createState() => _ResultTextScreenState();
}

class _ResultTextScreenState extends State<ResultTextScreen> {
  // String? resultMessage;
  //
  // bool? isWordFound;

  @override
  void initState() {
    super.initState();
    //isWordFound = false;
  }

  @override
  Widget build(BuildContext context) {
    // String targetWord = "burger";
    //
    // List<String> scanTexts = resultMessage!.split(' ');
    // for (String word in scanTexts) {
    //   if (word.toLowerCase() == targetWord.toLowerCase()) {
    //     isWordFound = true;
    //     break;
    //   }
    // }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Burger",
                style: Utils.robotoRegular.copyWith(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ARViewScreen(
                          valueItem: Utils.burgerModel,
                        ), //(text: recognizedText.text),
                      ),
                    );
                  },
                  child: Image.asset(Utils.burgerImg),
                ),
              ),
              // Text(
              //   "Zinger Burger",
              //   style: Utils.robotoRegular.copyWith(
              //     fontSize: 14.6,
              //     fontWeight: FontWeight.w300,
              //   ),
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: 150,
              //   child: GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (BuildContext context) => ARViewScreen(
              //               valueItem: Utils.zingerModel,
              //             ), //(text: recognizedText.text),
              //           ),
              //         );
              //       },
              //       child: Image.asset(Utils.zingerImg)),
              // ),
              Text(
                "Fries",
                style: Utils.robotoRegular.copyWith(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ARViewScreen(
                            valueItem: Utils.friesModel,
                          ), //(text: recognizedText.text),
                        ),
                      );
                    },
                    child: Image.asset(Utils.friesImg)),
              ),
              // Text(
              //   "Shawarma",
              //   style: Utils.robotoRegular.copyWith(
              //     fontSize: 14.6,
              //     fontWeight: FontWeight.w300,
              //   ),
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: 150,
              //   child: GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (BuildContext context) => ARViewScreen(
              //               valueItem: Utils.shawarmaImg,
              //             ), //(text: recognizedText.text),
              //           ),
              //         );
              //       },
              //       child: Image.asset(Utils.shawarmaImg)),
              // ),
              // Text(
              //   "Sandwich",
              //   style: Utils.robotoRegular.copyWith(
              //     fontSize: 14.6,
              //     fontWeight: FontWeight.w300,
              //   ),
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: 150,
              //   child: GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (BuildContext context) => ARViewScreen(
              //               valueItem: Utils.sandwichModel,
              //             ), //(text: recognizedText.text),
              //           ),
              //         );
              //       },
              //       child: Image.asset(Utils.sandwichImg)),
              // ),
              Text(
                "Cheese Burger",
                style: Utils.robotoRegular.copyWith(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ARViewScreen(
                            valueItem: Utils.cheeseBurgerModel,
                          ), //(text: recognizedText.text),
                        ),
                      );
                    },
                    child: Image.asset(Utils.cheeseBurgerImg)),
              ),
              Text(
                "Double Petty Burger",
                style: Utils.robotoRegular.copyWith(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ARViewScreen(
                            valueItem: Utils.doublePettyBurgerModel,
                          ), //(text: recognizedText.text),
                        ),
                      );
                    },
                    child: Image.asset(Utils.doublePettyBurgerImg)),
              ),
              Text(
                "Pizza",
                style: Utils.robotoRegular.copyWith(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ARViewScreen(
                            valueItem: Utils.pizzaModel,
                          ), //(text: recognizedText.text),
                        ),
                      );
                    },
                    child: Image.asset(Utils.pizzaImg)),
              ),
              Text(
                "Coffee Cup",
                style: Utils.robotoRegular.copyWith(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ARViewScreen(
                            valueItem: Utils.coffeeCupModel,
                          ), //(text: recognizedText.text),
                        ),
                      );
                    },
                    child: Image.asset(Utils.coffeeCupImg)),
              ),
              Text(
                "Deal",
                style: Utils.robotoRegular.copyWith(
                  fontSize: 14.6,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ARViewScreen(
                            valueItem: Utils.dealModel,
                          ), //(text: recognizedText.text),
                        ),
                      );
                    },
                    child: Image.asset(Utils.dealImg)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
