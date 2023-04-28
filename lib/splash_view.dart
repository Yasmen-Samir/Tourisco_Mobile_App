import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toursim/home.dart';

import 'assets_manager.dart';


class SplashView extends StatelessWidget {

  Timer? _timer;

  SplashView({super.key});

  _startDelay() async {
    await Future.delayed(Duration(seconds: 5));
    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
     //      Get.toNamed("/home");
  }


  @override
  Widget build(BuildContext context) {
    _startDelay();
    return   Scaffold(
      body: Center(
        child:Image.asset("assets/images/splash2.jpg",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,) ,
      ),
    );
  }
}
