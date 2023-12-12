import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:menu_ar/view/Home/home_screen.dart';
import 'package:menu_ar/viewModel/auth_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final authViewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(vertical: height / 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 26,
              ),
              SizedBox(
                width: width / 1,
                child: Image.asset(
                  Utils.imgOnboarding,
                  height: height / 2,
                ),
              ),
              SizedBox(
                height: height / 10,
              ),
              Text(
                "Find your Comfort",
                style: Utils.robotoRegular.copyWith(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height / 100,
              ),
              Text(
                "Menu's here",
                style: Utils.robotoRegular.copyWith(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height / 26,
              ),
              Text(
                "Please Login to Continue",
                style: Utils.robotoRegular.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              authViewModel.isLoading.value
                  ? InkWell(
                      splashColor: Utils.primaryLightColor,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        authViewModel.signInWithGoogle(context: context);
                      },
                      child: Container(
                        width: width / 3,
                        height: height / 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(colors: [
                              Utils.primaryLightColor,
                              Utils.primaryColor,
                            ])),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                Utils.googleIcon,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Login",
                                style: Utils.robotoRegular.copyWith(fontSize: 16, color: Utils.whiteColor),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
