import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/network/local/cache_helper.dart';
import 'package:toursim/network/remote/dio_helper.dart';
import 'package:toursim/presntation/add_place.dart';
import 'package:toursim/presntation/forget_password.dart';
import 'package:toursim/core/utils/app_theme.dart';
import 'package:toursim/presntation/home.dart';
import 'package:toursim/presntation/splash_view.dart';

import 'core/language/translate.dart';
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
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Get.isDarkMode?ThemeMode.dark:ThemeMode.light,
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: const Locale("en"),
      fallbackLocale: const Locale("en"),
      getPages: [
        GetPage(name: "/",page: () => const SplashView(),),
        GetPage(name: "/homeView",page: () =>  HomeView(),),
        GetPage(name: "/authView",page: () =>  AuthView(),),
        GetPage(name: "/forgetPassword",page: () =>  ForgetPassword(),),
        GetPage(name: "/govDetails",page: () =>  GovDetails()),
        GetPage(name: "/placeDetails",page: () =>  PlaceDetails(),),
        GetPage(name: "/addPlace",page: () =>   AddPlace(),),
      ],
    );
  }
}

