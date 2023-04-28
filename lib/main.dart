import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/home.dart';
import 'package:toursim/page-1/android-small-5.dart';
import 'package:toursim/splash_view.dart';

import 'login_view.dart';

void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: const FadeInImage(
            image:AssetImage("assets/images/splash2.jpg",) ,
            placeholder:AssetImage("assets/images/loading.gif",) ,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          nextScreen: LoginView(),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.black,
         ),
    );
  }
}

