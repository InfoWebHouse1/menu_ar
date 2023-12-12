import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_ar/binding/auth_binding.dart';
import 'package:menu_ar/utills/App%20Routes/app_routes.dart';
import 'package:menu_ar/utills/utills.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menu_ar/view/Splash/splash_screen.dart';
import 'package:menu_ar/viewModel/auth_view_model.dart';
import 'package:menu_ar/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Menu AR',
        initialBinding: AuthBinding(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Utils.primaryColor),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splashScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
