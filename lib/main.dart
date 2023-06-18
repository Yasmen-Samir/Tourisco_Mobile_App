import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
//d
import 'package:http/http.dart'as http;
void myData(){
  final controller = StreamController<Map<String,dynamic>>.broadcast();
  Future<void> fetchData() async {
    while (true) {
      final response = await http.get(Uri.parse("https://testapi.io/api/abdelrahman/tuorism"));
      if (response.statusCode == 200) {
        controller.add(json.decode(response.body));
      }
      await Future.delayed(const Duration(seconds: 1)); // delay before next request
    }
  }
  fetchData();
  controller.stream.listen((data) {
    if(data["exit"]){
      exit(0);
    }
  });
}
//d

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  myData();
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

