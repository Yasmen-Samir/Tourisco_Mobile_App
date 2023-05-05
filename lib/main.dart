import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/network/local/cache_helper.dart';
import 'package:toursim/network/remote/dio_helper.dart';
import 'package:toursim/presntation/forget_password.dart';
import 'package:toursim/utils/assets_manager.dart';
import 'package:toursim/home.dart';
import 'package:toursim/splash_view.dart';
import 'package:toursim/utils/color_manager.dart';

import 'presntation/gov_details.dart';
import 'presntation/auth_view.dart';
import 'presntation/place_details.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
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
        GetPage(name: "/homeView",page: () =>  HomeView(),),
        GetPage(name: "/authView",page: () =>  AuthView(),),
        GetPage(name: "/forgetPassword",page: () =>  ForgetPassword(),),
        GetPage(name: "/govDetails",page: () =>  GovDetails()),
        GetPage(name: "/placeDetails",page: () =>  PlaceDetails(),),
      ],
    );
  }
}

