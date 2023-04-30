import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/utils/assets_manager.dart';
import 'package:toursim/home.dart';
import 'package:toursim/page-1/android-small-5.dart';
import 'package:toursim/splash_view.dart';
import 'package:toursim/utils/color_manager.dart';

import 'login_view.dart';
import 'utils/presntation/forget_password.dart';

void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: ColorsManager.primary,
        primarySwatch: ColorsManager.primarySwatch,
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/",page: () => const SplashView(),),
        GetPage(name: "/authView",page: () => const AuthView(),),
        GetPage(name: "/forgetPassword",page: () => const ForgetPassword(),),
      ],
    );
  }
}

